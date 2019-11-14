CREATE TABLE projects
(
    id        SERIAL       NOT NULL
        CONSTRAINT projects_pk
            PRIMARY KEY,
    name      VARCHAR(200) NOT NULL,
    startdate DATE         NOT NULL,
    enddate   DATE         NOT NULL,
    leader    INTEGER      NOT NULL
        CONSTRAINT projects_employees_id_fk
            REFERENCES employees,
    budget    BIGINT,
    CONSTRAINT end_date_after_start_date
        CHECK (startdate < enddate)
);

ALTER TABLE projects
    OWNER TO postgres;

INSERT INTO public.projects (id, name, startdate, enddate, leader, budget) VALUES (2, 'CMS for Rolls Royce', '2019-11-14', '2021-10-30', 4, 20000000);
INSERT INTO public.projects (id, name, startdate, enddate, leader, budget) VALUES (1, 'New web bank for Danskebank', '2019-11-21', '2020-01-10', 8, 21500000);
INSERT INTO public.projects (id, name, startdate, enddate, leader, budget) VALUES (5, 'New Blackboard', '2009-01-05', '2010-01-05', 5, 666);
INSERT INTO public.projects (id, name, startdate, enddate, leader, budget) VALUES (4, 'Automating beer brewing for MOLO', '2019-10-31', '2020-10-15', 14, 1200000);
INSERT INTO public.projects (id, name, startdate, enddate, leader, budget) VALUES (3, 'Mobile app for NTNU', '2020-01-02', '2020-10-15', 1, 350000);