-- Question#06 - Query 4
USE AMG;

SELECT TOP 5 P.*, S.HOURS AS 'HOURS WORKED'
FROM PERSON AS P
JOIN EMPLOYEE AS EMP ON P.SSN = EMP.SSN
JOIN MAINTAIN AS M ON EMP.SSN = M.E_SSN
JOIN SERVICE AS S ON S.S_DATE = M.SER_DATE AND S.WORK_CODE = M.SER_CODE
ORDER BY S.HOURS DESC;