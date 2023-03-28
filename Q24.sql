-- Question#24 - Query 22
USE AMG;

select PERSON.SSN, person.NAME, count(*) as 'Number of Planes authorized to fly'
from PILOT
join PERSON on pilot.ssn = person.ssn									--to get names of pilot
join FLIES on FLIES.SSN = PILOT.SSN										--to get the number of planes auhtorized to fly
group by person.ssn, person.NAME