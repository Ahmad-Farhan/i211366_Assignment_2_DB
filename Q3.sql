USE AIRPORT;

/*Q5 ) Write a SQL query to find the average salary
	   of employees who work the night shift.*/


SELECT AVG(Salary) AS AvgSalary
FROM EMPLOYEE
WHERE EShift = 'Night'