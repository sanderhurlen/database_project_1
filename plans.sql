create table plans
(
	id serial not null
		constraint plans_pk
			primary key,
	projectid integer not null
		constraint plans_projects_id_fk
			references projects,
	employeeid integer not null
		constraint plans_employees_id_fk
			references employees,
	activity varchar(200) not null
		constraint plans_activities_type_fk
			references activities,
	startdate date not null,
	enddate date not null
);

alter table plans owner to postgres;

