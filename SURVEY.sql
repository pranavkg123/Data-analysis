create database survey;
show databases;
use survey;
create table salary(Age_Range varchar(10),Industry varchar(1000),Job_Title varchar(1000),Clarification_of_Job_title varchar(1000),	
Annual_Salary varchar(100),Additional_Monetary_Compensation varchar(100),Currency varchar(100),Income_Clarification varchar(1000),Country varchar(1000),
State varchar(100),City varchar(100),Overall_Experience varchar(100),Professional_Experience varchar(100),Highest_Graduation varchar(100),
Gender varchar(100));
select * from salary;

#a.Average Salary by Industry and Gender
SELECT Industry,Gender,AVG(Annual_Salary) AS Avg_Salary
FROM salary GROUP BY Industry,Gender ORDER BY Industry,Gender;

#b.Total Salary Compensation by Job Title
SELECT job_title,SUM(Annual_Salary + Additional_Monetary_Compensation) AS total_compensation
FROM salary GROUP BY Job_Title ORDER BY total_compensation DESC;

#c.Salary Distribution by Education Level
SELECT Highest_Graduation,AVG(Annual_Salary) AS avg_salary,MIN(Annual_Salary) AS min_salary,MAX(Annual_Salary) AS max_salary
FROM salary GROUP BY Highest_Graduation ORDER BY avg_salary;

#d.Number of Employees by Industry and Years of Experience
SELECT Industry,Overall_Experience,COUNT(*) AS employee_count
FROM salary 
GROUP BY Industry, Overall_Experience ORDER BY Industry, Overall_Experience;
    
#e.Median Salary by Age Range and Gender
select ;

#f.Job Titles with the Highest Salary in Each Country
SELECT Job_Title,Country,MAX(Annual_Salary) as Max_salary FROM salary
GROUP BY Job_Title,Country ORDER BY Job_Title,Country;

#g.Average Salary by City and Industry
SELECT City,Industry,avg(Annual_Salary) as avg_salary
FROM salary GROUP BY City,Industry ORDER BY avg_salary DESC;

#h.Percentage of Employees with Additional Monetary Compensation by Gender

#i.Total Compensation by Job Title and Years of Experience
SELECT Job_Title,Overall_Experience,SUM(Annual_Salary + Additional_Monetary_Compensation) 
AS total_compensation
FROM salary GROUP BY Job_Title,Overall_Experience ORDER BY Job_Title,Overall_Experience;

#j.Average Salary by Industry, Gender, and Education Level
SELECT Industry,Gender,Highest_Graduation,avg(Annual_Salary) as avg_salary 
from salary GROUP BY Industry,Gender,Highest_Graduation 
ORDER BY Industry,Gender,Highest_Graduation;


SELECT distinct(Country) from salary;