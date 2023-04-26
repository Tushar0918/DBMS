/*
Objective: Procedure to update book status 
Author Name: Tushar Raju Gaikwad
Rno: 47
PRN Number: UCS21M1047
Batch: AS3
*/


Delimiter $$
create procedure S1(in rn int(3),in b int(3),in dr date)
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


/*

mysql> use libraryyy
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> show tables;
+---------------------+
| Tables_in_libraryyy |
+---------------------+
| Book_Status         |
| Stud                |
+---------------------+
2 rows in set (0.00 sec)

mysql> select * from Book_Status;
+------+------+--------+-------------+
| rno  | bid  | status | fine_amount |
+------+------+--------+-------------+
|    1 |  101 | R      |         165 |
|    2 |  102 | R      |         730 |
|    3 |  103 | R      |           0 |
|    4 |  104 | R      |         200 |
|    5 |  105 | R      |         160 |
|    6 |  106 | R      |        3660 |
|    7 |  111 | R      |           0 |
|   47 |    1 | R      |        1200 |
+------+------+--------+-------------+
8 rows in set (0.03 sec)

mysql> Select * from Stud;
+------+------+------------+------------+
| rno  | bid  | DoI        | DoR        |
+------+------+------------+------------+
|    1 |  101 | 2023-01-10 | 2023-02-12 |
|    2 |  102 | 2023-01-01 | 2023-03-15 |
|    3 |  103 | 2023-04-01 | 2023-04-15 |
|    4 |  104 | 2023-04-10 | 2023-05-20 |
|    5 |  105 | 2023-04-18 | 2023-05-20 |
|    6 |  106 | 2020-01-01 | 2021-01-01 |
|    7 |  111 | 2020-02-02 | 2020-03-02 |
|   47 |    1 | 2023-01-01 | 2023-05-01 |
+------+------+------------+------------+
8 rows in set (0.03 sec)

mysql> drop procedure S2;
Query OK, 0 rows affected (0.20 sec)

mysql> source /home/student/lib.sql
ERROR 1304 (42000): PROCEDURE S1 already exists
mysql> drop procedure S1;
Query OK, 0 rows affected (0.12 sec)

mysql> source /home/student/lib.sql
Query OK, 0 rows affected, 3 warnings (0.12 sec)

mysql> insert into Stud(rno,bid,DoI) values(15,201,'2023-01-01');
Query OK, 1 row affected (0.09 sec)

mysql> call S1(15,201,'2023-02-01');
Query OK, 1 row affected (0.20 sec)

mysql> select * from Stud;
+------+------+------------+------------+
| rno  | bid  | DoI        | DoR        |
+------+------+------------+------------+
|    1 |  101 | 2023-01-10 | 2023-02-12 |
|    2 |  102 | 2023-01-01 | 2023-03-15 |
|    3 |  103 | 2023-04-01 | 2023-04-15 |
|    4 |  104 | 2023-04-10 | 2023-05-20 |
|    5 |  105 | 2023-04-18 | 2023-05-20 |
|    6 |  106 | 2020-01-01 | 2021-01-01 |
|    7 |  111 | 2020-02-02 | 2020-03-02 |
|   47 |    1 | 2023-01-01 | 2023-05-01 |
|   15 |  201 | 2023-01-01 | 2023-02-01 |
+------+------+------------+------------+
9 rows in set (0.00 sec)

mysql> select * from Book_Status;
+------+------+--------+-------------+
| rno  | bid  | status | fine_amount |
+------+------+--------+-------------+
|    1 |  101 | R      |         165 |
|    2 |  102 | R      |         730 |
|    3 |  103 | R      |           0 |
|    4 |  104 | R      |         200 |
|    5 |  105 | R      |         160 |
|    6 |  106 | R      |        3660 |
|    7 |  111 | R      |           0 |
|   47 |    1 | R      |        1200 |
|   15 |  201 | R      |         155 |
+------+------+--------+-------------+
9 rows in set (0.00 sec)
*/
