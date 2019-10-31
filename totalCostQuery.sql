select totalhourlycost * plansruntimeDays as totalcost, activity from
(select distinct sum(hourlycost) as totalhourlycost from plans
inner join planemployee p on plans.id = p.planid
left join  employees e on p.employeeid = e.id group by activity) as wages,
(select (enddate - startdate) plansruntimeDays, activity from plans) as days
group by activity, totalhourlycost * plansruntimeDays
