CREATE TABLE projectcost
(
    projectid INTEGER
        CONSTRAINT projectcost_projects_id_fk
            REFERENCES projects,
    totalcost INTEGER DEFAULT 0 NOT NULL
);

ALTER TABLE projectcost
    OWNER TO postgres;