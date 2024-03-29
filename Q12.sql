-- Question#012 - Query 10
USE AMG;

SELECT PT.MODEL, AVG(S.HOURS) AS 'HOURS WORKED'
FROM AIRPLANE A
JOIN PLANE_TYPE AS PT ON A.MODEL = PT.MODEL
JOIN PLANE_SERVICE AS PS ON A.REG_NO = PS.PREG_NO
JOIN SERVICE AS S ON S.S_DATE = PS.SER_DATE AND S.WORK_CODE = PS.SER_CODE
GROUP BY PT.MODEL, PT.MODEL;