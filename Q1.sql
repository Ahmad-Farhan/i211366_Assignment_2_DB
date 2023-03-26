USE AIRPORT;

/*Q3 ) Write a SQL query to find the registration numbers of airplanes that
	   have never undergone maintenance.*/


SELECT 
	RegNo
FROM 
	AIRPLANE LEFT JOIN SERVICE
	ON AIRPLANE.RegNo = SERVICE.Plane_Id
WHERE 
	SERVICE.Plane_Id IS NULL
	OR (SERVICE.Status = 'S'
	AND AIRPLANE.RegNo NOT IN (
		SELECT 
			SERVICE.Plane_Id FROM SERVICE
		WHERE 
			SERVICE.Status IN ('C' ,'U')
		)
	)