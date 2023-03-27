USE AIRPORT;

/*Q25.c ) Write a SQL query to find the average capacity of planes weighing more than 100000kg*/


SELECT 
	AVG(Capacity) AS AvgCapacity
FROM 
	AIRPLANE INNER JOIN PLANE_TYPE 
	ON AIRPLANE.Of_Type = PLANE_TYPE.Model
WHERE 
	PLANE_TYPE.Weight > 100000



/*Importance: 
	Can be used to catagorise which planes have better weight to capacity Ratio*/
