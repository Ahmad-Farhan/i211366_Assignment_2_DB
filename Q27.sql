USE AIRPORT;

/*Q25.d ) Write a SQL query to find the Number of Plane types each employee
		  is authorized to work on sorted by the total number*/


SELECT
	CONCAT(FName, ' ', LName) AS Name,
	COUNT(*) AS No_Of_PlaneTypes
FROM 
	EMPLOYEE
		INNER JOIN WORKS_ON ON WORKS_ON.SSN = EMPLOYEE.PSSN
		INNER JOIN PERSON ON EMPLOYEE.PSSN = PERSON.SSN
GROUP BY
	WORKS_ON.Model, 
	PERSON.FName, 
	PERSON.LName
ORDER BY
	No_Of_PlaneTypes DESC


/*Importance: 
	Can be used to find which employee has the most authorization.
	May be used when considering job promotions*/
