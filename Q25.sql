USE AIRPORT;

/*Q25.b ) Write a SQL query to find the location, capacity and Available Space
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
	Can be used to determine which hangars are least used
	relative to how much Capacity they have*/
