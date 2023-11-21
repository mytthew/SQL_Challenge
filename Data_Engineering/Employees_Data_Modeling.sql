-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/Ge3nsB
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Departments" (
    "Dept_No" VARCHAR   NOT NULL,
    "Dept_Name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "Dept_No"
     )
);

CREATE TABLE "Dep_Emp" (
    "Emp_No" INT   NOT NULL,
    "Dept_No" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Dep_Emp" PRIMARY KEY (
        "Emp_No"
     )
);

CREATE TABLE "Dep_Manager" (
    "Dept_No" VARCHAR   NOT NULL,
    "Emp_No" INT   NOT NULL,
    CONSTRAINT "pk_Dep_Manager" PRIMARY KEY (
        "Dept_No"
     )
);

CREATE TABLE "Employees" (
    "Emp_No" INT   NOT NULL,
    "Emp_Title_ID" VARCHAR   NOT NULL,
    "Birth_Date" DATE   NOT NULL,
    "First_Name" VARCHAR   NOT NULL,
    "Last_Name" VARCHAR   NOT NULL,
    "Sex" VARCHAR   NOT NULL,
    "Hire_Date" DATE   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "Emp_No"
     )
);

CREATE TABLE "Salaries" (
    "Emp_No" INT   NOT NULL,
    "Salary" INT   NOT NULL,
    CONSTRAINT "pk_Salaries" PRIMARY KEY (
        "Emp_No"
     )
);

CREATE TABLE "TITLES" (
    "Title_ID" VARCHAR   NOT NULL,
    "Title" VARCHAR   NOT NULL,
    CONSTRAINT "pk_TITLES" PRIMARY KEY (
        "Title_ID"
     )
);

ALTER TABLE "Departments" ADD CONSTRAINT "fk_Departments_Dept_No" FOREIGN KEY("Dept_No")
REFERENCES "Dep_Manager" ("Dept_No");

ALTER TABLE "Dep_Emp" ADD CONSTRAINT "fk_Dep_Emp_Emp_No" FOREIGN KEY("Emp_No")
REFERENCES "Employees" ("Emp_No");

ALTER TABLE "Dep_Manager" ADD CONSTRAINT "fk_Dep_Manager_Emp_No" FOREIGN KEY("Emp_No")
REFERENCES "Employees" ("Emp_No");

ALTER TABLE "Employees" ADD CONSTRAINT "fk_Employees_Emp_No" FOREIGN KEY("Emp_No")
REFERENCES "Salaries" ("Emp_No");

ALTER TABLE "TITLES" ADD CONSTRAINT "fk_TITLES_Title_ID" FOREIGN KEY("Title_ID")
REFERENCES "Employees" ("Emp_Title_ID");

