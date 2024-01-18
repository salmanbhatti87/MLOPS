/*
CREATE DATABASE
*/
/*CREATE DATABASE ARID*/

/*
USING DATABASE
*/
USE ARID


/*
CREATING BRANCH Table
*/
CREATE TABLE BRANCH(
branchNO VARCHAR(100) NOT NULL PRIMARY KEY,
street VARCHAR(100),
city VARCHAR(100),
postcode VARCHAR(100),
gender VARCHAR(100),
CHECK (gender='M' or gender='F')
);

/*CHECK (LEN(branchNo) <= 4)*/

/*
INSERT DATA INTO TABLE
*/
INSERT INTO BRANCH VALUES ('B005','22 DEER road','London','SW1 4EH' , 'M')
INSERT INTO BRANCH VALUES  ('B007','16 Argyll st','aberdeen','AB2 3SU' , 'F')
INSERT INTO BRANCH VALUES  ('B003','163 main st','Glasgow','G11 9QS' , 'M')
INSERT INTO BRANCH VALUES  ('B004','32 manse road','bristol','BS99 1NZ' , 'M')
INSERT INTO BRANCH VALUES  ('B002','56 clover dr','London','NW10 6EU' , 'F')
INSERT INTO BRANCH VALUES  ('B009','56 clover dr','London','NW10 6EU' , 'L')

/*
VIEW DATA IN BRANCH TABLE
*/
SELECT * FROM BRANCH


SELECT street,city FROM BRANCH

SELECT DISTINCT city FROM BRANCH



/*
CREATE STAFF TABLE 
*/
CREATE TABLE staff(
staffNO VARCHAR (6) not null PRIMARY KEY ,
f_name VARCHAR (100),
l_name VARCHAR (100),
position VARCHAR(100),
sex VARCHAR (10),
dob VARCHAR(100),
salary VARCHAR(100),
branchNO VARCHAR(4) FOREIGN KEY REFERENCES BRANCH (branchNO) NULL
);
/*
INSERT DATA INFO TABLE
*/
INSERT INTO  staff VALUES  ('SL21','ali','hamza','manager','M','01-oct-2003',30000,'B005');
INSERT INTO  staff VALUES  ('SG37','haziq','naeem','assistant','M','26-jun-2003',12000,'B003' )
INSERT INTO  staff VALUES  ('SG14','mubariz','elahi','supervisor','M','21-jun-2002',18000,'B003' )
INSERT INTO  staff VALUES  ('SA9','akram','iqbal','assistant','M','05-oct-2005',9000,'B007' )
INSERT INTO  staff VALUES  ('SG5','rana','tayab','manager','M','11-oct-2000',24000,'B003' )
INSERT INTO  staff VALUES  ('SL41','ali','akram','assistant','M','05-sep-2001',9000,'B005' )

INSERT INTO  staff VALUES  ('SL42','Shayan','Asim','','','M',

/*
DELETE FOREIGN KEY IN EXECUTE   TABLE
*/
ALTER TABLE staffF DROP CONSTRAINT FK__staffF__branchNO__398D8EEE
/*
ADD FOREIGN KEY IN EXECUTE   TABLE
*/
ALTER TABLE staff ADD FOREIGN KEY (branchNO) REFERENCES BRANH(branchNO)
/*
VIEW DATA IN STAFF TABLE
*/
SELECT *FROM staff

SELECT f_name, salary FROM staff

SELECT DISTINCT branchNO FROM staff

/*
CREATE PROPERTYFORRENT  TABLE 
*/

CREATE TABLE propertyforrent( propertyno VARCHAR (6) PRIMARY KEY NOT NULL ,
street VARCHAR  (100),
CITY VARCHAR (100),
postcode VARCHAR(100),
[Type] VARCHAR (100),
room VARCHAR  (10),
rent VARCHAR (100),
ownerNo VARCHAR (100), 
staffNO VARCHAR (6) FOREIGN KEY  REFERENCES staffF (staffNO) NULL,
branchNO varchar(4) FOREIGN KEY  REFERENCES BRANH (branchNO) NULL 
)

/*
INSERT DATA INTO TABLE
*/

INSERT INTO propertyforrent VALUES  ('PA14','16 HOLHEAD','ABRDEEN','AB7 SSU','HOUSE','06',650, 'CO46', 'SA9','B007' )
INSERT INTO propertyforrent VALUES  ('PL94','6 ARGYLL','LONDON','NW2','FLAT','04',400,'CO87','SL41','B005' )
INSERT INTO propertyforrent VALUES  ('PG4','6 LAWRENCE','GLASGOW','G11 9QX','FLAT','03',350, 'CO40',NULL,'B003' )
INSERT INTO propertyforrent VALUES  ('PG36','2 MANOR RD','GLASGOW','G32 4QS','FLAT','03',375,'CO93','SG37','B003' )
INSERT INTO propertyforrent VALUES  ('PG21','18 DALE RD','GLASGOW','G12','HOUSE','O5',600,'CO87','SG37','B003' )
INSERT INTO propertyforrent VALUES  ('PG16','5 NOVEAR DR','GLASGOW','G12 9AX','FLAT','04',450,'CO93','SG14','B003' )

/*
VIEW DATA IN TABLE
*/

SELECT *FROM propertyforrent

SELECT street,[type],branchNO FROM propertyforrent WHERE TYPE='FLAT'

/*
CREATE CLIENT TABLE 
*/

CREATE TABLE CLIENT( clientNO VARCHAR(4) NOT NULL PRIMARY KEY,
fname VARCHAR(100),
Lname VARCHAR(100),
telno VARCHAR (11),
preftype VARCHAR (20),
maxrent VARCHAR(20),
gender VARCHAR(2),
CHECK( gender='M' or gender='F')
)
/*
INSERT VALUE INTO TABLE 
*/

INSERT INTO CLIENT values  ('CR76','AROOJ','anwar', 03334647986 ,'flat',425,'M' )
INSERT INTO CLIENT values  ('CR56','ALINA','USMAN', 03334665486 ,'FLAT',350,'M' )
INSERT INTO CLIENT values  ('CR74','AMAN','HAZIQ',03334647986,'HOUSE',750,'F' )
INSERT INTO CLIENT values  ('CR75','AMAN','ALI',03334649686,'HOUSE',750,'F' )
INSERT INTO CLIENT values  ('CR62','ALI','NADEEM',03334647986,'FLAT',600,'M' )
/*
VIEW DATA TABLE 
*/
SELECT *FROM CLIENT

SELECT clientNo, preftype,maxrent FROM CLIENTt where maxrent='750'

/*
CREATE TABLE 	privateowner 
*/

CREATE TABLE   privateowner ( OwnerNO VARCHAR(10),
Fname VARCHAR(100),
Lname VARCHAR(100),
[Address] VARCHAR (50),
Telno VARCHAR (20),
Gender VARCHAR (100),
CHECK (gender='M' or gender='F')
)

/*
INSTER DATA IN TABLE
*/

INSERT INTO privateowner values  ('Co46','shifa','Amar',' 2 fergus DR,aberdeen AB2 7SX' ,03324647489,'F')
INSERT INTO privateowner values  ('Co87','HAZIQ','NAEEM',' 6 ACHRAY ST,GLASGOW G32 9DX' ,0424647489, 'M' )
INSERT INTO privateowner values  ('Co40','AFFAN','Amar',' 63 WELL ST,GLASGOW G42' ,03454647489 ,'M')
INSERT INTO privateowner values  ('Co93','Amna','Javad',' 12 PARK PI, GLASGOW G4 0QR' ,03375524647489,'F' )

/*
VIEW DATA IN TABLE 
*/
select * from  privateowner

SELECT Fname,Lname,Gender FROM privateowner WHERE Gender='M'


/*
CREATE VIEWING TABLE
*/

CREATE TABLE viewing( 
clientNO VARCHAR(4) FOREIGN KEY  REFERENCES CLIENTt (clientNO) NULL,
propertyno VARCHAR (6) FOREIGN KEY  REFERENCES properyforrentT (propertyno ) NULL,
viewdate VARCHAR (30) ,
comment varchar (20)
)
/* 
INSERT DATA IN TABLE
*/
insert into viewing values  ('CR56','PA14',' 24-MAY-16' ,'TO SMALL' )
insert into viewing values  ('CR76','PG4',' 20-APRIL-17' ,'TO REMOTE' )
insert into viewing values  ('CR56','PG4',' 24-MAY-20' ,NULL )
insert into viewing values  ('CR62','PA14',' 24-MAY-21' ,'NO DINNING ROOM' )
insert into viewing values  ('CR56','PG36',' 24-JUN-21' ,NULL )
 
  /*
  VIEW DATA IN TABLE
  */
select * from  viewing

/*
CREATE REGISTRATION TABLE
*/

CREATE TABLE registration( 
clientNO VARCHAR(4) FOREIGN KEY  REFERENCES CLIENTt (clientNO) NULL, 
branchNO VARCHAR(4)FOREIGN KEY  REFERENCES BRANH (branchNO) NULL,
staffNO VARCHAR(6) FOREIGN KEY  REFERENCES staffF (staffNO) NULL,
DATEJOINED VARCHAR (50)
)

/* 
INSERT DATA IN TABLE
*/

INSERT INTO REGISTRATION VALUES  ('CR76','B005','SL41','2-JUNE-21')
INSERT INTO REGISTRATION VALUES  ('CR56','B003','SG37','11-JULY-22')
INSERT INTO  REGISTRATION VALUES ('CR74','B004','SG37','5-OCT-22')
INSERT INTO REGISTRATION VALUES ('CR62','B007','SA9','07-MAY-22')

  /*
  VIEW DATA IN TABLE
  */

select * from  REGISTRATION

/*
CREATE STUDENT TABLE 
*/

CREATE TABLE student_result(
stud_id VARCHAR (41) PRIMARY KEY  NOT NULL,
fname VARCHAR (66) ,
phone_number VARCHAR (50),
t_numbers VARCHAR (50),
grade VARCHAR (50),
CHECK (grade='A' or grade='B' or grade='C' or grade='D' or grade='E' or grade='F' )
)
 /*
 INSERT DATA INTO TABLE
 
 */

 INSERT INTO student_result VALUES ('5001','Ali',03002610789,540,'A')
 INSERT INTO student_result VALUES ('5002','Azeem',03000261852, 520,'B')
 INSERT INTO student_result VALUES ('5003','Baber',03000000000,480,'C' )
 INSERT INTO student_result VALUES ('5004', 'Asif',03000000500,535, 'A' )
 INSERT INTO student_result VALUES ('5005', 'Qasim',03002587412,460,'D')
 INSERT INTO student_result VALUES ('5006','Waqas',030000000000,440,'E')
 INSERT INTO student_result VALUES ('5007','Fiza',03225874125,300,'F')
 INSERT INTO student_result VALUES ('5008','Aliza',026989656353,545,'A')
 INSERT INTO student_result VALUES ('5009','Sharbano',92000000000,250,'F')
 INSERT INTO student_result VALUES ('5010','zain',0258645622212, 320,'F')
 INSERT INTO student_result VALUES ('5011','Fatima',03000255652,536,'A')

 /*
 VIEW DATA IN TABLE
 */

 SELECT * FROM student_result
   

 /*
 USING WHERE IN STUDENT RESULT TABLE
 */

 SELECT fname,grade,t_numbers FROM student_result WHERE grade='A'
 /*
 USING ORDER BY IN STUDENT RESULT TABLE
 */

   SELECT t_numbers , count(t_numbers)
   FROM student_result
   WHERE t_numbers>400
   GROUP BY t_numbers
   ORDER BY count(t_numbers) DESC

 /*
 USING CARTESION PRODUCT IN STAFF AN BRANCH TABLE
 */

 SELECT * FROM BRANCH,STAFF


/*
USING inner JOIN IN BRANCH AND STAFF TABLE
*/

SELECT *FROM BRANCH inner join STAFF ON   STAFF.branchNO=BRANCH.branchNO

/*
USING EQUI JOIN IN BRANCH AND STAFF TABLE
*/

SELECT  street, f_name,STAFF.branchNO FROM BRANCH,STAFF  WHERE STAFF.branchNO=BRANCH.branchNO

/*
USING NATURAL JOIN IN BRANCH AND STAFF TABLE
*/

SELECT *FROM BRANCH natural join STAFF  on  STAFF.branchNO=BRANCH.branchNO

/*
USING left JOIN IN BRANCH AND STAFF TABLE
*/

SELECT *FROM BRANCH left join STAFF ON STAFF.branchNO=BRANCH.branchNO

/*
USING right JOIN IN BRANCH AND STAFF TABLE
*/

SELECT *FROM BRANCH right join STAFF ON STAFF.branchNO=BRANCH.branchNO

/*
USING full outer JOIN IN BRANCH AND STAFF TABLE
*/

SELECT *FROM BRANCH full outer join STAFF ON STAFF.branchNO=BRANCH.branchNO

/*
    RENAME TABLE NAME 
*/

 SP_RENAME 'BRANCH','BRANCHS'
 
/*
    RENAME COLUMN NAME 
*/
 EXEC sp_rename'viewing.comment ','Comment','column'

 /* 
 APPLY GROUP BY 
 */

 SELECT f_name , position , count(position) AS [Total position]
 from staff
 GROUP BY position,f_name 
 ORDER BY count(position) DESC
 


 SELECT branchNO ,city ,count(branchNO )
 from BRANCH
 GROUP BY branchNO ,city


 /*  
 APPLY having group 
 */
 SELECT f_name, position , count(position) AS [Total position]
 from staff
 WHERE f_name='ali'
 GROUP BY position,f_name
 HAVING position='assistant'
 ORDER BY count(position) DESC
  


 
 SELECT  position , count(position) AS [Total position]
 from staff
 GROUP BY position
 HAVING count(position)>=2 

 
 SELECT f_name, salary , count(branchNO) AS [T.member]
 from staff
 GROUP BY salary, f_name
 HAVING	 salary> 10000
 ORDER BY f_name DESC
 



 /*
 APPLY UNION IN 2 TABLE 
 */
 SELECT branchNo FROM BRANCH UNION SELECT staffNO FROM staff
 
 /*
 APPLY  EXCEPT IN 2 TABLE 
 */
  SELECT branchNo FROM BRANCH EXCEPT SELECT staffNO FROM staff

  /*
 APPLY  INTERSECT IN 2 TABLE 
 */
 SELECT branchNo FROM BRANCH INTERSECT SELECT staffNo FROM staff

 /*
 APPLY   FULL JOIN IN 2 TABLE 
 */
 SELECT *FROM BRANCH FULL JOIN staff ON staff.branchNO=BRANCH.branchNO WHERE staff.branchNO	IS NULL OR BRANCH.branchNO IS NULL


 create table book1 (
 bookid VARCHAR (100) not null PRIMARY KEY,
 bookname VARCHAR (100),
 [language] VARCHAR (100)
 )
  
  SELECT * FROM book1
  
  INSERT INTO book1 VALUES ('U991','English A', 'English' )
  INSERT INTO book1 VALUES ('U992','URDU','URDU')
  INSERT INTO book1 VALUES ('U993','ISL','ENGLISH/URDU')
  INSERT INTO book1 VALUES ('U994','FAR','ENGLISH/URDU')

  CREATE TABLE class1(
  bookid VARCHAR (100) FOREIGN KEY REFERENCES book1(bookid),
  student_name VARCHAR (30),
  age varchar (30)
  )

  SELECT * FROM class1

 INSERT INTO class1 VALUES ('U991','ALI','12')
 INSERT INTO class1 VALUES ('U992','USMAN','14')
 INSERT INTO class1 VALUES ('U993','HUMZA','10')
 INSERT INTO class1 VALUES ('U993','HUZA','5')
 
 SELECT * FROM book1 join class1 on book1.bookid=class1.bookid
 SELECT * FROM book1 inner join class1 on class1.bookid=book1.bookid
 SELECT * FROM book1 RIGHT join class1 on class1.bookid=book1.bookid
 SELECT * FROM book1 inner join class1 on class1.bookid=book1.bookid
 SELECT * FROM book1,class1 where book1.bookid=class1.bookid 
 SELECT student_name,bookname,class1.bookid FROM book1,class1 where class1.bookid=book1.bookid
 SELECT bookid FROM class1  intersect SELECT bookid FROM book1
