use sarie;


create table student(
	studentID varchar(20),
    fName varchar(20),
    LName varchar(20),
	bDate date,
    sex varchar(1),
    degree varchar(20),
    teacherID varchar(20),
    facultyID varchar(20),
    departmentID varchar(20),
    programID varchar(20),
    loginPassword varchar(256),
    primary key(studentID));

create table teacher(
	teacherID varchar(20),
	fName varchar(20),
    lName varchar(20),
	bDate date,
    sex varchar(1),
    postion varchar(20),
    facultyID varchar(20),
    departmentID varchar(20),
    loginPassword varchar(256),
    primary key(teacherID));

create table course(
	courseID varchar(20),
    courseName varchar(20),
    academicYear year,
    term int,
	unit int, 
    facultyID varchar(20),
    departmentID varchar(20),
    constraint pkCourse primary key(courseID,acdemicYear,term));

create table faculty(
	facultyID varchar(20),
	facultyName varchar(20),
    primary key(facultyID));

create table building(
	acronym varchar(20),
    buildingName varchar(20),
    roomNo varchar(20),
    roomType varchar(10),
	seat int,
    primary key(acronym) );
    
create table section(
	courseID varchar(20),
    academicYear year,
    term int,
	sectionNo varchar(2),
    seat int,
    acronym varchar(20),
    roomNo varchar(20),
    learningTime varchar(30),
	primary key(courseID,academicYear,term,sectionNo),
	foreign key(courseID)references course(courseID),
    foreign key(academicYear)references course(academicYear),
	foreign key(term)references course(term));

create table room (
	acronym varchar(20),
    roomNo varchar(20),
    roomtype varchar(20),
    seat int,
    primary key(acronym,roomNO));
    
create table department(
	facultyID varchar(20),
    departmentID varchar(20),
	departName varchar(20));
    
create table program (
	facultyID varchar(20),
    departmentID varchar(20),
	programID varchar(20),
    programName varchar(30),
    tuitionFee int);
    
create table teaching(
	teacherID varchar(20),
    courseID varchar(20),
    academyYear varchar(4),
	term int);
    
create table register(
	studentID varchar(20),
    courseID varchar(20),
    academicYear year,
	term int,
    sectionNo varchar(2),
    grade varchar(1));
    
create table  testplace(
	ourseID varchar(20),
    academicYear year,
    term int,
    acronym varchar(20),
    roomNo varchar(20),
    testDate date,
    testTime time);

create table contain (
	facultyID varchar(20),
    departmentID varchar(20),
	programID varchar(20),
    courseID varchar(20),
    academicYear year,
    term int);