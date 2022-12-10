use db_tienda;

/* vista 1 retorna el total a pagar por Id de factura, incluye id factura y total a pagar*/
create view vista_ingresos
as select id_Factura,totalApagar
from detalle_factura;

select * from vista_ingresos;

/* vista 2 retorna los productos que pertenecen a la categoria vestuario, incluye nombre producto y descripción */
create view vista_productos_vestuario
as select nombreProducto,descripcion
from productos
where id_Categoria=1;

select * from vista_productos_vestuario;

/* vista 3 retorna las facturas asociadas a la vendedora Paola, incluye id fatura e id cliente*/
create view vista_facturas_vendedor_paola
as select idFactura,id_Cliente
from facturas
where id_Vendedor=3;

select * from vista_facturas_vendedor_paola;

/* vista 4 retorna las ventas de cada producto, incluye nombre producto, detalle factura y total a pagar */
create view vista_ventasPorProducto
as select productos.nombreProducto,detalle_factura.id_Producto, detalle_factura.totalApagar
from productos, detalle_factura
where productos.idProducto = detalle_factura.id_Producto;

select * from vista_ventasPorProducto;

/* vista 5 retorna las compras realizadas por cada cliente, incluye id factura, nombre producto, nombre cliente y total a pagar*/

create view vista_compras_por_cliente
as select facturas.idFactura,productos.nombreProducto,clientes.nombre, detalle_factura.totalApagar
from clientes,facturas,productos, detalle_factura
where productos.idProducto = detalle_factura.id_Producto and clientes.idCliente=facturas.id_cliente;

select * from vista_compras_por_cliente;