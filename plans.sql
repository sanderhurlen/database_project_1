create table plans
(
	id serial not null
		constraint plans_pk
			primary key,
	projectid integer not null
		constraint plans_projects_id_fk
			references projects,
	activity varchar(200) not null
		constraint plans_activities_type_fk
			references activities,
	startdate date not null,
	enddate date not null,
	constraint end_date_after_start_date
		check (startdate < enddate)
);

alter table plans owner to postgres;

