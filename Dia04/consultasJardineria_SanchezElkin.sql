use tienda;

-- Devuelve un listado con el código de oficina y la ciudad donde hay oficinas.
select codigo_oficina, ciudad
from oficina;

-- Devuelve un listado con la ciudad y el teléfono de las oficinas de España.
select ciudad, telefono
from oficina
where pais = "España";

-- Devuelve un listado con el nombre, apellidos y email de los empleados cuyo jefe tiene un código de jefe igual a 7.
select puesto, nombre, apellido1, apellido2, email, codigo_jefe
from empleado
where codigo_jefe like concat("7","%");

-- Devuelve el nombre del puesto, nombre, apellidos y email del jefe de la empresa.
select puesto, nombre, apellido1, apellido2, email
from empleado 
where puesto = "Director General";

select puesto, nombre, apellido1, apellido2, email
from empleado
where codigo_jefe is null;

-- Devuelve un listado con el nombre, apellidos y puesto de aquellos empleados que no sean representantes de ventas.
select nombre, apellido1, apellido2, puesto
from empleado
where puesto != "Representante Ventas";


-- Devuelve un listado con el nombre de los todos los clientes españoles.
select nombre_cliente, nombre_contacto, apellido_contacto
from cliente
where pais = "Spain";


-- Devuelve un listado con los distintos estados por los que puede pasar un pedido.
select distinct estado
from pedido;


-- Devuelve un listado con el código de cliente de aquellos clientes que realizaron algún pago en 2008. 
-- Tenga en cuenta que deberá eliminar aquellos códigos de cliente que aparezcan repetidos. Resuelva la consulta:
select 