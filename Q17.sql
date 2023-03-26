USE AIRPORT;

/*Q19 ) Write a Query to find the total number of planes stored in each hangar.*/


SELECT
	Stored_In AS Hangar_Number,
	COUNT(*) AS Planes_Stored
FROM
	AIRPLANE
GROUP BY
	AIRPLANE.Stored_In