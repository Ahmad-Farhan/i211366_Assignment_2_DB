USE AIRPORT;

/*Q13 ) Write a SQL query to find the names of owners who have purchased a plane
		that requires maintenance work from an employee who is not qualified to
		work on that type of plane.*/


SELECT
	CONCAT(FName, ' ', LName) AS Name,
	RegNo 
FROM 
	OWNED_BY
		INNER JOIN PERSON ON OWNED_BY.PersonSSN = PERSON.SSN
		INNER JOIN AIRPLANE ON AIRPLANE.RegNo = OWNED_BY.PlaneID
WHERE 
	AIRPLANE.RegNo IN (
		SELECT 
			SERVICE.Plane_Id 
		FROM 
			MAINTAIN
				INNER JOIN SERVICE ON SERVICE.ID = MAINTAIN.Service_Id
				INNER JOIN PERSON ON PERSON.SSN = MAINTAIN.SSN
		WHERE
			SERVICE.Status = 'S' AND 
			PERSON.SSN NOT IN ( 
				SELECT
					PERSON.SSN
				FROM
					WORKS_ON INNER JOIN PERSON 
					ON PERSON.SSN = WORKS_ON.SSN
				WHERE
					AIRPLANE.Of_Type = WORKS_ON.Model
			)
	)
