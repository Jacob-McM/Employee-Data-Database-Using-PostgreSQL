-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/

--- Drop Table cluster exists for any issues that might occur during csv import. 

-- DROP TABLE tbl_department CASCADE;

-- DROP TABLE tbl_dept_employee CASCADE;

-- DROP TABLE tbl_dept_manager CASCADE;

-- DROP TABLE tbl_employees CASCADE;

-- DROP TABLE tbl_salaries CASCADE;

-- DROP TABLE tbl_titles CASCADE;

--- Table Schema Creation

--- Department Table contains the department number and the department name. The department number is a primary key.
CREATE TABLE "tbl_department" (
    "dept_no" varchar   NOT NULL,
    "dept_name" varchar   NOT NULL,
    CONSTRAINT "pk_tbl_department" PRIMARY KEY (
        "dept_no"
     )
);

--- Department Employee Table contains the associated department number for each employee number.
CREATE TABLE "tbl_dept_employee" (
    "employee_no" varchar   NOT NULL,
    "dept_no" varchar   NOT NULL
);

--- Department Manager table contains the associated Managers employee number and their associated department
CREATE TABLE "tbl_dept_manager" (
    "dept_no" varchar   NOT NULL,
    "employee_no" varchar   NOT NULL
);

--- Employees table contains the employee number associated with the employees title ID, date of birth, first name, last name, gender, and date of hire.
--- The employee number is the primary key.
CREATE TABLE "tbl_employees" (
    "employee_no" varchar   NOT NULL,
    "title_id" varchar   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" varchar   NOT NULL,
    "last_name" varchar   NOT NULL,
    "gender" varchar   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_tbl_employees" PRIMARY KEY (
        "employee_no"
     )
);

--- Salaries table containing the salary of the associated employee number
CREATE TABLE "tbl_salaries" (
    "employee_no" varchar   NOT NULL,
    "salary" int   NOT NULL,
    CONSTRAINT "pk_tbl_salaries" PRIMARY KEY (
        "employee_no"
     )
);

--- Titles table containing title ID and the associated title.
CREATE TABLE "tbl_titles" (
    "title_id" varchar   NOT NULL,
    "title" varchar   NOT NULL,
    CONSTRAINT "pk_tbl_titles" PRIMARY KEY (
        "title_id"
     )
);


-- Alter Table scripts to add foriegn key constraints based off employee number and department number for table relationships.

ALTER TABLE "tbl_dept_employee" ADD CONSTRAINT "fk_tbl_dept_employee_employee_no" FOREIGN KEY("employee_no")
REFERENCES "tbl_employees" ("employee_no");

ALTER TABLE "tbl_dept_manager" ADD CONSTRAINT "fk_tbl_dept_manager__dept_no" FOREIGN KEY("dept_no")
REFERENCES "tbl_department" ("dept_no");

ALTER TABLE "tbl_dept_manager" ADD CONSTRAINT "fk_tbl_dept_manager_employee_no" FOREIGN KEY("employee_no")
REFERENCES "tbl_employees" ("employee_no");

ALTER TABLE "tbl_salaries" ADD CONSTRAINT "fk_tbl_salaries_employee_no" FOREIGN KEY("employee_no")
REFERENCES "tbl_employees" ("employee_no");

