use jaydb;
select * from employee;
select distinct Salary from employee;
select * from employee where EmpName='Rahul';
select * from employee order by EmpName Desc;
select * from employee where City='Noida' AND Salary=20000;
select * from employee where City='Noida' OR Salary<20000;
select * from employee where Not Salary=20000;
select * from employee where EmpName IN ('Jay Sharma','Amit');
select * from employee where EmpName NOT IN ('Jay Sharma','Amit');
select * from employee where ID Between 3 AND 5;
select * from employee where ID NOT Between 3 AND 5;
select * from employee where City Like 'B%';/*start with B*/
select * from employee where City Like '%a';/*end with a*/
select * from employee where City Like '_u%';/* specified position*/
select * from employee where City NOT Like 'B%';/* not start with B*/
select * from employee where City Not Like '%a';/* not end with a*/
select * from employee where City Not Like '_u%';/*not specified position*/
select  max(Salary) As Result from employee; 
select  min(Salary) As Result from employee; 
select sum(Salary) as Result from employee where ID between 1 and 3;
select Avg(Salary) as Result from employee where ID between 1 and 3;
select count(ID) as Result from employee where City='Noida';
/*alter table employee modify ID int Not Null UNIQUE;*/
alter table employee add primary key (ID);

select * from employee;

create table Department(
DeptID int not null primary key,
DeptName varchar(255) not null,
EmpID int foreign key references employee(ID)
);

select * from Department;
insert into Department values(3,'Finance',3);

alter table employee add constraint Salary check (Salary>=20000);
insert into employee values(7,'Harsh','Gurgaon',19000);
update employee set Salary=22000 where id=4;/* single column*/
update employee set EmpName='Rahul Pandit', City='Greater Noida' where id=4;/* multiple column*/

create procedure AllRecords As 
select * from employee
Go;/* Simple Stored Procedure*/

exec AllRecords;

create procedure AllRecords2 @City varchar(255) As 
select * from employee where City=@City;/*Parameterised stored procedure */

exec AllRecords2 @City='Greater Noida';

create procedure AllRecords3 @City varchar(255), @EmpName varchar(255) As 
select * from employee where City=@City And EmpName=@EmpName;/*multiple Parameterised stored procedure */

exec AllRecords3 @City='Greater Noida',@EmpName='Rahul Pandit';


/* Create Indexes*/
Create index MyIndx
on employee (EmpName);

Create index MyIndx2
on employee (EmpName,Salary);

Drop index employee.MyIndex2;/* Delete Index*/
select * into EmpBackup2023 from employee;/* Copy data one table to another */
select * from EmpBackup2023;

select Top 2 * from EmpBackup2023;/* Top Clause */
select Top 3 EmpName,Salary from EmpBackup2023;
select Top 50 percent * from Employee;/* Based on percentage*/

backup database jaydb to disk='C:\Users\Jay Sharma\Documents\SQL Server Management Studio';/* database backup*/

create view [employee salary1] as select * from employee where ID between 1 and 3; /* create view*/
select * from [employee salary1];
drop view [employee salary];