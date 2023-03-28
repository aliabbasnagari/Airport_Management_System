-- Question#23 - Query 21
USE AMG;

select owns.OWNER_ID, count(*) as 'Number of planes owned'
from OWNS
join OWNER on owns.OWNER_ID = owner.OWNERID
group by owns.OWNER_ID	