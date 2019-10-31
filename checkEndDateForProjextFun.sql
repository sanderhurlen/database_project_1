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