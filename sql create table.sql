use sarie;


create table student(
	SID varchar(20),
    Fname varchar(50),
    Lname varchar(50),
	Bdate date,
    sex varchar(1),
    degree varchar(50),
    TID varchar(20),
    facultyID varchar(20),
    departmentID varchar(20),
    programID varchar(20),
    loginPassword varchar(256),
    primary key(SID),
    foreign key(TID)references teacher(TID),
    foreign key(facultyID,departmentID) references department(facultyID,departmentID));

create table teacher(
	TID varchar(20),
	Fname varchar(20),
    Lname varchar(20),
	Bdate date,
    sex varchar(1),
    postion varchar(20),
    facultyID varchar(20),
    departmentID varchar(20),
    loginPassword varchar(256),
    primary key(TID),
    foreign key(facultyID,departmentID) references department(facultyID,departmentID));



create table faculty(
	facultyID varchar(20),
	facultyName varchar(20),
    primary key(facultyID));
    
create table department(
	facultyID varchar(20),
    departmentID varchar(20),
	departName varchar(20),
    primary key(facultyID,departmentID),
    foreign key(facultyID) references faculty(facultyID));

    
create table course(
	courseID varchar(20),
    courseName varchar(20),
    academicYear year,
    term int,
	unit int, 
    facultyID varchar(20),
    departmentID varchar(20),
    primary key(courseID,academicYear,term),
    foreign key(facultyID,departmentID) references department(facultyID,departmentID));
    
create table section(
	courseID varchar(20),
    academicYear year,
    term int,
	sectionNo varchar(2),
    seat int,
    acronym varchar(20),
    roomNo varchar(20),
    learningTime varchar(100),
	primary key(courseID,academicYear,term,sectionNo),
	foreign key(courseID,academicYear,term)references course(courseID,academicYear,term),
    foreign key(acronym,roomNo) references room(acronym,roomNo));
    
    drop table section;
    
create table building(
	acronym varchar(20),
    buildingName varchar(20),
    nuberFloor int,
    facultyID varchar(20),
    primary key(acronym),
    foreign key(facultyID) references faculty(facultyID));
    
create table room (
	acronym varchar(20),
    roomNo varchar(20),
    roomtype varchar(20),
    seat int,
    primary key(acronym,roomNO));
    

    
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
	SID varchar(20),
    courseID varchar(20),
    academicYear year,
	term int,
    sectionNo varchar(2),
    grade varchar(2) default 'x',
    primary key (SID,courseID,academicYear,term),
    foreign key(SID)references student(SID),
    foreign key(courseID,academicYear,term) references course(courseID,academicYear,term));
    
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
 
 delete from teacher where TID ='SPJ';   
select * from teacher;
select * from course;
delete from faculty where facultyID='ENG';
insert into faculty value('21','Engineering');
insert into department value('21','10','Computer');
insert into teacher value('SPJ','somchai','pasitijude','1954-04-12','M','professer','21','10',sha2('password',256));
insert into student value('5831080421','ariya','areechot','1996-10-03','M','bechelor','SPJ','21','10','normal',sha2("password",256));
insert into course value('2110422','DB MGT SYS DESIGN',2017,2,3,21,10);
insert into building value('ENG3','ENGINEERING 3',4,'21');
insert into room value('ENG3','204','lecture',40);
insert into section value('2110422',2017,2,'2',30,'ENG3','204','TU 8.00-9.30,TH 8.00-9.30');
insert into register value('5831080421','2110422',2017,2,2,'A+');