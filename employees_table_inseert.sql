CREATE TABLE employees
(
    id         SERIAL           NOT NULL
        CONSTRAINT employees_pk
            PRIMARY KEY,
    name       VARCHAR(200)     NOT NULL,
    hourlycost DOUBLE PRECISION NOT NULL
);

ALTER TABLE employees
    OWNER TO postgres;

INSERT INTO public.employees (id, name, hourlycost) VALUES (49, 'Dr. Missouri McGlynn Sr.', 789);
INSERT INTO public.employees (id, name, hourlycost) VALUES (46, 'Mr. Mortimer Erdman', 342);
INSERT INTO public.employees (id, name, hourlycost) VALUES (48, 'Zora Mante', 312);
INSERT INTO public.employees (id, name, hourlycost) VALUES (28, 'Jena Braun', 250);
INSERT INTO public.employees (id, name, hourlycost) VALUES (16, 'Prof. Benton Toy', 265);
INSERT INTO public.employees (id, name, hourlycost) VALUES (38, 'Lonzo Haley', 250);
INSERT INTO public.employees (id, name, hourlycost) VALUES (47, 'Demarco Ratke', 312);
INSERT INTO public.employees (id, name, hourlycost) VALUES (13, 'Prof. Johanna Emard MD', 265);
INSERT INTO public.employees (id, name, hourlycost) VALUES (12, 'Dr. Jillian Langosh', 265);
INSERT INTO public.employees (id, name, hourlycost) VALUES (15, 'Filomena Farrell Sr.', 265);
INSERT INTO public.employees (id, name, hourlycost) VALUES (14, 'Cleveland Ziemann', 265);
INSERT INTO public.employees (id, name, hourlycost) VALUES (9, 'Emie Dickens', 265);
INSERT INTO public.employees (id, name, hourlycost) VALUES (8, 'Demarcus Kemmer', 265);
INSERT INTO public.employees (id, name, hourlycost) VALUES (11, 'Flo Stroman Jr.', 265);
INSERT INTO public.employees (id, name, hourlycost) VALUES (10, 'Mr. Allen Mosciski V', 265);
INSERT INTO public.employees (id, name, hourlycost) VALUES (5, 'Godfrey Kunze DDS', 265);
INSERT INTO public.employees (id, name, hourlycost) VALUES (40, 'Damien Stark', 312);
INSERT INTO public.employees (id, name, hourlycost) VALUES (7, 'Maymie Kihn', 265);
INSERT INTO public.employees (id, name, hourlycost) VALUES (6, 'Hosea Kilback', 265);
INSERT INTO public.employees (id, name, hourlycost) VALUES (44, 'Lulu Daugherty', 342);
INSERT INTO public.employees (id, name, hourlycost) VALUES (42, 'Mrs. Nelda Farrell Sr.', 312);
INSERT INTO public.employees (id, name, hourlycost) VALUES (1, 'Elissa Funk', 180);
INSERT INTO public.employees (id, name, hourlycost) VALUES (39, 'Mr. Lewis Schmitt', 250);
INSERT INTO public.employees (id, name, hourlycost) VALUES (29, 'Constance Lehner', 250);
INSERT INTO public.employees (id, name, hourlycost) VALUES (4, 'Lauretta Bogan', 210);
INSERT INTO public.employees (id, name, hourlycost) VALUES (43, 'Bert Doyle', 312);
INSERT INTO public.employees (id, name, hourlycost) VALUES (25, 'Isaac Kirlin', 250);
INSERT INTO public.employees (id, name, hourlycost) VALUES (24, 'Carmella Runolfsdottir', 250);
INSERT INTO public.employees (id, name, hourlycost) VALUES (3, 'Reina Kub', 210);
INSERT INTO public.employees (id, name, hourlycost) VALUES (26, 'Mitchel Muller I', 250);
INSERT INTO public.employees (id, name, hourlycost) VALUES (21, 'Mr. Titus Kuvalis Jr.', 250);
INSERT INTO public.employees (id, name, hourlycost) VALUES (20, 'Mrs. Jacky Kuphal Sr.', 250);
INSERT INTO public.employees (id, name, hourlycost) VALUES (23, 'Mr. Jamie Blick V', 250);
INSERT INTO public.employees (id, name, hourlycost) VALUES (22, 'Mrs. Estelle Beier', 250);
INSERT INTO public.employees (id, name, hourlycost) VALUES (2, 'Al Olson', 180);
INSERT INTO public.employees (id, name, hourlycost) VALUES (37, 'Ms. Maud Conroy', 250);
INSERT INTO public.employees (id, name, hourlycost) VALUES (19, 'Alvah Hoeger PhD', 250);
INSERT INTO public.employees (id, name, hourlycost) VALUES (18, 'Trisha Hoppe', 250);
INSERT INTO public.employees (id, name, hourlycost) VALUES (45, 'Pamela Krajcik DVM', 342);
INSERT INTO public.employees (id, name, hourlycost) VALUES (41, 'Garrison Wilderman', 312);
INSERT INTO public.employees (id, name, hourlycost) VALUES (36, 'Major Schuppe', 278);
INSERT INTO public.employees (id, name, hourlycost) VALUES (33, 'Iva Reilly', 278);
INSERT INTO public.employees (id, name, hourlycost) VALUES (32, 'Mandy Hudson', 278);
INSERT INTO public.employees (id, name, hourlycost) VALUES (35, 'Miss Jackeline Thiel DDS', 278);
INSERT INTO public.employees (id, name, hourlycost) VALUES (34, 'Dallas Donnelly', 278);
INSERT INTO public.employees (id, name, hourlycost) VALUES (27, 'Eudora Terry', 250);
INSERT INTO public.employees (id, name, hourlycost) VALUES (50, 'Dr. Owen Volkman II', 878);
INSERT INTO public.employees (id, name, hourlycost) VALUES (17, 'Ona Schamberger', 250);
INSERT INTO public.employees (id, name, hourlycost) VALUES (31, 'Will Runte', 278);
INSERT INTO public.employees (id, name, hourlycost) VALUES (30, 'Mrs. Clara Osinski I', 278);