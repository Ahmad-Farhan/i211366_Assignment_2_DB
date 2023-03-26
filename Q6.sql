USE AIRPORT;

/*Q8 ) Write a SQL query to find the names and phone numbers of all owners who 
	   have purchased a plane in the past month.*/


SELECT 
	CONCAT(FName, ' ', LName) AS Name,
	Phone 
FROM
	PERSON INNER JOIN OWNED_BY
	ON PERSON.SSN = OWNED_BY.PersonSSN
WHERE
	DATEDIFF(MONTH, OWNED_BY.PDATE, GETDATE()) <= 1
UNION
SELECT 
	Name,
	Phone 
FROM 
	CORPORATION INNER JOIN OWNED_BY 
	ON CORPORATION.ID = OWNED_BY.CorporationID
WHERE 
	DATEDIFF(MONTH, OWNED_BY.PDATE, GETDATE()) <= 1