use sarie;

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
    
create table program (
	facultyID varchar(20),
    departmentID varchar(20),
	programID varchar(20),
    programName varchar(30),
    tuitionFee int,
    primary key(facultyID,departmentID,programID),
    foreign key(facultyID,departmentID)
    references department(facultyID,departmentID));

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
    foreign key(facultyID,departmentID,programID) 
	references program(facultyID,departmentID,programID));


    
create table course(
	courseID varchar(20),
    courseName varchar(20),
    academicYear year,
    term int,
	unit int, 
    facultyID varchar(20),
    departmentID varchar(20),
    primary key(courseID,academicYear,term),
    foreign key(facultyID,departmentID) 
    references department(facultyID,departmentID));
    
    
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
    


    
create table teaching(
	TID varchar(20),
    courseID varchar(20),
    academyYear varchar(4),
	term int,
    primary key(TID,courseID,academyYear,term));
    

    
create table  testplace(
	courseID varchar(20),
    academicYear year,
    term int,
    acronym varchar(20),
    roomNo varchar(20),
    testDate date,
    testTime varchar(30),
    primary key(courseID,academicYear,term),
    foreign key(courseID,academicYear,term) references course(courseID,academicYear,term),
    foreign key(acronym,roomNo)references room(acronym,roomNo));


create table contain (
	facultyID varchar(20),
    departmentID varchar(20),
	programID varchar(20),
    courseID varchar(20),
    academicYear year,
    term int);
 
delete from teacher where TID ='SPJ';   
select * from faculty;
select * from department;
select * from program;
select * from teacher;
select * from course;
select * from section;
select * from building;
select * from testplace;


drop table program;

insert into faculty value('21','Engineering');
insert into department value('21','10','Computer');
insert into program value('21','10','B.ENG','Computer Engineering',21000);

insert into teacher value('SPJ','Somchai','Prasitjutrakul','1954-04-12','M','Assc.Prof','21','10',sha2('password',256));
insert into teacher value('WWW','Wiwat','Vatanawood','1967-10-17','M','Assc.Prof','21','10',sha2('password',256));
insert into teacher value('TSV','Twittie','Senivongse','1970-03-07','F','Assc.Prof','21','10',sha2('password',256));
insert into teacher value('KPR','Krerk','Piromsopa','1968-12-04','M','Asst.Prof','21','10',sha2('password',256));
insert into teacher value('CPP','Chairat','Phongphanphanee','1962-11-25','M','Dr','21','10',sha2('password',256));

insert into student value('5831080421','Ariya','Areechot','1996-10-03','M','bechelor','CPP','21','10','B.ENG',sha2("password",256));
insert into student value('5831078221','Siraphat','Gruysiriwong','1996-09-15','M','bechelor','CPP','21','10','B.ENG',sha2("12345",256));

insert into course value('2110422','DB MGT SYS DESIGN',2017,2,3,21,10);
insert into course value('2110332','SYS ANALYSIS DSGN',2017,2,3,21,10);
insert into course value('2110327','ALGORITHM DESIGN',2017,1,3,21,10);
insert into course value('2110353','COMP SYS ARCH',2016,2,3,21,10);

insert into building value('ENG3','ENGINEERING 3',4,'21');

insert into room value('ENG3','204','lecture',40);
insert into room value('ENG3','417','lecture',50);
insert into room value('ENG3','321','lecture',50);
insert into room value('ENG3','304','lecture',60);

delete from section where courseID="2110327" and academicYear=2017 and term=1;
insert into section value('2110422',2017,2,'2',30,'ENG3','204','TU 8.00-9.30,TH 8.00-9.30');
insert into section value('2110332',2017,2,'33',30,'ENG3','321','TU 9.30-11.00,TH 9.30-11.00');
insert into section value('2110327',2017,1,'1',30,'ENG3','304','TU 8.00-9.30,TH 8.00-9.30');
insert into section value('2110353',2016,2,'1',30,'ENG3','417','MO 9.00-11.00');

insert into register value('5831080421','2110422',2017,2,2,'A+');
insert into teaching value('SPJ','2110422',2017,2);
insert into testplace value ('2110422',2017,2,'ENG3','204','2018-05-13','13.00-16.00');