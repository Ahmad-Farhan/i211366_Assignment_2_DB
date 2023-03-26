USE AIRPORT;

/*Q17 ) Write a SQL query to find the names and registration numbers of 
	    airplanes that have never been owned by a corporation or undergone
	    maintenance work from an employee who works the day shift.*/


SELECT
	RegNo,
	Of_Type
FROM
	SERVICE
		INNER JOIN AIRPLANE ON AIRPLANE.RegNo = SERVICE.Plane_Id
		INNER JOIN MAINTAIN ON MAINTAIN.Service_Id = SERVICE.ID
		INNER JOIN EMPLOYEE ON EMPLOYEE.PSSN = MAINTAIN.SSN
WHERE 
	EMPLOYEE.EShift IN ('Day') AND
	SERVICE.Status IN ('C', 'U') 
UNION
SELECT
	RegNo,
	Of_Type
FROM
	OWNED_BY 
	INNER JOIN AIRPLANE ON OWNED_BY.PlaneID = AIRPLANE.RegNo
	INNER JOIN CORPORATION ON CORPORATION.ID = OWNED_BY.PurchasedFrom
WHERE 
	OWNED_BY.CorporationID IS NULL AND
	OWNED_BY.PurchasedFrom NOT IN (CORPORATION.ID)
