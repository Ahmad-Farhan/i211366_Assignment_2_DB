USE AIRPORT;

/*Q18 ) Write a SQL query to find the names and addresses of owners who have
		purchased a plane from a corporation that has also purchased a plane
		of the same type in the past month.*/


SELECT 
	CONCAT(FName, ' ', LName) AS Name,
	CONCAT(Address, ' ', Location) AS Address
FROM
	OWNED_BY 
		INNER JOIN PERSON ON PERSON.SSN = OWNED_BY.PersonSSN
		INNER JOIN AIRPLANE ON AIRPLANE.RegNo = OWNED_BY.PlaneID
WHERE 
	OWNED_BY.PurchasedFrom IN (
		SELECT ID
		FROM
			CORPORATION 
				INNER JOIN OWNED_BY ON CORPORATION.ID = OWNED_BY.CorporationID
				INNER JOIN AIRPLANE ON OWNED_BY.PlaneID = AIRPLANE.RegNo
		WHERE 
			DATEDIFF(MONTH, PDate, GETDATE()) = 0 
			)
			AND AIRPLANE.Of_Type IN (
				SELECT
					Of_Type
				FROM 
					CORPORATION
						INNER JOIN OWNED_BY ON CORPORATION.ID = OWNED_BY.CorporationID
						INNER JOIN AIRPLANE ON OWNED_BY.PlaneID = AIRPLANE.RegNo
				WHERE 
					DATEDIFF(MONTH, PDate, GETDATE()) = 0 
			)
