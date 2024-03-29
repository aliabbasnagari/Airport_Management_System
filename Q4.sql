-- Question#04 - Query 2
USE AMG;

SELECT C.NAME, C.ADDRESS, P.CAPACITY
FROM CORPORATION C
JOIN OWNS O ON C.OWNERID = O.OWNER_ID
JOIN AIRPLANE A ON O.REG_NO = A.REG_NO
JOIN PLANE_TYPE P ON A.MODEL = P.MODEL
WHERE P.CAPACITY >= 200;