USE AIRPORT;

/*Q12 ) Write a SQL query to find the average number of maintenance hours per plane, 
        broken down by plane type.*/


SELECT 
	Model,
	AVG(SHours) AS AvgHours 
FROM 
	AIRPLANE
		INNER JOIN PLANE_TYPE ON PLANE_TYPE.Model = AIRPLANE.Of_Type
		INNER JOIN SERVICE ON SERVICE.Plane_Id = AIRPLANE.RegNo
GROUP BY 
	PLANE_TYPE.Model 
ORDER BY 
	AvgHours DESC