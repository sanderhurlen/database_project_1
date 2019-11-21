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


INSERT INTO employees (id, name, hourlycost)
VALUES (1, 'Elissa Funk', 2);
INSERT INTO employees (id, name, hourlycost)
VALUES (2, 'Al Olson', 6);
INSERT INTO employees (id, name, hourlycost)
VALUES (3, 'Reina Kub', 4);
INSERT INTO employees (id, name, hourlycost)
VALUES (4, 'Lauretta Bogan', 1);
INSERT INTO employees (id, name, hourlycost)
VALUES (5, 'Godfrey Kunze DDS', 2);
INSERT INTO employees (id, name, hourlycost)
VALUES (6, 'Hosea Kilback', 8);
INSERT INTO employees (id, name, hourlycost)
VALUES (7, 'Maymie Kihn', 1);
INSERT INTO employees (id, name, hourlycost)
VALUES (8, 'Demarcus Kemmer', 2);
INSERT INTO employees (id, name, hourlycost)
VALUES (9, 'Emie Dickens', 5);
INSERT INTO employees (id, name, hourlycost)
VALUES (10, 'Mr. Allen Mosciski V', 5);
INSERT INTO employees (id, name, hourlycost)
VALUES (11, 'Flo Stroman Jr.', 2);
INSERT INTO employees (id, name, hourlycost)
VALUES (12, 'Dr. Jillian Langosh', 3);
INSERT INTO employees (id, name, hourlycost)
VALUES (13, 'Prof. Johanna Emard MD', 2);
INSERT INTO employees (id, name, hourlycost)
VALUES (14, 'Cleveland Ziemann', 1);
INSERT INTO employees (id, name, hourlycost)
VALUES (15, 'Filomena Farrell Sr.', 7);
INSERT INTO employees (id, name, hourlycost)
VALUES (16, 'Prof. Benton Toy', 4);
INSERT INTO employees (id, name, hourlycost)
VALUES (17, 'Ona Schamberger', 3);
INSERT INTO employees (id, name, hourlycost)
VALUES (18, 'Trisha Hoppe', 4);
INSERT INTO employees (id, name, hourlycost)
VALUES (19, 'Alvah Hoeger PhD', 6);
INSERT INTO employees (id, name, hourlycost)
VALUES (20, 'Mrs. Jacky Kuphal Sr.', 2);
INSERT INTO employees (id, name, hourlycost)
VALUES (21, 'Mr. Titus Kuvalis Jr.', 4);
INSERT INTO employees (id, name, hourlycost)
VALUES (22, 'Mrs. Estelle Beier', 2);
INSERT INTO employees (id, name, hourlycost)
VALUES (23, 'Mr. Jamie Blick V', 9);
INSERT INTO employees (id, name, hourlycost)
VALUES (24, 'Carmella Runolfsdottir', 9);
INSERT INTO employees (id, name, hourlycost)
VALUES (25, 'Isaac Kirlin', 9);
INSERT INTO employees (id, name, hourlycost)
VALUES (26, 'Mitchel Muller I', 2);
INSERT INTO employees (id, name, hourlycost)
VALUES (27, 'Eudora Terry', 7);
INSERT INTO employees (id, name, hourlycost)
VALUES (28, 'Jena Braun', 2);
INSERT INTO employees (id, name, hourlycost)
VALUES (29, 'Constance Lehner', 3);
INSERT INTO employees (id, name, hourlycost)
VALUES (30, 'Mrs. Clara Osinski I', 3);
INSERT INTO employees (id, name, hourlycost)
VALUES (31, 'Will Runte', 5);
INSERT INTO employees (id, name, hourlycost)
VALUES (32, 'Mandy Hudson', 2);
INSERT INTO employees (id, name, hourlycost)
VALUES (33, 'Iva Reilly', 2);
INSERT INTO employees (id, name, hourlycost)
VALUES (34, 'Dallas Donnelly', 4);
INSERT INTO employees (id, name, hourlycost)
VALUES (35, 'Miss Jackeline Thiel DDS', 4);
INSERT INTO employees (id, name, hourlycost)
VALUES (36, 'Major Schuppe', 2);
INSERT INTO employees (id, name, hourlycost)
VALUES (37, 'Ms. Maud Conroy', 9);
INSERT INTO employees (id, name, hourlycost)
VALUES (38, 'Lonzo Haley', 6);
INSERT INTO employees (id, name, hourlycost)
VALUES (39, 'Mr. Lewis Schmitt', 2);
INSERT INTO employees (id, name, hourlycost)
VALUES (40, 'Damien Stark', 1);
INSERT INTO employees (id, name, hourlycost)
VALUES (41, 'Garrison Wilderman', 3);
INSERT INTO employees (id, name, hourlycost)
VALUES (42, 'Mrs. Nelda Farrell Sr.', 7);
INSERT INTO employees (id, name, hourlycost)
VALUES (43, 'Bert Doyle', 3);
INSERT INTO employees (id, name, hourlycost)
VALUES (44, 'Lulu Daugherty', 6);
INSERT INTO employees (id, name, hourlycost)
VALUES (45, 'Pamela Krajcik DVM', 6);
INSERT INTO employees (id, name, hourlycost)
VALUES (46, 'Mr. Mortimer Erdman', 2);
INSERT INTO employees (id, name, hourlycost)
VALUES (47, 'Demarco Ratke', 5);
INSERT INTO employees (id, name, hourlycost)
VALUES (48, 'Zora Mante', 1);
INSERT INTO employees (id, name, hourlycost)
VALUES (49, 'Dr. Missouri McGlynn Sr.', 5);
INSERT INTO employees (id, name, hourlycost)
VALUES (50, 'Dr. Owen Volkman II', 9);

