use db_tienda;

insert into clientes(idCliente,nombre,apellido,rut)
values(null,'Cristian','Saavedra','123456789-1'),
(null,'Carlos','Urbina','723456789-1'),
(null,'Paola','Urbina','723476789-1'),
(null,'Hedy','Lamert','793456789-1'),
(null,'Arnold','Shwgr','323456789-1')
;

insert into vendedor(idVendedor,nombre,apellido,rut)
values(null,'Guiselle','Pozo','103456789-1'),
(null,'Jeanette','Cheukeman','721456789-1'),
(null,'Paola','Saavedra','793450789-1')
;

insert into facturas(idFactura,fecha,id_Cliente,id_Vendedor)
values(null,'2022-10-13',1,1),
(null,'2022-10-12',1,1),
(null,'2022-10-10',3,2),
(null,'2022-10-09',2,2),
(null,'2022-11-13',5,3),
(null,'2022-11-13',4,2),
(null,'2022-10-13',1,2)
;

insert into categoria(idCategoria,nombreCategoria,descripcion)
values(null,'Vestuario','Vestuario general M-F'),
(null,'Electronica','Articulos electronicos'),
(null,'Calzado','Calzado general M-F')
;

insert into productos(idProducto,id_Categoria,nombreProducto,descripcion)
values(null,1,'Polera H','Polera H tallas s-xl'),
(null,1,'Calza M','Calza M tallas s-xl'),
(null,2,'Audifono','Audifono bluetooth'),
(null,2,'Notebook Hp','Notebook 14p-ssd512gb-corei7'),
(null,3,'Zapatilla H','Zapatilla running numeros 39-47'),
(null,3,'Zapatilla M','Zapatilla M numeros 37-43');

insert into detalle_factura(idDetalleFactura,id_Factura,Id_Producto,cantidad,precio,totalApagar)
values(null,1,1,1,100,100),
(null,2,3,1,40,40),
(null,3,2,2,30,60),
(null,4,5,1,130,130),
(null,5,2,2,40,80),
(null,6,1,1,40,40),
(null,7,5,1,130,130);

select * from detalle_factura;