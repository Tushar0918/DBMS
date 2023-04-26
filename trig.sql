/*
Objective: Create a trigger and procedure to update rating of a sailor
Author Name: Tushar Raju Gaikwad
Rno: 47
PRN Number: UCS21M1047
Batch: AS3
*/


delimiter $$  
create trigger RE before insert on reserve
for each row
begin
call sailor_update(new.sid);
end $$
delimiter ;

delimiter $$
create procedure sailor_update(in X int(3))
begin
update Sailors set srating=srating+1 where sid=X;
end $$
delimiter ; 


/*
mysql> show tables;
+--------------+
| Tables_in_BR |
+--------------+
| Boats        |
| Sailors      |
| reserve      |
+--------------+
3 rows in set (0.00 sec)

mysql> select * from Boats;
+-----+-------+--------+
| Bid | Bname | Bcolor |
+-----+-------+--------+
| 101 | XYZ   | White  |
| 102 | ABC   | RED    |
| 103 | LMN   | BLACK  |
+-----+-------+--------+
3 rows in set (0.00 sec)

mysql> select * from Sailors;
+-----+---------+---------+
| sid | sname   | srating |
+-----+---------+---------+
|   1 | Alok    |       5 |
|   2 | Kaushal |       6 |
|   3 | Chetan  |       2 |
+-----+---------+---------+
3 rows in set (0.00 sec)

mysql> source /home/student/trig.sql
Query OK, 0 rows affected (0.12 sec)

Query OK, 0 rows affected, 1 warning (0.13 sec)

mysql> insert into reserve values(101,2,'2023-01-01');
Query OK, 1 row affected (0.12 sec)

mysql> select * from Sailors;
+-----+---------+---------+
| sid | sname   | srating |
+-----+---------+---------+
|   1 | Alok    |       5 |
|   2 | Kaushal |       7 |
|   3 | Chetan  |       2 |
+-----+---------+---------+
3 rows in set (0.00 sec)

*/
