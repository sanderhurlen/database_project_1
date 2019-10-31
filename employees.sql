create table employees
(
	id serial not null
		constraint employees_pk
			primary key,
	name varchar(200) not null,
	hourlycost double precision not null
);

alter table employees owner to postgres;

