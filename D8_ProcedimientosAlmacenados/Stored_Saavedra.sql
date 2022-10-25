use db_tienda;

/* SP ejecuta query para ver tabla detalle factura*/
DELIMITER //
create procedure ver_detalle_ventas()
begin
select * from detalle_factura;
end
//

call ver_detalle_ventas

/* SP muestra productos según numero de Id de su categoría */
DELIMITER //
create procedure productos_por_categ(in id int)
begin
select * from productos where productos.id_Categoria=id;
end
//

call productos_por_categ(2)


/* SP  que cuenta la cantidad de productos*/
DELIMITER //
create procedure contador_productos()
begin
select substring_index(nombreProducto," ",1) Buscar_Producto, count(*) Cantidad from productos
group by substring_index(nombreProducto," ",1);
end
//
call contador_productos()


/* SP  que cuenta la cantidad de productos según parámetro de búsqueda*/
DELIMITER //
create procedure contador_productos_por_buscador(in buscar varchar(24))
begin
select substring_index(nombreProducto," ",1) Buscar_Producto, count(*) Cantidad from productos
where substring_index(nombreProducto," ",1) like buscar
group by substring_index(nombreProducto," ",1);
end
//

call contador_productos_por_buscador("Audifono")