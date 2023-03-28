-- Question#17 - Query 15
USE AMG;

SELECT A.REG_NO, A.MODEL
FROM OWNER AS OW
LEFT JOIN CORPORATION C ON C.OWNERID = OW.OWNERID 
LEFT JOIN PERSON P ON P.SSN = OW.OWNERID
LEFT JOIN OWNS O ON C.OWNERID = O.OWNER_ID OR P.SSN = O.OWNER_ID
JOIN AIRPLANE A ON O.REG_NO = A.REG_NO
WHERE A.REG_NO IN (
	SELECT PS.PREG_NO
	FROM PLANE_SERVICE PS
	JOIN MAINTAIN M ON M.SER_DATE = PS.SER_DATE AND M.SER_CODE = PS.SER_CODE
	JOIN EMPLOYEE E ON E.SSN = M.E_SSN
	WHERE E.SHIFT LIKE '%DAY%'
) OR C.NAME IS NULL;