CREATE TABLE plans
(
    id        SERIAL       NOT NULL
        CONSTRAINT plans_pk
        PRIMARY KEY,
    projectid INTEGER      NOT NULL
        CONSTRAINT plans_projects_id_fk
        REFERENCES projects
        ON DELETE CASCADE,
    activity  VARCHAR(200) NOT NULL
        CONSTRAINT plans_activities_type_fk
        REFERENCES activities,
    startdate DATE         NOT NULL,
    enddate   DATE         NOT NULL,
    CONSTRAINT end_date_after_start_date
        CHECK (startdate < enddate)
);

ALTER TABLE plans
    OWNER TO postgres;

INSERT INTO plans (id, projectid, activity, startdate, enddate)
VALUES (20, 1, 'Development', '2019-11-13', '2019-12-20');
INSERT INTO plans (id, projectid, activity, startdate, enddate)
VALUES (21, 1, 'Testing', '2019-12-01', '2019-12-31');
INSERT INTO plans (id, projectid, activity, startdate, enddate)
VALUES (22, 1, 'Evaluation', '2020-01-03', '2020-01-09');
INSERT INTO plans (id, projectid, activity, startdate, enddate)
VALUES (19, 1, 'Planning', '2019-11-21', '2019-11-30');
INSERT INTO plans (id, projectid, activity, startdate, enddate)
VALUES (23, 2, 'Planning', '2019-11-14', '2019-11-30');
INSERT INTO plans (id, projectid, activity, startdate, enddate)
VALUES (24, 2, 'Requirement analysis', '2019-11-16', '2019-12-06');
INSERT INTO plans (id, projectid, activity, startdate, enddate)
VALUES (25, 2, 'Development', '2019-12-02', '2020-10-01');
INSERT INTO plans (id, projectid, activity, startdate, enddate)
VALUES (26, 2, 'Deployment', '2020-10-02', '2020-10-29');