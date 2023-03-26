USE AIRPORT;

/*Q15 ) Write a SQL query to find the names of pilots who are qualified to fly
        a plane that is currently undergoing maintenance.*/


SELECT DISTINCT
	CONCAT(FName, ' ', LName) AS Name,
	FLIES.Model
FROM
	FLIES INNER JOIN PERSON
	ON PERSON.SSN = FLIES.SSN
WHERE
	FLIES.Model IN ( 
		SELECT
			Of_Type
		FROM
			SERVICE INNER JOIN AIRPLANE	
			ON AIRPLANE.RegNo = SERVICE.Plane_Id
		WHERE 
			SERVICE.Status = 'U' 
	)