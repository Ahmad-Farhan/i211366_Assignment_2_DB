USE AIRPORT;

/*Q6 ) Write a SQL query to find the top 5 employees with the highest total 
	   number of maintenance hours worked.*/


SELECT TOP (5)
	SUM(SHours) as TotalHours, SSN
FROM
	MAINTAIN INNER JOIN SERVICE
	ON MAINTAIN.Service_Id = SERVICE.ID
GROUP BY 
	(MAINTAIN.SSN) 
ORDER BY 
	TotalHours DESC