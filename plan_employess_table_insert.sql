CREATE TABLE plan_employee
(
    planid     INTEGER NOT NULL
        CONSTRAINT planemployee_plans_id_fk
            REFERENCES plans,
    employeeid INTEGER NOT NULL
        CONSTRAINT planemployee_employees_id_fk
            REFERENCES employees
);

ALTER TABLE plan_employee
    OWNER TO postgres;

INSERT INTO plan_employee (planid, employeeid) VALUES (20, 1);
INSERT INTO plan_employee (planid, employeeid) VALUES (20, 15);
INSERT INTO plan_employee (planid, employeeid) VALUES (20, 18);
INSERT INTO plan_employee (planid, employeeid) VALUES (20, 34);
INSERT INTO plan_employee (planid, employeeid) VALUES (21, 2);
INSERT INTO plan_employee (planid, employeeid) VALUES (21, 4);
INSERT INTO plan_employee (planid, employeeid) VALUES (19, 7);
INSERT INTO plan_employee (planid, employeeid) VALUES (19, 45);
INSERT INTO plan_employee (planid, employeeid) VALUES (19, 23);
INSERT INTO plan_employee (planid, employeeid) VALUES (19, 25);
INSERT INTO plan_employee (planid, employeeid) VALUES (23, 5);
INSERT INTO plan_employee (planid, employeeid) VALUES (23, 29);
INSERT INTO plan_employee (planid, employeeid) VALUES (23, 19);