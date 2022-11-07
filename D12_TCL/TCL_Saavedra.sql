use db_tienda;

/* selección de la tabla a trabajar con rollback y commit */
select * from categoria;
select * from productos;
show create table categoria;
/* alteración de la tabla por integridad para poder eliminar registros que son foreing key */
alter table categoria drop constraint categoria_ibfk_1;
alter table categoria drop constraint categoria_ibfk_2;
alter table productos drop constraint productos_ibfk_1;

alter table categoria add foreign key(idCategoria)
references productos(id_Categoria) on delete cascade on update cascade;


/* Parte 1 ---- uso de rollback y commit para deshacer eliminación de registro */
/* inicio transacción */
start transaction;

/* eliminación de registro idCategoria=3 calzado */
delete from categoria
where idCategoria=3;


rollback; 
commit;

/* Parte 2 ---- inserción de datos y aplicación de savepoint */
start transaction;

/* insertando 8 registros en la tabla productos 
select * from productos;

/* primer savepoint */
insert into productos(idProducto,id_Categoria,nombreProducto,descripcion)
values(null,1,'Polera H','Polera H tallas m-xl'),
(null,1,'Calza M','Calza M tallas m-xl'),
(null,2,'Audifono','Audifono bluetooth Lg'),
(null,2,'Notebook Hp','Notebook 14p-ssd5500gb-corei9');

savepoint 1_al_4;

insert into productos(idProducto,id_Categoria,nombreProducto,descripcion)
values (null,3,'Zapatilla H','Zapatilla running numeros 42-47'),
(null,2,'Notebook Lenovo','Notebook 14p-ssd5500gb-corei9'),
(null,3,'Zapatilla M','Zapatilla running numeros 35-42'),
(null,3,'Zapatilla M','Zapatilla M numeros 39-43');

savepoint 5_al_8;

rollback to 5_al_8;
release savepoint 1_al_4;
commit;

