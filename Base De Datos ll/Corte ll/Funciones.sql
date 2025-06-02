--- SINTAXIS
/*CREAR UN PROCEDIMIEMTO ALMACENADO QUE ME SUME 2 NUMEROS Y DEVUELVA EL RESULTADO
 * 
 * [<<etiqueta>>]
declare
	--declaracion de variable
begin
	--codigo
end

 */

create or replace function suma(integer,integer) returns integer as $$
declare 
	numero1 ALIAS for $1;
	numero2 ALIAS for $2;
	resultado integer;
begin
	resultado := numero1+numero2;
	return resultado;
end
$$ language plpgsql;

select suma(5,5);


