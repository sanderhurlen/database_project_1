/**
  Calculate cost of leader when project is created
  and update project cost.
 */


/**
  Checks if person is assigned as leader to an existing project.
 */
CREATE OR REPLACE FUNCTION isPersonALeader(_employeeId INT) RETURNS BOOLEAN AS
$$
BEGIN
    IF ((SELECT count(*) FROM projects WHERE leader = _employeeId) > 0)
    THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
END;
$$
    LANGUAGE plpgsql;

/**
  Checks if person is assigned as employee to a plan
 */
CREATE OR REPLACE FUNCTION isPersonAssignedToPlan(_employeeId INT) RETURNS BOOLEAN AS
$$
BEGIN
    IF ((SELECT count(*) FROM plan_employee WHERE employeeid = _employeeId) > 0)
    THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
END;
$$
    LANGUAGE plpgsql;

/**
  Check if new project is overlapping other projects
 */

CREATE OR REPLACE FUNCTION isDatesOverlapping(_StartDateA DATE, _EndDateA DATE, _StartDateB DATE, _endDateB DATE) RETURNS BOOLEAN AS
$$
BEGIN
    IF (_StartDateA <= _endDateB) AND (_EndDateA >= _StartDateB)
    THEN
        RETURN TRUE;
    END IF;
    RETURN FALSE;
END;
$$
    LANGUAGE plpgsql;


/**
  Checks if a leader is busy in period.
 */
CREATE OR REPLACE FUNCTION isLeaderBusy(_leaderId INT, _startDateNew date, _endDateNew date) RETURNS BOOLEAN AS
$busy$
DECLARE
    _busy      BOOLEAN = FALSE;
    _startDate DATE;
    _endDate   DATE;
BEGIN

    IF (isPersonALeader(_leaderId))
    THEN
        FOR _startDate, _endDate IN (SELECT startDate, endDate FROM projects WHERE leader = _leaderId)
            LOOP
                IF (isDatesOverlapping(_startDateNew,
                                       _endDateNew, _startDate, _endDate))
                THEN
                    _busy = TRUE;
                    EXIT;
                END IF;
            END LOOP;
    ELSEIF (isPersonAssignedToPlan(_leaderId))
    THEN
        FOR _startDate, _endDate IN (SELECT startDate, endDate
                                     FROM plans
                                              INNER JOIN plan_employee pe ON pe.planid = plans.id
                                              INNER JOIN employees e ON e.id = pe.employeeid
                                     WHERE e.id = _leaderId)
            LOOP
                IF (isDatesOverlapping(_startDateNew,
                                       _endDateNew, _startDate, _endDate))
                THEN
                    _busy = TRUE;
                    EXIT;
                END IF;
            END LOOP;
    END IF;
    RETURN _busy;
END;
$busy$
    LANGUAGE plpgsql;

SELECT isLeaderBusy(19, date('2016-11-19'),date('2016-11-30'));


/*******************************************************/
/*
    Adds a lea
*/
CREATE OR REPLACE FUNCTION validateNewLeader() RETURNS TRIGGER AS
$leadercost$
    DECLARE
        _leaderCost INT;
BEGIN
        _leaderCost = gettotalcostforemployeeoverperiod(new.leader, new.startdate, new.enddate);
    IF (isLeaderBusy(new.leader, new.startdate, new.enddate))
    THEN
        RAISE EXCEPTION 'This leader is busy in this time period.';
    ELSE
        IF (_leaderCost > new.budget)
        THEN
            RAISE EXCEPTION 'This leaders cost violates this projects budget.';
        END IF;
        RETURN NEW;
    END IF;
END;
$leadercost$

    LANGUAGE plpgsql;

/*******************************************************/
/*
    Adds a lea
*/
CREATE OR REPLACE FUNCTION addProjectLeaderCost() RETURNS TRIGGER AS
$leadercost$
    DECLARE
        _leaderCost INT;
BEGIN
        _leaderCost = gettotalcostforemployeeoverperiod(new.leader, new.startdate, new.enddate);
        INSERT INTO projectcost (projectid, totalcost) VALUES (new.id, _leaderCost);
        RETURN NEW;
END;
$leadercost$
    LANGUAGE plpgsql;



CREATE TRIGGER validateNewLeader
    BEFORE INSERT OR UPDATE
    ON projects
    FOR EACH ROW
EXECUTE PROCEDURE validateNewLeader();


CREATE TRIGGER addLeaderCostToProjectCost
    AFTER INSERT OR UPDATE
    ON projects
    FOR EACH ROW
EXECUTE PROCEDURE addProjectLeaderCost();
