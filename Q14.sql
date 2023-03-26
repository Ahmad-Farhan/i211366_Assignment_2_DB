USE AIRPORT;

/*Q16 ) Write a SQL query to find the names of employees who have worked on
		planes owned by a particular corporation, sorted by the total number
		of maintenance hours worked.*/


SELECT 
	CONCAT(FName, ' ', LName) AS Name,
	SUM(SHours) AS Total_Hours
FROM 
	MAINTAIN
		INNER JOIN SERVICE ON SERVICE.ID = MAINTAIN.Service_Id
		INNER JOIN PERSON ON PERSON.SSN = MAINTAIN.SSN,
	OWNED_BY
		INNER JOIN CORPORATION 
		ON OWNED_BY.CorporationID = CORPORATION.ID
WHERE 
	SERVICE.Plane_Id = OWNED_BY.PlaneID
	AND CORPORATION.Name = 'Emirates'
GROUP BY
	MAINTAIN.SSN, FName, LName