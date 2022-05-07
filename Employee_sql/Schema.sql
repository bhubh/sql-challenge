-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.
drop table if exists "Title"
drop table if exists "Employee"
drop table if exists "Department"
drop table if exists "Depart_employee"
drop table if exists "Depart_manager"
drop table if exists "Salary"


CREATE TABLE "Title" (
    "title_id" varchar  PRIMARY KEY NOT NULL,
    "title" varchar   NOT NULL
);

select * from "Title"


CREATE TABLE "Employee" (
    "emp_no" int   NOT NULL,
    "emp_title_id" varchar   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" varchar   NOT NULL,
    "lasts_name" varchar   NOT NULL,
    "sex" varchar(50)   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_Employee" PRIMARY KEY ("emp_no"),
	FOREIGN KEY("emp_title_id") REFERENCES "Title" ("title_id")
);

select * from "Employee"

CREATE TABLE "Department" (
    "dept_no" varchar   NOT NULL,
    "dept_name" varchar   NOT NULL,
    CONSTRAINT "pk_Department" PRIMARY KEY ("dept_no")
);

select * from "Department"

CREATE TABLE "Depart_employee" (
    "emp_no" int   NOT NULL,
    "dept_no" varchar(255)   NOT NULL,
    CONSTRAINT "pk_Depart_employee" PRIMARY KEY ("emp_no","dept_no"),
	FOREIGN KEY("emp_no") REFERENCES "Employee" ("emp_no"),
	FOREIGN KEY("dept_no") REFERENCES "Department" ("dept_no")
);

select * from "Depart_employee"

CREATE TABLE "Depart_manager" (
    "dept_no" varchar(255)   NOT NULL,
    "emp_no" int   NOT NULL,
    CONSTRAINT "pk_Depart_manager" PRIMARY KEY ("dept_no","emp_no"),
	FOREIGN KEY("emp_no") REFERENCES "Employee" ("emp_no"),
	FOREIGN KEY("dept_no") REFERENCES "Department" ("dept_no")
);

select * from "Depart_manager"

CREATE TABLE "Salary" (
    "emp_no" int   NOT NULL,
    "salary" int   NOT NULL,
    CONSTRAINT "pk_Salary" PRIMARY KEY ("emp_no"),
	FOREIGN KEY("emp_no") REFERENCES "Employee" ("emp_no")
);

select * from "Salary"




