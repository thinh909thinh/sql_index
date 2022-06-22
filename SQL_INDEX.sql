CREATE DATABASE Lab10
go
use Lab10
create table Classes (
	ClassName char(6),
	Teacher varchar(30),
	TimeSlot varchar(30),
	Class int,
	Lab int
)
CREATE UNIQUE CLUSTERED  INDEX MyClusteredIndex ON Classes
(
    ClassName ASC
)WITH (PAD_INDEX = ON, FILLFACTOR=70,Ignore_Dup_Key=on)
 CREATE  nonclustered index TeacherIndex ON Classes (Teacher)
 DROP INDEX TeacherIndex ON Classes
  ----------------Tạo lại MyClusteredIndexvới các thuộc tính sau:DROP_EXISTING, ALLOW_ROW_LOCKS, ALLOW_PAGE_LOCKS= ON, MAXDOP = 2.
  ---------------- (Tìm hiểu thêm về các thuộc tính trên)
--------------5. Tạo một composite index tên là ClassLabIndex trên 2 trường Class và Lab.
------------------6. Viết câu lệnh xem toàn bộ các chỉ mục của cơ sở dữ liệu Aptech.

CREATE UNIQUE CLUSTERED  INDEX MyClusteredIndex ON Classes
(
    ClassName ASC
)WITH (DROP_EXISTING= ON , ALLOW_ROW_LOCKS= ON , ALLOW_PAGE_LOCKS= ON, MAXDOP = 2)
CREATE   INDEX com ON Classes(ClassName,Lab)
-------liet ke
select * from sys.indexes
where object_id =3 -------------(select object_id from sys.objects )

exec sp_helpindex 'Classes'

----------------------------------BRVN-------------
create table Student(
	StudentNo int Primary Key,
	StudentName varchar(50),
	StudentAddress varchar(100),
	PhoneNo int
	
)
create table Department(
	DeptNo int Primary Key,
	DeptName varchar(50),
	ManagerName char(30)
)
create table Assignment(
AssignmentNo int Primary Key,
Description varchar(100)
)
create table Works_Assign(
	JobID int Primary Key,
	StudentNo int,
	AssignmentNo int,
	TotalHours int,
	JobDetails XML
)
alter table Works_Assign 
drop constraint PK__Works_As__056690E2EE5905F8

alter table Student
drop constraint pk_123

create clustered index IX_Student
on Student(StudentNo)
--------------------------------------------------------sp_rename 'Student.IX_Student', 'IX_Students' ,'INDEX'
--2
alter index IX_Student on Student rebuild with(fillfactor = 60)

--3
create nonclustered index IX_Dept
on Department(DeptNo,DeptName,ManagerName)
