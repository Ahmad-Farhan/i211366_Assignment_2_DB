USE AIRPORT;

/*Q20 ) Write a Query to find the total number of planes of each plane type.*/


SELECT
	Of_Type AS Plane_type,
	COUNT(*) AS Total_Planes
FROM 
	AIRPLANE 
GROUP BY 
	AIRPLANE.Of_Type