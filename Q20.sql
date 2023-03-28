-- Question#20 - Query 18
USE AMG;

select count(airplane.REG_NO) as Number_of_Planes, AIRPLANE.MODEL
from AIRPLANE, PLANE_TYPE
where AIRPLANE.MODEL = PLANE_TYPE.MODEL
group by AIRPLANE.MODEL;