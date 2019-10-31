create table planemployee
(
	planid integer not null
		constraint planemployee_plans_id_fk
			references plans,
	employeeid integer not null
		constraint planemployee_employees_id_fk
			references employees
);

alter table planemployee owner to postgres;

