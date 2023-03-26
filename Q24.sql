USE AIRPORT;

/*Q25.b ) Write a SQL query to find the Number of employees per shift*/


SELECT
	EShift,
	COUNT(*) AS No_Of_Employees
FROM 
	EMPLOYEE
GROUP BY
	EShift


/*Importance: 
	Can be used to determine the shift-wise distribution of employees*/
