USE AIRPORT;

/*Q23 ) Write a Query to find the average salary of employees in each shift.*/


SELECT 
	Name, 
	COUNT(*) AS Planes_Owned 
FROM OWNED_BY
	INNER JOIN CORPORATION ON OWNED_BY.CorporationID = CORPORATION.ID
GROUP BY
	CorporationID, Name
UNION 
SELECT 
	CONCAT(FName, ' ', LName) AS Name,
	COUNT(*) AS Planes_Owned
FROM 
	OWNED_BY INNER JOIN PERSON 
	ON PERSON.SSN = OWNED_BY.PersonSSN 
GROUP BY 
	PersonSSN, FName, LName