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

select * from respaldo_productos