USE AIRPORT;

/*Q22 ) Write a Query to find the average salary of employees in each shift.*/


SELECT 
	EShift AS Shift_Time,
	AVG(Salary) AS Average_Salary
FROM 
	EMPLOYEE
GROUP BY
	EMPLOYEE.EShift