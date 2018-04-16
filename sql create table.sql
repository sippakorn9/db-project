use sarie;

create table person(userID varchar(20),Fname varchar(20),Lname varchar(20),
	Bdate date,sex varchar(1),FacultyID varchar(20),DepartmentID varchar(20),
    password varchar(256));
    
create table student(userID varchar(20),degree varchar(20),teacherID varchar(20));

create table teacher(userID varchar(20),postion varchar(20));

create table course(courseID varchar(20),academicYear year,term int,
	courseName varchar(20),unit int, FacultyID varchar(20),DepartmentID varchar(20));

create table faculty(facultyID varchar(20),FacultyName varchar(20));

create table building(acronym varchar(20),roomNo varchar(20),roomType varchar(10),
	seat int);
    
create table section(CourseID varchar(20),academicYear year,term int,
	sectionNo varchar(2),seat int,acronym varchar(20),roomNo varchar(20)
    ,learningTime varchar(30));

create table room (acronym varchar(20),roomNo varchar(20),roomtype varchar(20)
	,seat int);
    
create table department(facultyID varchar(20),departmentID varchar(20),
	departName varchar(20));
    
create table program (facultyID varchar(20),departmentID varchar(20),
	programID varchar(20),programName varchar(30),tuitionFee int);
    
create table teaching(teacherID varchar(20),courseID varchar(20),academyYear varchar(4),
	term int);
    
create table register(studentID varchar(20),courseID varchar(20),academicYear year,
	term int,sectionNo varchar(2),grade varchar(1));
    
create table  testplace(ourseID varchar(20),academicYear year,term int
	,acronym varchar(20),roomNo varchar(20),testDate date,testTime time);

create table contain (facultyID varchar(20),departmentID varchar(20),
	programID varchar(20),courseID varchar(20),academicYear year,term int);