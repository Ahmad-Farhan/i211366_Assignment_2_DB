USE AIRPORT;

/*Q7 ) Write a SQL query to find the names and registration numbers of airplanes
	   that have undergone maintenance in the past week.*/


SELECT
	Of_Type,
	RegNo 
FROM 
	AIRPLANE INNER JOIN SERVICE
	ON AIRPLANE.RegNo = SERVICE.Plane_Id
WHERE
	DATEDIFF(DAY, SERVICE.SDate, GETDATE()) < 7 


/*		Alternate Solution
SELECT 
	Of_Type, RegNo 
FROM 
	AIRPLANE INNER JOIN SERVICE 
	ON AIRPLANE.RegNo = SERVICE.Plane_Id
WHERE
	SERVICE.SDate > GETDATE() - 7
*/