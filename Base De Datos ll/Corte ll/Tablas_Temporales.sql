/* Tablas temporales
 * 
 * Nivel De sesiones
 * Nivel De transaccion
 * 
 * 
 *  SINTAXIS
 * 
 * create (temporaRy|TEMP)  table Nombre_table
(column)
[on commit(preserve rows | delete row | DROP)]

- preserve rows Y delete rows -- son aplicaciones para indicar que las tablas son temporales en una sesion
drop -- indica que la tabla es temporal en una transaccion


-- SINTAXIS CONSULTA

create (temporaRy|TEMP)  table Nombre_table
(column)
[on commit(preserve rows | delete row | DROP)]

as 
query
[with [no] data];
 * 
 * 
 */


create temporary table temporal1(
	tuno_id int,
	tuno_data varchar(255)
) on commit delete rows;


insert into temporal1 (tuno_id,tuno_data)
values(1,'dato 1 temporal 1')

insert into temporal1 (tuno_id,tuno_data)
values(2,'dato 1 temporal 2')

select * from temporal1



create temporary table temporal2(
	tuno_id int,
	tuno_data varchar(255)
) on commit preserve rows;


insert into temporal2 (tuno_id,tuno_data)
values(1,'dato 1 temporal 1')

insert into temporal2 (tuno_id,tuno_data)
values(2,'dato 1 temporal 2')

select * from temporal2


-- tarea creara una tabla temporal con todas las tareas de prioridad  media y que mueste en nombre de la prioridad
--dentro de una transaccion



begin:

create temporary table temporal1(
	tuno_id int,
	tuno_data varchar(255)
) on commit drop;


rollback:
commit;
