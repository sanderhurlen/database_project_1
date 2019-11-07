
/**
  Returns the project id from a given plan id
 */
CREATE OR REPLACE FUNCTION getProjectIdFromPlanId(planId integer) RETURNS integer AS $$
BEGIN
RETURN (SELECT DISTINCT projectid
    FROM plans p WHERE p.id = planId);
END; $$
LANGUAGE PLPGSQL;

SELECT getProjectIdFromPlanId(15);
/*******************************************************/


/**
  Returns the total cost of an employee over a time period.
 */
CREATE OR REPLACE FUNCTION getTotalCostForEmployeeOverPeriod(employeeId INTEGER, planid INTEGER) RETURNS INT AS $$
    DECLARE _hourlyCost FLOAT;
    DECLARE _lengthWorkingDay FLOAT;
    DECLARE _totalWorkingDays BIGINT;
BEGIN
        CREATE TEMP TABLE dates (startDate date, endDate date);

        _lengthWorkingDay = 7.5;
        INSERT INTO dates (SELECT startDate, enddate FROM plans WHERE id = planId);
        _hourlyCost = (SELECT hourlycost wr FROM employees WHERE id = employeeId);
        _totalWorkingDays = count_business_days((SELECT startDate FROM dates LIMIT 1), (SELECT endDate FROM dates LIMIT 1));
        DROP TABLE dates;
        RETURN _totalWorkingDays * _lengthWorkingDay * _hourlyCost;

END; $$
LANGUAGE PLPGSQL;

SELECT getTotalCostForEmployeeOverPeriod(25, 19);
/*******************************************************/


/**
  Finds week days of date range
  Found: https://dba.stackexchange.com/a/247130
 */
create or replace function count_business_days(from_date date, to_date date)
returns bigint
as $fbd$
    select count(d::date) as d
    from generate_series(from_date, to_date, '1 day'::interval) d
    where extract('dow' from d) not in (0, 6)
$fbd$ language sql;

SELECT count_business_days( date('2019/11/2'), date('2019/11/3'));
/*******************************************************/


/**
  Checks if an employee is already assigned to same plan.
 */
 create or replace function isEmployeeAssignedToPlan(_employeeid INT, _planid int) returns boolean as $isInPlan$
BEGIN
    IF ((SELECT COUNT(planid) cnt FROM planemployee WHERE employeeid = _employeeid AND planid = _planid) > 0)
    THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
END;
$isInPlan$
LANGUAGE plpgsql;

/*******************************************************/

/**
  Checks if an is busy in period.
 */
CREATE OR REPLACE FUNCTION isEmployeeBusy(_employeeid INT, _planid INT) RETURNS BOOLEAN AS
$busy$
DECLARE
    _countColision INT;
    _busy  BOOLEAN;
    _startDate DATE;
    _endDate DATE;
BEGIN
    CREATE TEMP TABLE dates
    (
        startDate DATE,
        endDate   DATE
    );
    INSERT INTO dates (SELECT startDate, enddate FROM plans WHERE id = _planId);

    IF ((SELECT count(*) FROM planemployee WHERE employeeid = _employeeid) = 0)
    THEN
        _busy = FALSE;
    ELSEIF (isEmployeeAssignedToPlan(_employeeid, _planid))
    THEN
        _busy = TRUE;
    ELSE
        _endDate= (SELECT endDate FROM dates LIMIT 1);
        _startDate = (SELECT startDate FROM dates LIMIT 1);

        _countColision = (SELECT COUNT(*)
                          FROM plans
                                   INNER JOIN planemployee p ON plans.id = p.planid
                          WHERE employeeid = _employeeid AND
                                ( _startDate BETWEEN startdate AND enddate)
                             OR (_endDate BETWEEN startdate AND enddate) OR
                                (startdate BETWEEN _startDate AND _endDate)
                             OR ( enddate BETWEEN _startDate AND _endDate));

        IF (_countColision > 0) THEN
            _busy = TRUE;
        ELSE
            _busy = FALSE;
        END IF;
    END IF;

    DROP TABLE dates;
    RETURN _busy;
END;
$busy$
    LANGUAGE plpgsql;
/* TRUE */
SELECT isEmployeeBusy(25, 17);
/* TRUE */
SELECT isEmployeeBusy(25, 19);
/* FALSE */
SELECT isEmployeeBusy(25, 18);
/* TRUE */
SELECT isEmployeeBusy(25, 15);
/* TRUE */
SELECT isEmployeeBusy(25, 20);

/*******************************************************/

/**
  Updates projects total cost when trying to add a employee to a plan.
  If the total cost is higher then the projects budget, the employee will not be assigned to the plan.
  Else, add the user and update the total cost for the project.
 */
CREATE OR REPLACE FUNCTION upsert_balance() RETURNS trigger AS $trigger_bound$
    DECLARE _projectId INT;
BEGIN
    _projectId = getProjectIdFromPlanId(new.planid);
    IF ((SELECT COUNT(projectid) cnt FROM projectcost WHERE projectid = _projectId) > 0)
    THEN
        /* Check if an employee is assigned to a plan, if he/she is, return null (reject insert) */
        if (isEmployeeBusy(new.employeeid, new.planid)) THEN RETURN null;
        END IF;
        /* */
        UPDATE projectcost SET totalcost = (totalcost + getTotalCostForEmployeeOverPeriod(new.employeeid, new.planid)) WHERE projectid = _projectId;
        RETURN NEW;
    ELSE
                /* Check if an employee is assigned to a plan, if he/she is, return null (reject insert) */
        if (isEmployeeBusy(new.employeeid, new.planid)) THEN RETURN null;
        END IF;

        INSERT INTO projectcost (projectid, totalcost)
        VALUES ((SELECT DISTINCT projectid
        FROM plans p WHERE p.id = new.planid), getTotalCostForEmployeeOverPeriod(new.employeeid, new.planid));
    RETURN NEW;
    END IF;
END;
$trigger_bound$
LANGUAGE plpgsql;

/**
  Binds trigger to update total cost
 */
CREATE TRIGGER update_balance_on_inserting_transfer
BEFORE INSERT ON planemployee
FOR EACH ROW
EXECUTE PROCEDURE upsert_balance();

/* FAIL */
INSERT INTO planemployee (planid, employeeid) VALUES (19, 25);
/* FAIL */
INSERT INTO planemployee (planid, employeeid) VALUES (17, 25);
/* FAIL */
INSERT INTO planemployee (planid, employeeid) VALUES (16, 25);
/* PASS */
INSERT INTO planemployee (planid, employeeid) VALUES (18, 25);
/*******************************************************/


SELECT SUM(hourlyCost)
            FROM planEmployee pe, Employees e
            WHERE (pe.employeeid = e.id)
              AND (pe.planid = 19);



/**
  Selects plan sums for a project
 */
(select sum(hourlycost) * (enddate - startdate) as cost, pl.id as plansID
from plans pl
         inner join planemployee p on pl.id = p.planid
         inner join employees e on p.employeeid = e.id
group by pl.id);



CREATE OR REPLACE FUNCTION checkEndDateForProject() RETURNS trigger AS $trigger_bound$
BEGIN
    IF new.enddate >= (SELECT DISTINCT pr1.enddate FROM projects pr1
        INNER JOIN plans pl1 ON pl1.projectid = pr1.id
        WHERE pr1.id = new.projectid)
    THEN
        RAISE EXCEPTION NUMERIC_VALUE_OUT_OF_RANGE;
    END IF;
    RETURN NEW;
END;
$trigger_bound$
LANGUAGE plpgsql;

CREATE TRIGGER checkEndDateForProject
BEFORE INSERT ON plans
FOR EACH ROW
EXECUTE PROCEDURE checkEndDateForProject();

INSERT INTO plans (projectid, activity, startdate, enddate)
VALUES (15, 'Styremøte', date('2020-10-10'), date('2020-10-25'));
