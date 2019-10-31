create table projectcost
(
	projectid integer
		constraint projectcost_projects_id_fk
			references projects,
	totalcost integer
);

alter table projectcost owner to postgres;

