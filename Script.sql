/* Q1-  Find the total number of crimes recorded in the CRIME table*/
select count(*) from CRIME;

/* Q2-  Retrieve first 10 rows from the CRIME table*/
SELECT * FROM CRIME
LIMIT 10;

/* Q3- How many crimes involve an arrest*/
select count(*) from CRIME
where ARREST ="TRUE";

/* Problem 4: Which unique types of crimes have been recorded at a GAS STATION? */
SELECT distinct(PRIMARY_TYPE) from CRIME
where LOCATION_DESCRIPTION = 'GAS STATION';

/* Q5 - In the CENUS_DATA table list all Community Areas whose names start with the letter ‘B’.*/
Select * from CENSUS
where COMMUNITY_AREA_NAME like 'B%';

/* Problem 6: List the schools in Community Areas 10 to 15 that are healthy school certified */
select NAME_OF_SCHOOL from SCHOOL
where COMMUNITY_AREA_NUMBER between 10 and 15 AND HEALTHY_SCHOOL_CERTIFIED='Yes';

/* Problem 7: What is the average school Safety Score? */
SELECT AVG(SAFETY_SCORE)
FROM SCHOOL;

/* Problem 8: List the top 5 Community Areas by average College Enrollments [number of students] */
SELECT COMMUNITY_AREA_NAME, AVG(COLLEGE_ENROLLMENT) from SCHOOL
group by COMMUNITY_AREA_NAME, COLLEGE_ENROLLMENT
LIMIT 5;

/* Problem 9: Use a sub-query to determine which Community Area has the least value for Safety Score? */
select COMMUNITY_AREA_NAME from SCHOOL where SAFETY_SCORE= (select MIN(SAFETY_SCORE) FROM SCHOOL);

/* Problem 10: Find the Per Capita Income of the Community Area which has a school Safety Score of 1. */
SELECT CENSUS.PER_CAPITA_INCOME, CENSUS.COMMUNITY_AREA_NAME, SCHOOL.SAFETY_SCORE
FROM CENSUS
INNER JOIN SCHOOL ON CENSUS.COMMUNITY_AREA_NUMBER = SCHOOL.COMMUNITY_AREA_NUMBE
Where SCHOOL.SAFETY_SCORE =1;