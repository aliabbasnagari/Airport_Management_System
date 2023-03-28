-- Question#25 - Queries
USE AMG;

-- printing the planes that had a specific type of service done on them (for aircrash inverstigations)
select plane_service.SER_CODE,plane_service.SER_DATE,airplane.MODEL,airplane.REG_NO 
from PLANE_SERVICE,airplane
where (PLANE_SERVICE.SER_CODE = 'Tire Replacement-1127-1' OR PLANE_SERVICE.SER_CODE = 'Propeller Balancing-1125-9') and plane_service.PREG_NO=airplane.REG_NO


-- printing the employee who worked on the specific serviced plane
select plane_service.SER_CODE,airplane.MODEL,airplane.REG_NO ,works_on.SSN,person.NAME
from PLANE_SERVICE,airplane,works_on,person
where (( (PLANE_SERVICE.SER_CODE = 'Tire Replacement-1127-1' OR PLANE_SERVICE.SER_CODE = 'Propeller Balancing-1125-9') and  plane_service.PREG_NO=airplane.REG_NO ) and works_on.model=airplane.model) and works_on.SSN=person.SSN;

-- Find TOP 5 EMPLOYEE WITH MAXIMUM QUALIFICATIONS
SELECT TOP 5 P.NAME, COUNT(*) AS 'NUMBER OF QUALIFICATIONS'
FROM EMP_QUALIFICATION EQ
JOIN EMPLOYEE EMP ON EMP.SSN = EQ.SSN
JOIN PERSON P ON P.SSN = EMP.SSN
GROUP BY P.SSN, P.NAME
ORDER BY COUNT(*) DESC;

-- Find NUMBER OF QUALIFIED EMPLOYEES FOR EACH TYPE OF PLANE
SELECT PT.MODEL, COUNT(*) AS 'NUMBER OF EMPLOYEES'
FROM WORKS_ON WO
JOIN PLANE_TYPE PT ON PT.MODEL = WO.MODEL
GROUP BY PT.MODEL
ORDER BY COUNT(*) DESC;
