USE AIRPORT;

/*Q10 ) Write a SQL query to find the location and capacity of the hangar with the most
	   available space.*/


SELECT
	Number, Location, Capacity 
FROM 
	HANGAR INNER JOIN AIRPLANE 
	ON HANGAR.Number = AIRPLANE.Stored_In
GROUP BY
	HANGAR.Number, HANGAR.Capacity, HANGAR.Location
HAVING
	Capacity - COUNT(*) = (
		SELECT TOP(1)
			Capacity - COUNT(*) AS AvailableSpace
		FROM 
			HANGAR INNER JOIN AIRPLANE
			ON AIRPLANE.Stored_In = HANGAR.Number
		GROUP BY 
			HANGAR.Number, HANGAR.Capacity
		ORDER BY
		AvailableSpace DESC
	)