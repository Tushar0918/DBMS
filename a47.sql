/*
Objective: Create a procedure to update fine amount and set book status
Author Name: Tushar Raju Gaikwad
Rno: 47
PRN Number: UCS21M1047
Batch: AS3
*/


Delimiter $$
create procedure S(in rn int(3),in b int(3),in dr date)
Begin 
Declare I date;
Declare R date;
Declare temp int(2);
update Stud set DoR=dr where rno=rn and bid=b;
select DoI into I from Stud where rno=rn and bid=b;
set temp=DATEDIFF(dr,I);
if (temp<30) then
update Book_Status set fine_amount=0,Status='R' where rno=rn and bid=b;
elseif (temp>30 and temp<45) then
update Book_Status set fine_amount=temp*5,Status='R' where rno=rn and bid=b;
elseif (temp>45) then
update Book_Status set fine_amount=temp*10,Status='R' where rno=rn and bid=b;
end if;
end $$
Delimiter ;


delimiter &&
create trigger nnn before insert on Stud
for each row
begin
insert into Book_Status(rno,bid,status) values(new.Rno,new.bid,'I');
end &&
delimiter ;








/*  OUTPUT

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| AMS                |
| ASS3               |
| ASS4               |
| Ass4               |
| B98                |
| BMS                |
| BR                 |
| BRS                |
| EMS                |
| Employee           |
| GAURI146           |
| Game               |
| LIB                |
| Lib                |
| Library            |
| RMS                |
| STUDENT            |
| SY100              |
| SYB                |
| Sy98               |
| T                  |
| UDBS               |
| Updation           |
| aaa                |
| abc                |
| ass3               |
| ass8               |
| b89                |
| bank               |
| basic              |
| bro                |
| bs1                |
| data               |
| data_sy82          |
| databasen1         |
| databasenikhil1234 |
| databasesy82       |
| db_82              |
| dept               |
| dipak              |
| information_schema |
| lib                |
| libr               |
| library            |
| libraryyy          |
| libray             |
| locker             |
| mysql              |
| newdbt             |
| notebook           |
| pankaj             |
| performance_schema |
| pf                 |
| prasanna           |
| product            |
| rutuja             |
| sauru              |
| sauru1             |
| shop               |
| stu                |
| stu_info           |
| stud               |
| studdetails        |
| student            |
| student2           |
| sy84               |
| syb                |
| sys                |
| yard               |
+--------------------+
69 rows in set (0.00 sec)

mysql> use libraryyy;
Database changed
mysql> show tables;
+---------------------+
| Tables_in_libraryyy |
+---------------------+
| Book_Status         |
| Stud                |
+---------------------+
2 rows in set (0.00 sec)

mysql> desc Book_Status;
+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| rno         | int         | YES  |     | NULL    |       |
| bid         | int         | YES  |     | NULL    |       |
| status      | varchar(10) | YES  |     | NULL    |       |
| fine_amount | int         | YES  |     | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> desc Stud;
+-------+------+------+-----+---------+-------+
| Field | Type | Null | Key | Default | Extra |
+-------+------+------+-----+---------+-------+
| rno   | int  | YES  |     | NULL    |       |
| bid   | int  | YES  |     | NULL    |       |
| DoI   | date | YES  |     | NULL    |       |
| DoR   | date | YES  |     | NULL    |       |
+-------+------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> insert into Stud(rno,bid,DoI) values(1,101,"2023-01-01");
Query OK, 1 row affected (0.08 sec)

mysql> select * from Stud;
+------+------+------------+------+
| rno  | bid  | DoI        | DoR  |
+------+------+------------+------+
|    1 |  101 | 2023-01-01 | NULL |
+------+------+------------+------+
1 row in set (0.00 sec)

mysql> select * from Book_Status;
+------+------+--------+-------------+
| rno  | bid  | status | fine_amount |
+------+------+--------+-------------+
|    1 |  101 | I      |        NULL |
+------+------+--------+-------------+
1 row in set (0.00 sec)

mysql> call S(1,101,"2023-02-01");
Query OK, 1 row affected (0.17 sec)

mysql> select * from Stud;
+------+------+------------+------------+
| rno  | bid  | DoI        | DoR        |
+------+------+------------+------------+
|    1 |  101 | 2023-01-01 | 2023-02-01 |
+------+------+------------+------------+
1 row in set (0.00 sec)

mysql> select * from Book_Status;
+------+------+--------+-------------+
| rno  | bid  | status | fine_amount |
+------+------+--------+-------------+
|    1 |  101 | R      |         155 |
+------+------+--------+-------------+
1 row in set (0.00 sec)

mysql> insert into Stud(rno,bid,DoI) values(2,102,"2023-03-01");
Query OK, 1 row affected (0.10 sec)

mysql> call S(2,102,"2023-03-25");
Query OK, 1 row affected (0.17 sec)

mysql> select * from Book_Status;
+------+------+--------+-------------+
| rno  | bid  | status | fine_amount |
+------+------+--------+-------------+
|    1 |  101 | R      |         155 |
|    2 |  102 | R      |           0 |
+------+------+--------+-------------+
2 rows in set (0.00 sec)

mysql> select * from Stud;
+------+------+------------+------------+
| rno  | bid  | DoI        | DoR        |
+------+------+------------+------------+
|    1 |  101 | 2023-01-01 | 2023-02-01 |
|    2 |  102 | 2023-03-01 | 2023-03-25 |
+------+------+------------+------------+
2 rows in set (0.00 sec)
*/
