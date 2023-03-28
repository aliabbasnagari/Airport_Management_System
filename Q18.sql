-- Question#18 - Query 16
USE AMG;

SELECT CR.NAME, CR.ADDRESS
FROM OWNER OW
JOIN CORPORATION CR ON CR.OWNERID = OW.OWNERID
JOIN OWNS O ON O.OWNER_ID = CR.OWNERID
JOIN AIRPLANE A ON A.REG_NO = O.REG_NO
WHERE MONTH(GETDATE()) = MONTH(O.P_DATE) AND YEAR(GETDATE()) = YEAR(O.P_DATE) AND A.MODEL IN (
	SELECT A.MODEL
	FROM OWNER OW
	JOIN CORPORATION CR ON CR.OWNERID = OW.OWNERID
	JOIN OWNS O ON O.OWNER_ID = CR.OWNERID
	JOIN AIRPLANE A ON A.REG_NO = O.REG_NO
	WHERE O.P_DATE BETWEEN DATEADD(MONTH, -1, GETDATE()) AND DATEADD(DAY, -1, GETDATE())
);