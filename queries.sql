--  •	How many employees of for a project titled "A" are involved in its plan “B”?



-- # •	Retrieve the names of plans made for project “A” with least cost.
SELECT qwe.activity AS name, sum(gettotalcostforemployeeoverperiod(pe.employeeid, qwe.id)) as cost FROM plans AS qwe
INNER JOIN plan_employee pe ON pe.planid = qwe.id
INNER JOIN projects p ON qwe.projectid = p.id
WHERE p.id = 37
GROUP BY qwe.activity;

-- # •	For each employee retrieve the name, project name and plan name with the most working time.



-- # •	Retrieve all the employee name and their least working time with respect to different project.



-- # •	Retrieve all the plans for project with order of their working period.+++

SELECT p.id, p.name, pl.id, pl.activity, (pl.enddate-pl.startdate) AS days_between FROM plans pl
INNER JOIN projects p ON pl.projectid = p.id
GROUP BY p.id, pl.id, p.startdate, pl.startdate
ORDER BY p.startdate, pl.startdate ASC;