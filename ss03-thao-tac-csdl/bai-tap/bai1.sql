create database thaotaccsdl_1;
use thaotaccsdl_1;
create table Class(
	Class_ID int not null auto_increment primary key,
    Class_Name varchar(50) not null,
    Start_Date date not null,
    Status bit
);

create table Student(
	Student_ID int not null auto_increment primary key, 
    Student_Name varchar(50) not null, 
    Address varchar(50),
    Phone varchar(11),
    Status bit,
    Class_ID int not null, 
    constraint FK_Student_Class_ID foreign key (Class_ID) references Class(Class_ID)
);

create table Subject(
	Sub_ID int not null auto_increment primary key, 
    Sub_Name varchar(50) not null,
    Credit tinyint not null default 1 check (Credit >= 1),
    Status bit default 1
);

create table Mark(
	Mark_ID int not null auto_increment primary key, 
    Sub_ID int not null,
    Student_ID int not null,
    Mark float default 0 check (mark between 0 and 100),
    Exam_Times tinyint default 1,
	unique (Sub_ID, Student_ID),
    constraint FK_Mark_Sub_ID foreign key (Sub_ID) references Subject(Sub_ID),
    constraint FK_Mark_Student_ID foreign key (Student_ID) references Student(Student_ID)
);

insert into Class
values (1, 'A1', '2008-12-20', 1);
insert into Class
values (2, 'A2', '2008-12-22', 1);
insert into Class
values (3, 'B3', current_date, 0);

insert into Student (Student_Name, Address, Phone, Status, Class_ID)
values ('Hung', 'Ha Noi', '0912113113', 1, 1);
insert into Student (Student_Name, Address, Status, Class_ID)
values ('Hoa', 'Hai phong', 1, 1);
insert into Student (Student_Name, Address, Phone, Status, Class_ID)
values ('Manh', 'HCM', '0123123123', 0, 2);

insert into Subject
values (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);

insert into Mark(Sub_ID, Student_ID, Mark, Exam_Times)
values (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1);
       
-- Hiển thị tất cả sinh viên có tên bắt đầu = h
select Student_Name from Student where Student_Name like 'h%';

-- Hiển thị các thông tin lớp học có thời gian bắt đầu tháng 12
select * from Class where month(Start_Date) = 12;

-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
select * from Subject where Credit between 3 and 5;

-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
update Student
set Class_ID = 2
where Student_Name = 'Hung';

--  Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.
select S.Student_Name, Sub.Sub_Name, M.Mark
from Student S join Mark M on S.Student_ID = M.Student_ID join Subject Sub on Sub.Sub_ID = M.Sub_ID
order by M.Mark desc;


select * from Subject; 
select * from Mark;
select * from Class;
select * from Student;

