# i211366_Assignment_2_DB

ERD Explaination
-------------------------


Solutions Explaination

Q1 ) Write a SQL query to find the registration numbers of airplanes that have
    never undergone maintenance. 

Solution Result:
-----------------
  ![Q1_Result] (https://github.com/Ahmad-Farhan/i211366_Assignment_2_DB/Images/blob/main/Images/Q1_Result.png?raw=true)
  
Query Method Used:
------------------
Tables AIRPLANE AND SERVICE are left joined on RegNo of Plane,
So those planes which have never undergone service are Planes that:
i) Have no Service Record and so SERVICE.attributes are null when left joined
ii) Have No Service Records with Status Completed or Undergoing


#----------------------------------------------------------------------------#


Q2 ) Write a SQL query to find the names and addresses of corporations
	   that own airplanes with a capacity greater than 200.

Solution Result:
-----------------
  ![Q2_Result] (https://github.com/Ahmad-Farhan/i211366_Assignment_2_DB/Images/blob/main/Images/Q2_Result.png?raw=true)
  
Query Method Used:
------------------
Tables AIRPLANE AND CORPORATION are INNER JOINED with OWNED_BY
Results in a table containing all airplane attributes next to 
the corporation attribute of the corporations that own those planes 
Required result is:
i) Plane.Of_Type that is present in sub query which returns the Model
  all plane types with Capacity greater than 200)
   
   
#----------------------------------------------------------------------------#


Q3 ) Write a SQL query to find the average salary
	   of employees who work the night shift.

Solution Result:
-----------------
  ![Q3_Result] (https://github.com/Ahmad-Farhan/i211366_Assignment_2_DB/Images/blob/main/Images/Q3_Result.png?raw=true)
  
Query Method Used:
------------------
Aggregate Function "AVG" is used to find Average of 
Salaries corresponding to EMPLOYEE.EShift = 'Night'


#----------------------------------------------------------------------------#


Q4 ) Write a SQL query to find the top 5 employees with the highest total 
	   number of maintenance hours worked.


Solution Result:
-----------------
  ![Q4_Result] (https://github.com/Ahmad-Farhan/i211366_Assignment_2_DB/Images/blob/main/Images/Q4_Result.png?raw=true)
  
Query Method Used:
------------------
TOP(5) Function along with aggregate function SUM(SERVICE.Hours)
is used on the INNER JOIN of MAINTAIN and SERVICE Tables.
Along with Group By function on Employees SSN of MAINTAIN Table
Sorted by Total Hours Worked by each employee in descending order.
Group by groups all SERVICE entries with same SSN, their respective
SHours are all added by SUM(SHours)


#----------------------------------------------------------------------------#


Q5 ) Write a SQL query to find the names and registration numbers of airplanes
	   that have undergone maintenance in the past week.


Solution Result:
-----------------
  ![Q5_Result] (https://github.com/Ahmad-Farhan/i211366_Assignment_2_DB/Images/blob/main/Images/Q5_Result.png?raw=true)
  
Query Method Used:
------------------
TOP(5) Function along with aggregate function SUM(SERVICE.Hours)
is used on the INNER JOIN of MAINTAIN and SERVICE Tables.
Along with Group By function on Employees SSN of MAINTAIN Table
Sorted by Total Hours Worked by each employee in descending order.
Group by groups all SERVICE entries with same SSN, their respective
SHours are all added by SUM(SHours)



  

