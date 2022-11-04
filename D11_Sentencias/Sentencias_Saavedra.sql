use mysql;

show tables;

select * from user;

/* Parte 1 : Crear usuarios */

/* creación de usuario con acceeso a sólo lectura */
create user 'user_solo_lectura'@'localhost' identified by 'clave1';


/* creación de usuario con acceeso a lectura-inserción-modificación */
create user 'user_lect_inserc_modif'@'localhost' identified by 'clave2';

/* Parte 2: Asignar permisos al usuario user_solo_lectura */

/* verificar los permisos por defecto del usuario user_solo_lectura */
select * from mysql.user where user='user_solo_lectura';

/* ver permisos por defecto al usuario: 'user_solo_lectura'@'localhost' */
show grants for 'user_solo_lectura'@'localhost';

/* asignación de permisos de SOLO LECTURA al usuario: 'user_solo_lectura'@'localhost' en la base de datos db_tienda */
grant select on db_tienda.* to 'user_solo_lectura'@'localhost';


/* Parte 3: Asignar permisos al usuario user_lect_inserc_modif */

/* verificar los permisos por defecto del usuario user_lect_inserc_modif */
select * from mysql.user where user='user_lect_inserc_modif';

/* ver permisos por defecto al usuario: 'user_lect_inserc_modif'@'localhost' */
show grants for 'user_lect_inserc_modif'@'localhost';

/* asignación de permisos de LEER,INSERTAR,MODIFICAR al usuario: 'user_lect_inserc_modif'@'localhost' en la base de datos db_tienda */
grant select,insert,update on db_tienda.* to 'user_lect_inserc_modif'@'localhost';