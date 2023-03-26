USE AIRPORT;

/*Q14 ) Write a SQL query to find the names and phone numbers of owners who have
purchased a plane from a corporation that has a hangar in the same location as the
owner.*/


SELECT 
	CONCAT(FName, ' ', LName) AS Name,
	PERSON.Phone,
	C.ID
FROM 
	OWNED_BY 
		INNER JOIN PERSON ON OWNED_BY.PersonSSN = PERSON.SSN
		INNER JOIN CORPORATION C ON OWNED_BY.PurchasedFrom = C.ID
WHERE
	PERSON.Location IN (
		SELECT 
			HANGAR.Location
		FROM 
			CORPORATION	INNER JOIN HANGAR
			ON CORPORATION.ID = HANGAR.OWNER
		WHERE 
			C.ID = HANGAR.Owner
	)