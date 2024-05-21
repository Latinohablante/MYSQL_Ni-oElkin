show databases;
use mysql;
show tables;
select * from user;

-- Revisar los usuarios creados
select user, host from mysql.user;
create database EjemploClase;
use EjemploClase;

-- Crear un usuario
create user 'pedro'@'localhost' identified by 'pedro123';

-- Revisar los permisos que el usuario tiene
show GRANTS for 'pedro'@'localhost';
create user 'pedro'@'172.16.101.132' identified by 'pedro123';
show GRANTS for 'pedro'@'172.16.101.132';

-- doy permisos
grant select , insert , update, delete on *.* to 'pedro'@'172.16.101.132';
flush privileges;

-- Revocar todos los permisos
revoke all privileges on *.* from "pedro"@"172.16.101.132";
drop user "pedro"@"172.16.101.132";


-- Revisar procesos
show processlist;



-- Quitar procesos
kill 238;


-- Acceder a un usuario  de otro lado *Esto no lo entiendo muy bien*
mysql -u pedro -p -h 172.16.101.112