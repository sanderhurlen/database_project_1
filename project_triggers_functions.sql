/**
  Calculate cost of leader when project is created
  and update project cost.
 */



CREATE OR REPLACE FUNCTION addLeaderCostToProjectCost() RETURNS trigger AS $leadercost$
    BEGIN
        
    END;
$leadercost$
LANGUAGE plpgsql;


CREATE TRIGGER addLeaderCostToProjectCost
BEFORE INSERT ON projects
FOR EACH ROW
EXECUTE PROCEDURE addLeaderCostToProjectCost();
