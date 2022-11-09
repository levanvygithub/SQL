USE MASTER;
DROP DATABASE IF EXISTS HELLO_500AE; 
CREATE DATABASE HELLO_500AE;
USE HELLO_500AE;
CREATE TABLE BreakTheLimit( Data char(1000) NOT NULL,
 )
INSERT INTO BreakTheLimit(Data)
VALUES ('Record1');
INSERT INTO BreakTheLimit(Data)
VALUES ('Record2');
INSERT INTO BreakTheLimit(Data)
VALUES ('Record3');
INSERT INTO BreakTheLimit(Data)
VALUES ('Record4');
INSERT INTO BreakTheLimit(Data)
VALUES ('Record5');
INSERT INTO BreakTheLimit(Data)
VALUES ('Record6');
INSERT INTO BreakTheLimit(Data)
VALUES ('Record7');
INSERT INTO BreakTheLimit(Data)
VALUES ('Record8');
INSERT INTO BreakTheLimit(Data)
VALUES ('Record9');
INSERT INTO BreakTheLimit(Data)
VALUES ('Record10');
INSERT INTO BreakTheLimit(Data)
VALUES ('Record11');
INSERT INTO BreakTheLimit(Data)
VALUES ('Record12');
INSERT INTO BreakTheLimit(Data)
VALUES ('Record13');
INSERT INTO BreakTheLimit(Data)
VALUES ('Record14');
INSERT INTO BreakTheLimit(Data)
VALUES ('Record15');
INSERT INTO BreakTheLimit(Data)
VALUES ('Record16');
INSERT INTO BreakTheLimit(Data)
VALUES ('Record17');
 select *from BreakTheLimit;

 DBCC IND('HELLO_500AE',BreakTheLimit,-1) --see the information like
 --pageID, IAMFID... 14 pages type, just focus on 2 page

 --IAMFID,IAMPID -->File ID&Page ID -> IAM mapping

 DBCC TRACEON(3604)
 DBCC PAGE('HELLO_500AE',1,345,1) --(databsename, IAMFID,pageID,detailwanttosee(1,3..))

 CREATE DATABASE HELLO_500AE1;
USE HELLO_500AE1;
CREATE TABLE BreakTheLimit1( Data char(9000) NOT NULL, ----Will be fault
 )

 --we have solution

 DECLARE @Example AS table
(
    LongColumn varchar(max) NULL
);

CREATE TABLE Example( Data varchar(max) NOT NULL,
 )
 INSERT INTO Example(Data)
VALUES
    (REPLICATE(CONVERT(varchar(max), 'y'), 9000000)); --repeat 9mils times of y letter, before that convert to varchar(max).

SELECT *FROM Example

DBCC IND('HELLO_500AE1',Example,-1) --see the information like

DBCC TRACEON(3604)
DBCC PAGE('HELLO_500AE1',1,364,1)


