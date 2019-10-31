(select sum(hourlycost) * (enddate - startdate) as cost, pl.id as plansID
from plans pl
         inner join planemployee p on pl.id = p.planid
         inner join employees e on p.employeeid = e.id
group by pl.id)
