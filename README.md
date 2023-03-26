ERD Explaination
-----------------------------


![ERD] (https://github.com/Ahmad-Farhan/i211366_Assignment_2_DB/blob/main/ERD.png?raw=true)



Entities:

#------------------#

Airplane: It represents a single airplane. It has attributes (Reg#) which is its primary key, plane Type and     hangar it is stored in.

Plane_Type: Represents a specific airplane type for example Boeing 747. It has attributes (model#) as primary key, weight of the plane and its capacity.

Hangar: Represents a physical hangar in the airport, where planes are stored. It has attributes (Number) as primary key, capacity of the hangar and its location.

Owner: Represents the owner of an airplane. 
This entity is a superclass with two subclasses: Person  and Corporation. 
Person has attributes such (social security number) as primary key, Name, address and Phone number. 
Corporation has attributes (ID) as primary key, Name, address and Phone Number.

Employee: Represents an airport employee who maintains airplanes. It is a subclass of Person, with specific attributes such as salary and shift.

Pilot: Represents a licensed pilot who is authorized to fly certain types of airplanes. It is also subclass of Person, with specific attributes such as License number and Restrictions.

Service: Represents a specific service record for an airplane, with attributes such as maintenance date, hours spent on the work and type of work done. It is a weak entity because it cannot exist without being associated with an AIRPLANE or an EMPLOYEE entity via the PLANE_SERVICE or MAINTAIN relationships, respectively. The double rectangle symbol on the SERVICE entity box indicates that it is a weak entity.


 Relationships:
 
 #------------------#
 
Owns: Relates and Airplane to an owner, indicating which owner owns which airplane, and includes the purchase date attribute. Since one owner can have many airplanes it is a one to many relationship.

Maintains: Relates an Employee to a Service record, indicating which employee maintains which airplane and when. This is a many to many relationship as one employee can maintain many airplanes and one airplane can be maintained by many employees.

Plane_Service: Relates an Airplane to one or more Service records, indicating which services have been performed on which airplane. This is a many to many relationship, as an airplane may have multiple service records, and a service record may apply to multiple airplanes.

Of_Type: Relates an Airplane to a Plane_Type, indicating the type of airplane. It is a one to many relationship as one plane can only be of one type but there could be many airplanes of one type.

Stored_in: Relates an airplane to a Hangar, indicating which hangar the airplane is stored in. This is one to many relationship as one Hangar can store many airplanes but one airplane cannot be in many hangars at once.


Total Participation:

#----------------------#

An AIRPLANE must be associated with a PLANE_TYPE via the OF_TYPE relationship. In other words, each airplane must have a type. This is denoted by the "1" and "1..*" symbols on the OF_TYPE relationship line. 

An AIRPLANE can have zero or more SERVICE records, and each SERVICE record must be associated with at least one airplane. This is denoted by the "0..*" and "1" symbols on the PLANE_SERVICE relationship line.

An EMPLOYEE can have zero or more SERVICE records via the MAINTAIN relationship, and each SERVICE record must be associated with at least one employee. This is denoted by the "0..*" and "1" symbols on the MAINTAIN relationship line.

An OWNER can own zero or more Airplane's via the OWNS relationship, and each AIRPLANE must be owned by at least one owner. This is denoted by the "0..*" and "1" symbols on the OWNS relationship line.

A PILOT or EMPLOYEE must be a PERSON, and each PERSON entity must be either a PILOT or EMPLOYEE. This is denoted by the circle and arrow symbols on the PILOT and EMPLOYEE entity boxes, pointing to the PERSON entity box.



----------------------------------------------------------------------------




Solutions Explaination
-----------------------------

Q1 ) Write a SQL query to find the registration numbers of airplanes that have never undergone maintenance.
-------------------------------------------------------------------------

Solution Result:

#---------------------#

![Q1_Result] (https://github.com/Ahmad-Farhan/i211366_Assignment_2_DB/blob/main/Images/Q1.png?raw=true)


Query Method Used:

#---------------------#

Tables AIRPLANE AND SERVICE are left joined on RegNo of Plane, So those planes which have never undergone service are Planes that: i) Have no Service Record and so SERVICE.attributes are null when left joined ii) Have No Service Records with Status Completed or Undergoing



----------------------------------------------------------------------------



Q2 ) Write a SQL query to find the names and addresses of corporations that own airplanes with a capacity greater than 200.
-------------------------------------------------------------------------

Solution Result:

#---------------------#

![Q2_Result] (https://github.com/Ahmad-Farhan/i211366_Assignment_2_DB/blob/main/Images/Q2.png?raw=true)


Query Method Used:

#---------------------#

Tables AIRPLANE AND CORPORATION are INNER JOINED with OWNED_BY Results in a table containing all airplane attributes next to the corporation attribute of the corporations that own those planes Required result is: i) Plane.Of_Type that is present in sub query which returns the Model all plane types with Capacity greater than 200)



----------------------------------------------------------------------------



Q3 ) Write a SQL query to find the average salary of employees who work the night shift.
-------------------------------------------------------------------------

Solution Result:

#---------------------#

![Q3_Result] (https://github.com/Ahmad-Farhan/i211366_Assignment_2_DB/blob/main/Images/Q3.png?raw=true)


Query Method Used:

#---------------------#

Aggregate Function "AVG" is used to find Average of Salaries corresponding to EMPLOYEE.EShift = 'Night'



----------------------------------------------------------------------------



Q4 ) Write a SQL query to find the top 5 employees with the highest total number of maintenance hours worked.
-------------------------------------------------------------------------

Solution Result:

#---------------------#

![Q4_Result] (https://github.com/Ahmad-Farhan/i211366_Assignment_2_DB/blob/main/Images/Q4.png?raw=true)


Query Method Used:

#---------------------#

TOP(5) Function along with aggregate function SUM(SERVICE.Hours) is used on the INNER JOIN of MAINTAIN and SERVICE Tables. Along with Group By function on Employees SSN of MAINTAIN Table Sorted by Total Hours Worked by each employee in descending order. Group by groups all SERVICE entries with same SSN, their respective SHours are all added by SUM(SHours)



----------------------------------------------------------------------------



Q5 ) Write a SQL query to find the names and registration numbers of airplanes that have undergone maintenance in the past week.
-------------------------------------------------------------------------

Solution Result:

#---------------------#

![Q5_Result] (https://github.com/Ahmad-Farhan/i211366_Assignment_2_DB/blob/main/Images/Q5.png?raw=true)


Query Method Used:

#---------------------#

TOP(5) Function along with aggregate function SUM(SERVICE.Hours) is used on the INNER JOIN of MAINTAIN and SERVICE Tables. Along with Group By function on Employees SSN of MAINTAIN Table Sorted by Total Hours Worked by each employee in descending order. Group by groups all SERVICE entries with same SSN, their respective SHours are all added by SUM(SHours)



----------------------------------------------------------------------------



Q6 ) Write a SQL query to find the names and phone numbers of all owners who have purchased a plane in the past month.
-------------------------------------------------------------------------

Solution Result:

#---------------------#

![Q6_Result] (https://github.com/Ahmad-Farhan/i211366_Assignment_2_DB/blob/main/Images/Q6.png?raw=true)


Query Method Used:

#---------------------#

The desired result is achieved by the UNION of 2 queries:
i) OWNED_BY and PERSON Tables are Inner joined and DATEDIFF
Function is used to find the difference between Purchase Date
and Current Date.
ii) OWNED_BY and CORPORATION Tables are Inner joined and 
DATEDIFF Function is used to find the difference
between Purchase Date and Current Date



----------------------------------------------------------------------------



Q7 ) Write a SQL query to find the number of airplanes each pilot is authorized to fly.
-------------------------------------------------------------------------

Solution Result:

#---------------------#

![Q7_Result] (https://github.com/Ahmad-Farhan/i211366_Assignment_2_DB/blob/main/Images/Q7.png?raw=true)


Query Method Used:

#---------------------#

The FLIES Table is INNER JOINED with PILOT and PERSON Tables.
GROUP BY along with the aggregate function COUNT() is used to count
the number of different FLIES tuples for a single Pilot SSN to
obtain the number of plane_types each pilot is authorized to fly.


----------------------------------------------------------------------------


Q8 ) Write a SQL query to find the location and capacity of the hangar with the most available space.
-------------------------------------------------------------------------

Solution Result:

#---------------------#

![Q8_Result] (https://github.com/Ahmad-Farhan/i211366_Assignment_2_DB/blob/main/Images/Q8.png?raw=true)


Query Method Used:

#---------------------#

This query is solved by Inner joining AIRPLANE and HANGAR Tables
and grouping by HANGAR.Number using the "HAVING" keyword in
combinatoin with a subquery that returns a table of availablespace 
in each HANGAR, sorted in descending order. The desired result is 
all those HANGARS with Capacity - Planes_Stored = to the top(1)
available space.



----------------------------------------------------------------------------



Q9 ) Write a SQL query to find the number of planes owned by each corporation, sorted in descending order by number of planes.
-------------------------------------------------------------------------

Solution Result:

#---------------------#

![Q9_Result] (https://github.com/Ahmad-Farhan/i211366_Assignment_2_DB/blob/main/Images/Q9.png?raw=true)


Query Method Used:

#---------------------#

OWNED_BY and CORPORATION Tbales are inner joined and grouped by CorporationID.
This gives a table where each Plane_Id is related to its owner corporation.
The occurances of each corporationID are counted and sorted in descending order.



----------------------------------------------------------------------------



Q10 ) Write a SQL query to find the average number of maintenance hours per plane,  broken down by plane type.
-------------------------------------------------------------------------

Solution Result:

#---------------------#

![Q10_Result] (https://github.com/Ahmad-Farhan/i211366_Assignment_2_DB/blob/main/Images/Q10.png?raw=true)


Query Method Used:

#---------------------#

AIRPLANE is inner joined with PLANE_TYPE and SERVICE Tables grouped by 
PLANE_TYPE.Model. Using the function AVG(SHours) the average of service
hours of each plane model is drawn.



----------------------------------------------------------------------------



Q11 ) Write a SQL query to find the names of owners who have purchased a plane that requires maintenance work from an employee who is not qualified to work on that type of plane.
-------------------------------------------------------------------------

Solution Result:

#---------------------#

![Q11_Result] (https://github.com/Ahmad-Farhan/i211366_Assignment_2_DB/blob/main/Images/Q11.png?raw=true)


Query Method Used:

#---------------------#

This query has been achieved using the combination of 3 queries with 2 being 
subqueries.
i) The inner most sub query provides the Employee SSN of the employees
based on the types of plane they work on. 
ii) These employees are then used to extract the Plane_Id of SERVICEs
using MAINTAIN table whose status is 'Scheduled'.
iii) These plane types are used to get the person entries that own planes of these types.



----------------------------------------------------------------------------



Q12 ) Write a SQL query to find the names and phone numbers of owners who have purchased a plane from a corporation that has a hangar in the same location as the owner.
-------------------------------------------------------------------------

Solution Result:

#---------------------#

![Q12_Result] (https://github.com/Ahmad-Farhan/i211366_Assignment_2_DB/blob/main/Images/Q12.png?raw=true)


Query Method Used:

#---------------------#

This query has been achieved using the combination of 2 queries
i) Inner Query returns the locations of hangars owned by corporations
ii) The outer query checks whether the person owner's location is 
the same as the corporation's location from who the plane was bought



----------------------------------------------------------------------------



Q13 ) Write a SQL query to find the names of pilots who are qualified to fly a plane that is currently undergoing maintenance.
-------------------------------------------------------------------------

Solution Result:

#---------------------#

![Q13_Result] (https://github.com/Ahmad-Farhan/i211366_Assignment_2_DB/blob/main/Images/Q13.png?raw=true)


Query Method Used:

#---------------------#

This query has been achieved using the combination of 2 queries
i) Inner Query returns the plane types of the planes that have an entry in
SERVICE Table where the Status is 'Undergoing'
ii) Outer query compares the plane types of the planes owned by PERSON
with the plane types returned by inner query



----------------------------------------------------------------------------



Q14 ) Write a SQL query to find the names of employees who have worked on planes owned by a particular corporation, sorted by the total number of maintenance hours worked.
-------------------------------------------------------------------------

Solution Result:

#---------------------#

![Q14_Result] (https://github.com/Ahmad-Farhan/i211366_Assignment_2_DB/blob/main/Images/Q14.png?raw=true)


Query Method Used:

#---------------------#

This query draws from two seperate inner joined tables:
i) MAINTAIN inner joined with SERVICE and PERSON
ii) OWNED_BY inner joined with CORPORATION
The hours each employee worked is summed using SUM() function 
and Corporation is filtered by a specific corporation Name.



----------------------------------------------------------------------------



Q15 ) Write a SQL query to find the names of employees who have worked on planes owned by a particular corporation, sorted by the total number of maintenance hours worked.
-------------------------------------------------------------------------

Solution Result:

#---------------------#

![Q15_Result] (https://github.com/Ahmad-Farhan/i211366_Assignment_2_DB/blob/main/Images/Q15.png?raw=true)


Query Method Used:

#---------------------#

Union of two seperate Queries is used
i) SERVICE Table is inner joined with AIRPLANE, MAINTAIN and EMPLOYEE
For a particular employee if there is a SERVICE entry in MAINTAIN table
and that SERVICE entry has the Status = 'Completed or Undergoing',
with that particular employee entry in EMPLOYEE table with Shift = 'Day'
then it satisfies the condition "undergone maintenance from and employee
who works the day shift"
ii) OWNED_BY Table is inner joined with CORPORATION and AIRPLANE
For a particular OWNED_BY entry if the corporationid is null and
the purchasedFrom has a value not present in CorporationID cols



----------------------------------------------------------------------------



Q16 ) Write a SQL query to find the names and addresses of owners who have purchased a plane from a corporation that has also purchased a plane of the same type in the past month.
-------------------------------------------------------------------------

Solution Result:

#---------------------#

![Q16_Result] (https://github.com/Ahmad-Farhan/i211366_Assignment_2_DB/blob/main/Images/Q16.png?raw=true)


Query Method Used:

#---------------------#

OWNER Name and Address are drawn from inner join of OWNED_BY with PERSON and AIRPLANE
i) OWNED_BY.PurchasedFrom is Compared with CorporsatonIDs of Corporations who have
purchased a plane in the past month
ii) AIRPLANE.PLANE_TYPE is compared with plane types of planes purchased in the past month
Plane Purchased in past month is found using DATEDIFF function with MONTH difference = 0.
If a plane plane purchased by person has both characteristics, then that is the result.



----------------------------------------------------------------------------



Q17 ) Write a Query to find the total number of planes stored in each hangar.
-------------------------------------------------------------------------

Solution Result:

#---------------------#

![Q17_Result] (https://github.com/Ahmad-Farhan/i211366_Assignment_2_DB/blob/main/Images/Q17.png?raw=true)


Query Method Used:

#---------------------#

Entries of AIRPLANE Table are grouped according to the hangar numbers of
AIRPLANE.StoredIn, then using aggregate function COUNT(*), the number of 
planes stored per Hangar are calculated



----------------------------------------------------------------------------



Q18 ) Write a Query to find the total number of planes of each plane type.
-------------------------------------------------------------------------

Solution Result:

#---------------------#

![Q18_Result] (https://github.com/Ahmad-Farhan/i211366_Assignment_2_DB/blob/main/Images/Q18.png?raw=true)


Query Method Used:

#---------------------#

Entries of AIRPLANE Table are grouped according to AIRPLANE.Of_Type, then using aggregate 
function COUNT(*), the number of planes of a particular plane type are calculated



----------------------------------------------------------------------------



Q19 ) Write a Query to find the total number of services performed on each plane.
---------------------------------------------------------------------------------

Solution Result:

#---------------------#

![Q19_Result] (https://github.com/Ahmad-Farhan/i211366_Assignment_2_DB/blob/main/Images/Q19.png?raw=true)


Query Method Used:

#---------------------#

Entries of SERVICE Table are grouped according to the SERVICE.Plane_Id,
then using aggregate function COUNT(*), the number of services on a particular
plane are are calculated. These results are filtered by SERVICES with status not = 'S'



----------------------------------------------------------------------------



Q20 ) Write a Query to find the average salary of employees in each shift.
---------------------------------------------------------------------------------

Solution Result:

#---------------------#

![Q20_Result] (https://github.com/Ahmad-Farhan/i211366_Assignment_2_DB/blob/main/Images/Q20.png?raw=true)


Query Method Used:

#---------------------#

Aggregate function AVG(Salary) along with group by (shift) is used on table 
EMPLOYEE to find avg salary of employees by shift



----------------------------------------------------------------------------



Q21 ) Write a Query to find the total number of planes each owner owns.
---------------------------------------------------------------------------------

Solution Result:

#---------------------#

![Q21_Result] (https://github.com/Ahmad-Farhan/i211366_Assignment_2_DB/blob/main/Images/Q21.png?raw=true)


Query Method Used:

#---------------------#

Query solved by taking union of two queries
i) Finds number of planes owned by a coporation
ii ) Finds number of planes owned by a Person
Both calculate the number using Aggregate function COUNT(*) and GROUP the entries
by CorporationID and PersonSSN respectively in OWNED_BY Table



----------------------------------------------------------------------------



Q22 ) Write a Query to find the number of planes each pilot is authorized to fly.
---------------------------------------------------------------------------------

Solution Result:

#---------------------#

![Q22_Result] (https://github.com/Ahmad-Farhan/i211366_Assignment_2_DB/blob/main/Images/Q22.png?raw=true)


Query Method Used:

#---------------------#

Aggregate Function COUNT(*) is used to find number of occurances of a pilot's SSN
in FLIES table. FLIES is inner joined with PERSON to get the Name of the Pilot 



----------------------------------------------------------------------------



Q23 ) Write a SQL query to find the location, capacity and Available Space of each hangar sorted by the available space in descending order.
---------------------------------------------------------------------------------

Solution Result:

#---------------------#

![Q23_Result] (https://github.com/Ahmad-Farhan/i211366_Assignment_2_DB/blob/main/Images/Q23.png?raw=true)


Query Method Used:

#---------------------#

Aggregate function COUNT(*) is used along with group by Stored_In attribute
of AIRPLANE table to determine number of planes stored per hangar.
Available space per hanger is found by subtracting this count from Capacity



----------------------------------------------------------------------------



Q24 ) Write a SQL query to find the Number of employees per shift
---------------------------------------------------------------------------------

Solution Result:

#---------------------#

![Q24_Result] (https://github.com/Ahmad-Farhan/i211366_Assignment_2_DB/blob/main/Images/Q24.png?raw=true)


Query Method Used:

#---------------------#

Aggregate function COUNT(*) is used along with group by EShift on EMPLOYEE
table to calculate occurances of employee entries with the same EShift values



----------------------------------------------------------------------------



Q25 ) Write a SQL query to find the average Capacity of Planes weighting more than 100000KG
---------------------------------------------------------------------------------

Solution Result:

#---------------------#

![Q25_Result] (https://github.com/Ahmad-Farhan/i211366_Assignment_2_DB/blob/main/Images/Q25.png?raw=true)


Query Method Used:

#---------------------#

AVG(Capacity) funciton is used after filtering PLANE_TYPE by PLANE_TYPE.Weight > 100000



----------------------------------------------------------------------------



Q26 ) Write a SQL query to find the Number of Plane types each employee is authorized to work on sorted by the total number
---------------------------------------------------------------------------------

Solution Result:

#---------------------#

![Q26_Result] (https://github.com/Ahmad-Farhan/i211366_Assignment_2_DB/blob/main/Images/Q26.png?raw=true)


Query Method Used:

#---------------------#

Aggregate function COUNT(*) is used along with group by WORKS_ON.Model calculate 
occurances of employee entries with the same in WORKS_ON table with different Models
