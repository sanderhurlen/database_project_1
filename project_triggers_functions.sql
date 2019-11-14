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
CREATE OR REPLACE FUNCTION isLeaderBusy(_leaderId INT, _projectId INT) RETURNS BOOLEAN AS
$busy$
DECLARE
    _busy      BOOLEAN = FALSE;
    _startDate DATE;
    _endDate   DATE;
BEGIN
    CREATE TEMP TABLE projectDates
    (
        startDate DATE,
        endDate   DATE
    );


    INSERT INTO projectDates (SELECT startDate, endDate FROM projects WHERE id = _projectId);

    IF (isPersonALeader(_leaderId))
    THEN
        FOR _startDate, _endDate IN (SELECT startDate, endDate FROM projects WHERE leader = _leaderId)
            LOOP
                IF (isDatesOverlapping((SELECT startDate FROM projectDates LIMIT 1),
                                       (SELECT endDate FROM projectDates LIMIT 1), _startDate, _endDate))
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
                IF (isDatesOverlapping((SELECT startDate FROM projectDates LIMIT 1),
                                       (SELECT endDate FROM projectDates LIMIT 1), _startDate, _endDate))
                THEN
                    _busy = TRUE;
                    EXIT;
                END IF;
            END LOOP;
    END IF;

    DROP TABLE projectDates;
    RETURN _busy;
END;
$busy$
    LANGUAGE plpgsql;

SELECT isLeaderBusy(49, 4);


/*******************************************************/
/*
    Adds a lea
*/
CREATE OR REPLACE FUNCTION addLeaderCostToProjectCost() RETURNS TRIGGER AS
$leadercost$
BEGIN
    IF (isLeaderBusy(new.leader, NEW.id))
    THEN
        RAISE EXCEPTION ERROR_IN_ASSIGNMENT ;
    ELSE
        RETURN NEW;
    END IF;
END;
$leadercost$
    LANGUAGE plpgsql;


CREATE TRIGGER addLeaderCostToProjectCost
    BEFORE INSERT
    ON projects
    FOR EACH ROW
EXECUTE PROCEDURE addLeaderCostToProjectCost();
