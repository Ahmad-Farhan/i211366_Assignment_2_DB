USE AIRPORT;

/*Q11 ) Write a SQL query to find the number of planes owned by each corporation, sorted
	    in descending order by number of planes.*/


SELECT 
	Name,
	COUNT(*) Planes_Owned 
FROM 
	OWNED_BY INNER JOIN CORPORATION 
	ON CORPORATION.ID = OWNED_BY.CorporationID
GROUP BY
	OWNED_BY.CorporationID,
	Name 
ORDER BY 
	Planes_Owned DESC