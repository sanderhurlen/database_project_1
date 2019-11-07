create table employees
(
	id serial not null
		constraint employees_pk
			primary key,
	name varchar(200) not null,
	hourlycost double precision not null
);

alter table employees owner to postgres;

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

create table activities
(
	type varchar(200) not null
		constraint activities_pk
			primary key
);

alter table activities owner to postgres;

create unique index activities_type_uindex
	on activities (type);

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

create table projectcost
(
	projectid integer
		constraint projectcost_projects_id_fk
			references projects,
	totalcost integer
);

alter table projectcost owner to postgres;

insert into activities values ('idemyldring'),('Styremøte'), ('budsjettering'), ('Planlegging');
INSERT INTO public.employees (id, name, hourlycost) VALUES (1, 'Elissa Funk', 2);
INSERT INTO public.employees (id, name, hourlycost) VALUES (2, 'Al Olson', 6);
INSERT INTO public.employees (id, name, hourlycost) VALUES (3, 'Reina Kub', 4);
INSERT INTO public.employees (id, name, hourlycost) VALUES (4, 'Lauretta Bogan', 1);
INSERT INTO public.employees (id, name, hourlycost) VALUES (5, 'Godfrey Kunze DDS', 2);
INSERT INTO public.employees (id, name, hourlycost) VALUES (6, 'Hosea Kilback', 8);
INSERT INTO public.employees (id, name, hourlycost) VALUES (7, 'Maymie Kihn', 1);
INSERT INTO public.employees (id, name, hourlycost) VALUES (8, 'Demarcus Kemmer', 2);
INSERT INTO public.employees (id, name, hourlycost) VALUES (9, 'Emie Dickens', 5);
INSERT INTO public.employees (id, name, hourlycost) VALUES (10, 'Mr. Allen Mosciski V', 5);
INSERT INTO public.employees (id, name, hourlycost) VALUES (11, 'Flo Stroman Jr.', 2);
INSERT INTO public.employees (id, name, hourlycost) VALUES (12, 'Dr. Jillian Langosh', 3);
INSERT INTO public.employees (id, name, hourlycost) VALUES (13, 'Prof. Johanna Emard MD', 2);
INSERT INTO public.employees (id, name, hourlycost) VALUES (14, 'Cleveland Ziemann', 1);
INSERT INTO public.employees (id, name, hourlycost) VALUES (15, 'Filomena Farrell Sr.', 7);
INSERT INTO public.employees (id, name, hourlycost) VALUES (16, 'Prof. Benton Toy', 4);
INSERT INTO public.employees (id, name, hourlycost) VALUES (17, 'Ona Schamberger', 3);
INSERT INTO public.employees (id, name, hourlycost) VALUES (18, 'Trisha Hoppe', 4);
INSERT INTO public.employees (id, name, hourlycost) VALUES (19, 'Alvah Hoeger PhD', 6);
INSERT INTO public.employees (id, name, hourlycost) VALUES (20, 'Mrs. Jacky Kuphal Sr.', 2);
INSERT INTO public.employees (id, name, hourlycost) VALUES (21, 'Mr. Titus Kuvalis Jr.', 4);
INSERT INTO public.employees (id, name, hourlycost) VALUES (22, 'Mrs. Estelle Beier', 2);
INSERT INTO public.employees (id, name, hourlycost) VALUES (23, 'Mr. Jamie Blick V', 9);
INSERT INTO public.employees (id, name, hourlycost) VALUES (24, 'Carmella Runolfsdottir', 9);
INSERT INTO public.employees (id, name, hourlycost) VALUES (25, 'Isaac Kirlin', 9);
INSERT INTO public.employees (id, name, hourlycost) VALUES (26, 'Mitchel Muller I', 2);
INSERT INTO public.employees (id, name, hourlycost) VALUES (27, 'Eudora Terry', 7);
INSERT INTO public.employees (id, name, hourlycost) VALUES (28, 'Jena Braun', 2);
INSERT INTO public.employees (id, name, hourlycost) VALUES (29, 'Constance Lehner', 3);
INSERT INTO public.employees (id, name, hourlycost) VALUES (30, 'Mrs. Clara Osinski I', 3);
INSERT INTO public.employees (id, name, hourlycost) VALUES (31, 'Will Runte', 5);
INSERT INTO public.employees (id, name, hourlycost) VALUES (32, 'Mandy Hudson', 2);
INSERT INTO public.employees (id, name, hourlycost) VALUES (33, 'Iva Reilly', 2);
INSERT INTO public.employees (id, name, hourlycost) VALUES (34, 'Dallas Donnelly', 4);
INSERT INTO public.employees (id, name, hourlycost) VALUES (35, 'Miss Jackeline Thiel DDS', 4);
INSERT INTO public.employees (id, name, hourlycost) VALUES (36, 'Major Schuppe', 2);
INSERT INTO public.employees (id, name, hourlycost) VALUES (37, 'Ms. Maud Conroy', 9);
INSERT INTO public.employees (id, name, hourlycost) VALUES (38, 'Lonzo Haley', 6);
INSERT INTO public.employees (id, name, hourlycost) VALUES (39, 'Mr. Lewis Schmitt', 2);
INSERT INTO public.employees (id, name, hourlycost) VALUES (40, 'Damien Stark', 1);
INSERT INTO public.employees (id, name, hourlycost) VALUES (41, 'Garrison Wilderman', 3);
INSERT INTO public.employees (id, name, hourlycost) VALUES (42, 'Mrs. Nelda Farrell Sr.', 7);
INSERT INTO public.employees (id, name, hourlycost) VALUES (43, 'Bert Doyle', 3);
INSERT INTO public.employees (id, name, hourlycost) VALUES (44, 'Lulu Daugherty', 6);
INSERT INTO public.employees (id, name, hourlycost) VALUES (45, 'Pamela Krajcik DVM', 6);
INSERT INTO public.employees (id, name, hourlycost) VALUES (46, 'Mr. Mortimer Erdman', 2);
INSERT INTO public.employees (id, name, hourlycost) VALUES (47, 'Demarco Ratke', 5);
INSERT INTO public.employees (id, name, hourlycost) VALUES (48, 'Zora Mante', 1);
INSERT INTO public.employees (id, name, hourlycost) VALUES (49, 'Dr. Missouri McGlynn Sr.', 5);
INSERT INTO public.employees (id, name, hourlycost) VALUES (50, 'Dr. Owen Volkman II', 9);


