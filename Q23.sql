USE AIRPORT;

/*Q25.a ) Write a SQL query to find the location, capacity and Available Space
		of each hangar sorted by the available space in descending order.*/


SELECT 
	Location,
	Capacity,
	Capacity - COUNT(*) AS AvailableSpace
FROM
	HANGAR INNER JOIN AIRPLANE
	ON AIRPLANE.Stored_In = HANGAR.Number
GROUP BY 
	HANGAR.Number,
	Location,
	Capacity 
ORDER BY 
	AvailableSpace DESC

/*Importance: 
	Can be used to Figure out which Hangar is being used the least
	relative to its capacity so that less frequently used/most often have available 
	space may be utilised more often*/
