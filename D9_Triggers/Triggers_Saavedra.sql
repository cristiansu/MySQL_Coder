use db_tienda;

create table respaldo_productos (
id_RP int not null auto_increment primary key,
nombreProducto varchar(45),
descripcion varchar(100)
);

/*Trigger que crea respaldo al insertar datos en tabla productos*/
create trigger respaldo_prod
after insert on productos
for each row
insert into respaldo_productos (nombreProducto,descripcion) 
values (new.nombreProducto,new.descripcion);


insert into productos (idProducto,id_Categoria,nombreProducto,descripcion)
values (null,1,"Polera S-M-L-XL", "Polera cuello pique");

select * from respaldo_productos;

/*Trigger que crea bitácora al insertar datos en tabla clientes*/

create table bitacora_creacion_clientes (
id_VC int not null auto_increment primary key,
fecha datetime not null,
usuario_id varchar(45),
new_cliente_nombre varchar(45),
new_cliente_apellido varchar(45),
new_cliente_rut varchar(20)
);

create trigger respaldo_prod
after insert on clientes
for each row
insert into bitacora_creacion_clientes (fecha,usuario_id,new_cliente_nombre,new_cliente_apellido,new_cliente_rut) 
values (now(),session_user(),new.nombre,new.apellido,new.rut);

insert into clientes (idCliente,nombre,apellido,rut)
values (null,"Marie","Curie","1123456-5");

select * from bitacora_creacion_clientes;

select * from clientes;
