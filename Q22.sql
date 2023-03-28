-- Question#22 - Query 20
USE AMG;

select avg(EMPLOYEE.SALARY) as Average_Salary, SHIFT 
from EMPLOYEE
group by EMPLOYEE.SHIFT;