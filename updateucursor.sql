/* SQL query to update age column in table using cursor 
 Name : Tushar Raju Gaikwad batch - AS3 Roll no: 47 */
 
 
delimiter $$
create procedure updt()
begin 
  declare N varchar(20);
  declare x int(2);
  declare flag int default 0;
  
   declare A_cursor cursor for select * from A;
   declare continue handler for not found set flag=1;
   
  open A_cursor;
  
  fetchdata:loop
     fetch A_cursor into N,x;
     if flag=1 then
     leave fetchdata;
     end if;
     update Data set age=x where name=N;
     end loop fetchdata;
     close A_cursor;
end $$
delimiter ;


/* OUTPUT

mysql> create database Updation;
Query OK, 1 row affected (0.15 sec)

mysql> use Updation;
Database changed
mysql> create table Data;
ERROR 4028 (HY000): A table must have at least one visible column.
mysql> create table Data(
    -> sr int(3),
    -> name varchar(20),
    -> desg varchar(20),
    -> age int(2),
    -> DoB date,
    -> adr varchar(20)
    -> );
Query OK, 0 rows affected, 2 warnings (0.55 sec)

mysql> create table A(
    -> name varchar(20),
    -> age int(2)
    -> );
Query OK, 0 rows affected, 1 warning (0.50 sec)

mysql> insert into Data(sr,name,desg,DoB,adr) values(1,'X','SE','2000-01-01','KPG');
Query OK, 1 row affected (0.09 sec)

mysql> select * from Data;
+------+------+------+------+------------+------+
| sr   | name | desg | age  | DoB        | adr  |
+------+------+------+------+------------+------+
|    1 | X    | SE   | NULL | 2000-01-01 | KPG  |
+------+------+------+------+------------+------+
1 row in set (0.00 sec)

mysql> insert into Data(sr,name,desg,DoB,adr) values(2,'Y','ST','2000-02-01','KPG');
Query OK, 1 row affected (0.14 sec)

mysql> insert into Data(sr,name,desg,DoB,adr) values(3,'Z','Design','2000-03-01','KPG');
Query OK, 1 row affected (0.09 sec)

mysql> insert into Data(sr,name,desg,DoB,adr) values(4,'A','HR','2000-04-01','SP');
Query OK, 1 row affected (0.09 sec)

mysql> select * from Data;
+------+------+--------+------+------------+------+
| sr   | name | desg   | age  | DoB        | adr  |
+------+------+--------+------+------------+------+
|    1 | X    | SE     | NULL | 2000-01-01 | KPG  |
|    2 | Y    | ST     | NULL | 2000-02-01 | KPG  |
|    3 | Z    | Design | NULL | 2000-03-01 | KPG  |
|    4 | A    | HR     | NULL | 2000-04-01 | SP   |
+------+------+--------+------+------------+------+
4 rows in set (0.00 sec)

mysql> insert into A values('X',21);
Query OK, 1 row affected (0.17 sec)

mysql> insert into A values('Y',22);
Query OK, 1 row affected (0.11 sec)

mysql> insert into A values('Z',31);
Query OK, 1 row affected (0.08 sec)

mysql> insert into A values('A',28);
Query OK, 1 row affected (0.10 sec)

mysql> select * from A;
+------+------+
| name | age  |
+------+------+
| X    |   21 |
| Y    |   22 |
| Z    |   31 |
| A    |   28 |
+------+------+
4 rows in set (0.00 sec)

mysql> source /home/student/updateucursor.sql
Query OK, 0 rows affected, 1 warning (0.15 sec)

mysql> call updt();
Query OK, 0 rows affected (0.59 sec)

mysql> select * from Data;
+------+------+--------+------+------------+------+
| sr   | name | desg   | age  | DoB        | adr  |
+------+------+--------+------+------------+------+
|    1 | X    | SE     |   21 | 2000-01-01 | KPG  |
|    2 | Y    | ST     |   22 | 2000-02-01 | KPG  |
|    3 | Z    | Design |   31 | 2000-03-01 | KPG  |
|    4 | A    | HR     |   28 | 2000-04-01 | SP   |
+------+------+--------+------+------------+------+
4 rows in set (0.00 sec)

*/
