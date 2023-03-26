USE AIRPORT;

/*Q21 ) Write a Query to find the total number of services performed on each plane.*/


SELECT
	Plane_Id,
	COUNT(*) AS Services_Performed
FROM 
	SERVICE
WHERE
	SERVICE.Status IN ('C', 'U')
GROUP BY
	SERVICE.Plane_Id
