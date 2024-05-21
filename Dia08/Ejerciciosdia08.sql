-- Creando el procedimiento
create procedure buscarProductoProcedure(in nombreBusqueda varchar(50))
begin
	select * from productos where nombre = nombreBusqueda;
end

call buscarProductoProcedure("Pepito");


-- PROCEDURE

delimiter //
create procedure searchProductoProcedure(in nombreSearch varchar(50),
out datoSalida varchar(255))
begin
	select precio into datoSalida from productos where nombre = nombreSearch;
end //
delimiter;

set @dataSalida = "";
call searchProductoProcedure("Cary", @dataSalida);
end
