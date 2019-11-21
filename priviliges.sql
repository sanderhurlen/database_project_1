/**
  MUST BE RUN BEFORE REMOVING ANY USER ROLES OR USER
DROP OWNED BY testrole;
*/

/* Removes the DEFAULT create permission in the public schema,
   or else, all users will be able to CREATE object even if the user is read-only
   */
REVOKE CREATE ON SCHEMA public FROM PUBLIC;

CREATE ROLE employee;

GRANT USAGE ON SCHEMA public TO employee;

GRANT SELECT ON TABLE plans, projects TO employee;
ALTER DEFAULT PRIVILEGES IN SCHEMA public REVOKE ALL ON TABLES FROM employee;


CREATE USER employee_user WITH PASSWORD '123456'; /* NOT SECURE :D */
GRANT employee TO employee_user;


CREATE ROLE supervisor;
CREATE ROLE management;

GRANT USAGE ON SCHEMA public TO supervisor, management;

GRANT SELECT ON ALL TABLES IN SCHEMA public TO management, supervisor;

GRANT INSERT, UPDATE ON TABLE activities, employees, plan_employee, plans, projects TO management;
GRANT INSERT, UPDATE ON TABLE activities, plan_employee, plans TO supervisor;
GRANT DELETE ON TABLE activities, employees, plan_employee TO management;

CREATE USER project_leader_user WITH PASSWORD 'Q!4tefjkeQWew';
CREATE USER management_user WITH PASSWORD 'k2v4i234ov9p!!';
