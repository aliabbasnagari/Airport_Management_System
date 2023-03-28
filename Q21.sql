-- Question#21 - Query 19
USE AMG;

select count(PLANE_SERVICE.PREG_NO) as SERVICE_COUNT, AIRPLANE.MODEL,AIRPLANE.REG_NO
from AIRPLANE,PLANE_SERVICE
where AIRPLANE.REG_NO = PLANE_SERVICE.PREG_NO
group by airplane.model,AIRPLANE.REG_NO;									
--Counting according models, AND also write reg_no as it is required as it has been written above. 