create table activities
(
	type varchar(200) not null
		constraint activities_pk
			primary key
);

alter table activities owner to postgres;

create unique index activities_type_uindex
	on activities (type);

INSERT INTO activities VALUES ('Planning'), ('Testing'),('Development'),
                              ('Bug fixing'),('Architecture design'),
                              ('Requirement analysis'), ('Evaluation'),
                              ('Deployment'), ('Maintenance');