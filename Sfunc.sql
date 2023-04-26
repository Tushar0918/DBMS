/*
Objective: Create a function to determin user level
Author Name: Tushar Raju Gaikwad
Rno: 47
PRN Number: UCS21M1047
Batch: AS3
*/



Delimiter $$
create function display(USEREXP decimal(10,2)) Returns int(3) Deterministic
Begin
Declare l int(3);
if USEREXP > 25000 Then
set l=100;
elseif (USEREXP <= 25000 and USEREXP >10000) Then
set l=40;
elseif USEREXP <= 10000  Then
set l=10;
end if;
Return (l);
end $$
Delimiter ;



/*  --OUTPUT--
mysql> create database Game;
Query OK, 1 row affected (0.16 sec)

mysql> use Game;
Database changed

mysql> create table Users( uid int(3), uname varchar(20), uexp decimal(10,2), ulvl int(3) );
Query OK, 0 rows affected, 2 warnings (0.98 sec)

mysql> insert into Users(uid,uname,uexp) values(101,'Bot',20000.50);
Query OK, 1 row affected (0.11 sec)

mysql> insert into Users(uid,uname,uexp) values(102,'Bot 2',45000.50);
Query OK, 1 row affected (0.10 sec)

mysql> insert into Users(uid,uname,uexp) values(103,'Bot 3',10000.70);
Query OK, 1 row affected (0.10 sec)

mysql> source /home/student/Sfunc.sql
Query OK, 0 rows affected, 2 warnings (0.13 sec)


mysql> create view Userss(uid,uname,uexp,ulvl) as select uid,uname,uexp,display(uexp) from Users;
Query OK, 0 rows affected (0.12 sec)

mysql> select * from Userss;
+------+-------+----------+------+
| uid  | uname | uexp     | ulvl |
+------+-------+----------+------+
|  101 | Bot   | 20000.50 |   40 |
|  102 | Bot 2 | 45000.50 |  100 |
|  103 | Bot 3 | 10000.70 |   40 |
+------+-------+----------+------+
3 rows in set (0.00 sec)

*/
