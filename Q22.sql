USE AIRPORT;

/*Q24 ) Write a Query to find the number of planes each pilot is authorized to fly.*/


SELECT 
	CONCAT(FName, ' ', LName) AS Name,
	COUNT(*) AS No_of_Planes
FROM 
	FLIES INNER JOIN PERSON
	ON FLIES.SSN = PERSON.SSN
GROUP BY
	FLIES.SSN, FName, LName