USE AIRPORT;

/*Q9 ) Write a SQL query to find the number of airplanes each pilot is authorized to fly.*/


SELECT 
	FLIES.SSN,
	CONCAT(FName, ' ', LName) AS Name,
	COUNT(*) No_of_planes
FROM 
	FLIES 
		INNER JOIN PILOT ON FLIES.SSN = PILOT.PSSN
		INNER JOIN PERSON ON PERSON.SSN = PILOT.PSSN
GROUP BY
	FLIES.SSN,
	PERSON.FName,
	PERSON.LName
ORDER BY
	No_of_planes DESC