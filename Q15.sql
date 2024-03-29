-- Question#15 - Query 13
USE AMG;

SELECT PR.NAME AS 'PILOT NAME', CONCAT(A.MODEL + '_' ,A.REG_NO) AS 'PLANE UNDER MAINTENANCE'
FROM PILOT AS PI
JOIN PERSON AS PR ON PI.SSN = PR.SSN
JOIN FLIES AS FL ON FL.SSN = PI.SSN
JOIN AIRPLANE A ON A.MODEL = FL.MODEL
JOIN PLANE_SERVICE PS ON PS.PREG_NO = A.REG_NO
JOIN SERVICE SER ON SER.S_DATE = PS.SER_DATE AND SER.WORK_CODE = PS.SER_CODE
WHERE SER.IS_COMPLETE = 0;