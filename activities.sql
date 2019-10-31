create table activities
(
	type varchar(200) not null
		constraint activities_pk
			primary key
);

alter table activities owner to postgres;

create unique index activities_type_uindex
	on activities (type);

