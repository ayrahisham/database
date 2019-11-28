SPOOL C:\Nur_Suhaira_5841549_A2\solution6Output;

/* ==============================================
Student Name: Nur Suhaira
Student Number: 5841549
Description: Assignment 2 Task 6
Date written: 10th May 2018
================================================

======================Qn 6=====================*/

-- Lists the names and the sizes (in KBytes) of the data objects 
-- (relational tables, indexes, etc) created and owned by you. 
-- The script should produce the following output.  
-- Object Names         Size in KB 	
--------------------------- ---------------- 
-- ALLMAC          		64 
-- SERVES          		64 
-- ...
 
SELECT SEGMENT_NAME AS OBJECT_NAMES,  SUM(BLOCKS * 8 *1024) AS SIZE_IN_KB
FROM USER_SEGMENTS
GROUP BY SEGMENT_NAME;

SPOOL OFF;

--================END OF Qn 6==================