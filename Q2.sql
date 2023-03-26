USE AIRPORT;

/*Q4 ) Write a SQL query to find the names and addresses of corporations
	   that own airplanes with a capacity greater than 200.*/


SELECT 
	Name, 
	Address
FROM 
	OWNED_BY 
		INNER JOIN CORPORATION ON CORPORATION.ID = OWNED_BY.CorporationID
		INNER JOIN AIRPLANE ON AIRPLANE.RegNo = OWNED_BY.PlaneID
WHERE 
	AIRPLANE.Of_Type IN (
		SELECT Model 
		FROM PLANE_TYPE 
		WHERE Capacity > 200
	)



/*		Alternate Solution
SELECT 
	Name, Address 
FROM  OWNED_BY
	INNER JOIN CORPORATION ON OWNED_BY.CorporationID = CORPORATION.ID
	INNER JOIN ( 
			AIRPLANE INNER JOIN PLANE_TYPE 
			ON AIRPLANE.Of_Type = PLANE_TYPE.Model
			) 
		ON OWNED_BY.PlaneID = AIRPLANE.RegNo
WHERE 
	PLANE_TYPE.Capacity > 200
*/
