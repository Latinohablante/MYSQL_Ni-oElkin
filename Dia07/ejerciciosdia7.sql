show databases;

create database dia8;

use dia8;

show databases;

drop table productos;

create table productos(
	id int auto_increment,
	nombre varchar(100),
	precio decimal(10,2),
	primary key(id)
);

insert into productos values
    (1,"Pepito",23.2),
    (2,"MousePad",100000.21),
    (3,"Espionap",2500.25),
    (4,"BOB-ESPONJA",1500.25),
    (5,"Cary",23540000.23),
    (6,"OvulAPP",198700.23),
    (7,"PapayAPP",2000.00),
    (8,"Menosprecio",3800.00),
    (9,"CariciasOlfer",2300.00),
    (10,"Perfume La Cumbre", 35000.25),
    (11,"Nevera M800",3000.12),
    (12,"Crema Suave", 2845.00),
    (13,"juego de mesa La Cabellera",9800.00);
   
   select * from productos;
    
   /* Para crear una función la cuál me retorne el nombre del producto
    * con el precio más iva 19%
    * 
    */
show function status where Db = "dia8";

   
DELIMITER //
create function TotalConIVA (precio decimal(10,2),tasaIVA decimal(5,2))
returns decimal(10,2)
begin
	return precio+((precio * tasaIVA)/100);
end //
DELIMITER ;

drop function TotalConIVA; 


select TotalConIVA(25000.300, 19.00) as precioConIVA;


select nombre, TotalConIVA(precio, 19) as precioConIVA
from productos where nombre = "Cary";

-- Aquí tengo la función que retorna varchar
delimiter //
create function TotalConIVAString(precio decimal(10,2),tasaIVA decimal(5,2))
returns varchar(255)
begin
	return concat("Tu precio con iva es:",precio+((precio*19)/100));
end;
delimiter ;
drop function TotalConIVA;

-- Aquí tengo la función que aplica un descuento si el producto tiene un precio inferior a 1000
delimiter //
create function TotalConIVASDesc(precio decimal(10,2),tasaIVA decimal(5,2))
returns varchar(255)
begin
	if precio < 1000 then
		return concat("Tu precio con más descuento es:",precio+((precio*19-2)/100));
	else
		return concat("Tu precio con iva es:",precio+((precio*19)/100));
	end if;
end//
delimiter ;
drop function TotalConIVA;

select TotalConIVASDesc("")