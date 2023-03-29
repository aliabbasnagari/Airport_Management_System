# Database Assignment 2
__by Adnan Hayat (21I-0578) and Ali Abbas (21I-2503)__  

### Entity-Relation Diagram Explanation:
+ __9 distinct entities__ were mapped on the Entity-Relation Diagram, which are evident in the photo attached in the repository.
- __6 distinct relations__ were mapped on the Entity-Relation Diagram between the entities.
+ __*Person*__ and __*Corporation*__ are __disjoints__ of the entity __*Owner*__
- __*Pilot*__ and __*Employee*__ are __Sub-classes__ of the entity __*Person*__
+ A __weak relation__ is mapped between the entities __*Service*__ and __*Airplane*__


 # Airport ERD
![Airport ERD](https://github.com/aliabbasnagari/i212503_Assignment_2_DB/blob/main/AIRPORT.png)

 # Airport Relational Diagram
![Airport ERD](https://github.com/aliabbasnagari/i212503_Assignment_2_DB/blob/main/AIRPORT%20Relational%20Diagram.png)

### Queries:
- Query 1:
  - To find the reg. no. of airplanes that had never gone under maintenance, we used _joins_ on _“Owns”_ and _“Airplane”_ to find them.
  ![QUERY](https://github.com/aliabbasnagari/i212503_Assignment_2_DB/blob/main/query_screenshots/q1.png)

- Query 2:
  - To tackle this query, we used _joins_ on _“Owns”__, __“Airplane”_ and _“Plane_type”_ to find the answer.
  ![QUERY](https://github.com/aliabbasnagari/i212503_Assignment_2_DB/blob/main/query_screenshots/q2.png)
  
- Query 3:
  - This was fairly a simple query, on which we used the _avg()_ function on the entity “Employee”.
  ![QUERY](https://github.com/aliabbasnagari/i212503_Assignment_2_DB/blob/main/query_screenshots/q3.png)
  
- Query 4:
  - We used _joins_ on _”Person”_ , _“Employee”_ and _“Maintain”_ to find the required information.
  ![QUERY](https://github.com/aliabbasnagari/i212503_Assignment_2_DB/blob/main/query_screenshots/q4.png)
  
- Query 5:
  - To find the reg. no. of airplanes that had undergone maintenance last week, we used joins on “Owns” and “Airplane” to find them.
  ![QUERY](https://github.com/aliabbasnagari/i212503_Assignment_2_DB/blob/main/query_screenshots/q5.png)
  
- Query 6:
  - We used _left joins_ on _”Person”_ and _”Corporation”_ to find the required information to the query.
  ![QUERY](https://github.com/aliabbasnagari/i212503_Assignment_2_DB/blob/main/query_screenshots/q6.png)
  
- Query 7:
  -  To get the answer to this query, we used _joins on _“Person”_ and __”Flies”__.
  ![QUERY](https://github.com/aliabbasnagari/i212503_Assignment_2_DB/blob/main/query_screenshots/q7.png)
  
- Query 8:
  - This was one of the most easiest queries, which we simply used the _TOP_ function on __“Hangar”__.
  ![QUERY](https://github.com/aliabbasnagari/i212503_Assignment_2_DB/blob/main/query_screenshots/q8.png)
  
- Query 9:
  - We used the _Desc_ function along with _joins_ on _“Owns”_ and _”Airplane”_ to answer this query.
  ![QUERY](https://github.com/aliabbasnagari/i212503_Assignment_2_DB/blob/main/query_screenshots/q9.png)
  
- Query 10:
  - We used the _Avg_ function along with _joins_ on _“Plane_Type”__, __“Service”_ and _”Plane_Service”_ to answer this query.
  ![QUERY](https://github.com/aliabbasnagari/i212503_Assignment_2_DB/blob/main/query_screenshots/q10.png)
  
- Query 11:
  - This was a long query, which was achieved by using multiple _Where_ clauses along with _joins_ on _“Corporations”__, __“Person”_ and __”Owns”__.
  ![QUERY](https://github.com/aliabbasnagari/i212503_Assignment_2_DB/blob/main/query_screenshots/q11.png)
  
- Query 12:
  - We used the _Where_ clause along with _joins_ on _“Hangar”_ , _”OWS”_ and multiple other entities. to answer this query.
  ![QUERY](https://github.com/aliabbasnagari/i212503_Assignment_2_DB/blob/main/query_screenshots/q12.png)
  
- Query 13:
  - This was a long query, which was achieved by using multiple _join_ clauses on _“Flies”__, __“Person”_ , _”Airplane”_ and multiple other entities.
  ![QUERY](https://github.com/aliabbasnagari/i212503_Assignment_2_DB/blob/main/query_screenshots/q13.png)
  
- Query 14:
  - This was a long query, which was achieved by using multiple _Join_ clauses on _“Airplane”__, __“Person”_ , _”Airplane_Service”_ and many other entities.
  ![QUERY](https://github.com/aliabbasnagari/i212503_Assignment_2_DB/blob/main/query_screenshots/q14.png)
  
- Query 15:
  - We used the _Where_ clause along with _joins_ on _“Corporations”_ , _”Person”_ and multiple other entities. to answer this query.
  ![QUERY](https://github.com/aliabbasnagari/i212503_Assignment_2_DB/blob/main/query_screenshots/q15.png)
  
- Query 16:
  - This was query was achieved by using multiple _Join_ clauses on _“Corporations”__, __“Owns”_ and __”Airplane”.
  ![QUERY](https://github.com/aliabbasnagari/i212503_Assignment_2_DB/blob/main/query_screenshots/q16.png)
  
- Query 17:
  - This was a short query which was achieved by using a single _join_ on __“Hangar”__.
  ![QUERY](https://github.com/aliabbasnagari/i212503_Assignment_2_DB/blob/main/query_screenshots/q17.png)
  
- Query 18:
  - This was also a short query which was achieved by using a single _where_ on _“Airplane”_ and __”Plane_type”__.
  ![QUERY](https://github.com/aliabbasnagari/i212503_Assignment_2_DB/blob/main/query_screenshots/q18.png)
  
- Query 19:
  - This was also a short query which was achieved by using a single _where_ on _“Airplane”_ and __”Plane_service”__.
  ![QUERY](https://github.com/aliabbasnagari/i212503_Assignment_2_DB/blob/main/query_screenshots/q19.png)
  
- Query 20:
  - This was the shortest query which was achieved using the _avg_ function on __”Employee”__.
  ![QUERY](https://github.com/aliabbasnagari/i212503_Assignment_2_DB/blob/main/query_screenshots/q20.png)
  
- Query 21:
  - This was query was achieved by using a single _Join_ clause on  __“Owns”__.
  ![QUERY](https://github.com/aliabbasnagari/i212503_Assignment_2_DB/blob/main/query_screenshots/q21.png)
  
- Query 22:
  - We used the _group by_ clause along with _joins_ on _“Person”_  and  _”Flies”_ to answer this query.
  ![QUERY](https://github.com/aliabbasnagari/i212503_Assignment_2_DB/blob/main/query_screenshots/q22.png)
  
  
- Question 25: (4 additional queries)
  - PART 1:
    - This query helps us in _printing the planes that had a specific type of service done on them_ and _can be useful for aircrash inverstigations._
    ![QUERY](https://github.com/aliabbasnagari/i212503_Assignment_2_DB/blob/main/query_screenshots/q251.png)
  - PART 2:
    - This query helps us in _printing the employee who worked on the specific serviced plane_ and _can be useful for aircrash inverstigations._
    ![QUERY](https://github.com/aliabbasnagari/i212503_Assignment_2_DB/blob/main/query_screenshots/q252.png)
  - PART 3:
    - This query helps us in _Finding number of qualified employees_ and _can be useful for checking which employee has the most skills._ 
    ![QUERY](https://github.com/aliabbasnagari/i212503_Assignment_2_DB/blob/main/query_screenshots/q253.png)
  - PART 4:
    - This query helps us in _Finding number of qualified employees for each type of plane_ and _can be useful for checking which employee has the most skills._
    ![QUERY](https://github.com/aliabbasnagari/i212503_Assignment_2_DB/blob/main/query_screenshots/q254.png)
    
    
    
# END - THANKS 😊
