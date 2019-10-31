create table projects
(
	id serial not null
		constraint projects_pk
			primary key,
	name varchar(200) not null,
	startdate date not null,
	enddate date not null,
	leader integer not null
		constraint projects_employees_id_fk
			references employees,
	budget bigint,
	constraint end_date_after_start_date
		check (startdate < enddate)
);

alter table projects owner to postgres;

