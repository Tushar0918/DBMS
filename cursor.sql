/* SQL query to copy table data into another table 
  Name: Tushar Raju Gaikwad Batch: AS3 Roll no:47  */

delimiter $$
create procedure proc_copy()
begin
  declare flag int default 0;
  declare B int;
  declare N varchar(20);
  declare C varchar(20);

  declare B_cursor cursor for select * from Boats;
  declare continue handler for not found set flag=1;

  open B_cursor;

   fetchdata:loop
     fetch B_cursor into B,N,C;
     if flag=1 then 
     leave fetchdata;
     end if;
    
    insert into Copied values(B,N,C);
    end loop fetchdata;
    close B_cursor;
end $$
delimiter ;


/*
mysql> desc Boats;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| Bid    | int         | NO   | PRI | NULL    |       |
| Bname  | varchar(20) | YES  |     | NULL    |       |
| Bcolor | varchar(20) | YES  |     | NULL    |       |
+--------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)


mysql> source /home/student/cursor.sql
Query OK, 0 rows affected (0.20 sec)

mysql> show tables;
+--------------+
| Tables_in_BR |
+--------------+
| Boats        |
| Sailors      |
| reserve      |
+--------------+
3 rows in set (0.00 sec)


mysql> create table Copied(
    -> B int,
    -> N varchar(20),
    -> C varchar(20)
    -> );
Query OK, 0 rows affected (1.06 sec)


mysql> call proc_copy();
Query OK, 0 rows affected (0.57 sec)

mysql> select * from Copied;
+------+------+-------+
| B    | N    | C     |
+------+------+-------+
|  101 | XYZ  | White |
|  102 | ABC  | RED   |
|  103 | LMN  | BLACK |
|  104 | QWE  | Red   |
|  105 | QWR  | WHite |
|  106 | QWY  | Blue  |
+------+------+-------+
6 rows in set (0.00 sec)

*/


