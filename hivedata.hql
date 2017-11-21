#------------------------------------------------CREATE THE SCHEMA---------------------------------------
CREATE TABLE elevator (dat String, day String,time String,floor1 int,floor2 int,floor3 int,floor4 int,floor5 int) ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t' LINES TERMINATED BY '\n'

#----------------------------------------------LOAD-----------------------------------------------------------
LOAD DATA INPATH '/home/diwakar/asda.txt' INTO TABLE elevator;

#---------------------------------------------CHECKING THE HIGHESET PRIORITY-----------------------------------
select day="Monday",dat, greatest(floor1,floor2,floor3,floor4,floor5) as greatest_value from elevator;

#--------------------------------------------COUNTING-----------------------------------------------------------

SELECT day,count(*) FROM elevator GROUP BY day;

#------------------------------------------DEFINING THE DAYS COUNT-------------------------------

SELECT CASE greatest(floor1,floor2,floor3, floor4,floor5)
          WHEN floor1      THEN 'floor1'
          WHEN floor2     THEN 'floor2'
          WHEN floor3    THEN 'floor3'
          WHEN floor4      THEN 'floor4'
          WHEN floor5  THEN 'floor5'
       END AS city,day,time
FROM   elevator;


#----------------------------------------INSERTING THE VALUES TO THE HDFS SYSTEM-------------------------

INSERT OVERWRITE DIRECTORY '/kone/temp.txt' 
ROW FORMAT DELIMITED 
FIELDS TERMINATED BY '\t' 
 SELECT CASE greatest(floor1,floor2,floor3, floor4,floor5)
          WHEN floor1      THEN 'floor1'
          WHEN floor2     THEN 'floor2'
          WHEN floor3    THEN 'floor3'
          WHEN floor4      THEN 'floor4'
          WHEN floor5  THEN 'floor5'
       END AS city,day,time
FROM   elevator;




#--------------------------------------------------RESULT ANALYSIS---------------------------------------

#1)

CREATE TABLE result1 (floor String, day String,time String,) ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t' LINES TERMINATED BY '\n';

#2) ----->

LOAD DATA LOCAL INPATH '/home/diwakar/Desktop/Kone/result1' INTO TABLE result1;




# ---------------------------------------------FOR THE SPECIFIC DATA-----------------------------------------
1)
select * from result1 where(day="Monday" and time="0:0");

2)
SELECT COUNT( * ) FROM floor HAVING (day="Monday" and time="0:0");

3)
SELECT COUNT(DISTINCT floor) AS NumberOfCustomers FROM result1;

4)
SELECT COUNT(DISTINCT floor) AS NumberOfCustomers FROM result1  where(day="Monday" and time="0:0");



INSERT OVERWRITE DIRECTORY '/kone/fr11.txt' 
ROW FORMAT DELIMITED 
FIELDS TERMINATED BY '\t' select * FROM   result1 where (day="Monday" and time="11:0");


------------------------------------------------ANALYSIS FOR THE DAY--------------------------------------------------------
CREATE TABLE fr8 (floor String, day String,time String) ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t' LINES TERMINATED BY '\n'



LOAD DATA INPATH '/home/diwakar/Downloads/fr9' INTO TABLE fr9;
