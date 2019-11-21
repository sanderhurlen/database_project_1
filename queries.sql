--  •	How many employees of for a project titled "A" are involved in its plan “B”?
SELECT p.name, pl.activity, COUNT(pe.employeeid) FROM plan_employee pe
INNER JOIN plans pl ON pe.planid = pl.id
INNER JOIN projects p ON p.id=pl.projectid
WHERE p.id = 1 AND pl.activity = 'Testing'
GROUP BY p.name, pl.activity, pe.planid;


-- # •	Retrieve the names of plans made for project “A” with least cost.
SELECT qwe.activity AS name, sum(gettotalcostforemployeeoverperiod(pe.employeeid, qwe.id)) as cost FROM plans AS qwe
INNER JOIN plan_employee pe ON pe.planid = qwe.id
INNER JOIN projects p ON qwe.projectid = p.id
WHERE p.id = 37
GROUP BY qwe.activity;

-- # •	For each employee retrieve the name, project name and plan name with the most working time.
-- FIND EMPLOYEE WITH MOST WORKING TIME ON A PLAN FOR EACH PROJECT
SELECT DISTINCT ON (em.name, pr.name) em.name, pr.name, pl.activity, max(count_business_days(pl.startdate, pl.enddate)) bdays  FROM plans pl
INNER JOIN plan_employee pe ON pe.planid = pl.id
INNER JOIN projects pr ON pl.projectid = pr.id
INNER JOIN employees em ON pe.employeeid = em.id
GROUP BY em.name, pr.name, pl.startdate, pl.enddate, pl.activity
ORDER BY em.name, pr.name, bdays DESC;

-- # •	Retrieve all the employee name and their least working time with respect to different projects.
SELECT em.name, p2.name, MIN(count_business_days(p.startdate, p.enddate)) FROM employees em
INNER JOIN plan_employee pe ON em.id = pe.employeeid
INNER JOIN plans p ON pe.planid = p.id
INNER JOIN projects p2 ON p.projectid = p2.id
GROUP BY em.name, p2.name;


-- # •	Retrieve all the plans for project with order of their working period.

SELECT p.id, p.name, pl.id, pl.activity, (pl.enddate-pl.startdate) "duration" FROM plans pl
INNER JOIN projects p ON pl.projectid = p.id
GROUP BY p.id, pl.id, p.startdate, pl.startdate
ORDER BY "duration" DESC;