create database	db_tienda;

use db_tienda;

create table clientes (
idCliente int not null auto_increment primary key,
nombre varchar(45),
apellido varchar(45),
rut varchar(20)
);

create table vendedor (
idVendedor int not null auto_increment primary key,
nombre varchar(45),
apellido varchar(45),
rut varchar(20)
);

create table facturas (
idFactura int not null auto_increment primary key,
fecha date,
id_Cliente int not null,
id_Vendedor int not null,
foreign key (id_Cliente) references clientes(idCliente),
foreign key (id_Vendedor) references vendedor(idVendedor)
);


create table categoria (
idCategoria int not null auto_increment primary key,
nombreCategoria varchar(45),
descripcion varchar(100)
);

create table productos (
idProducto int not null auto_increment primary key,
id_Categoria int not null,
nombreProducto varchar(45),
descripcion varchar (100),
foreign key (id_Categoria) references categoria(idCategoria)
);

use db_tienda;
create table detalle_factura (
idDetalleFactura int not null auto_increment primary key,
id_Factura int not null,
Id_Producto int not null,
cantidad int,
precio int,
totalApagar int,
foreign key (id_Factura) references facturas(idFactura),
foreign key (id_Producto) references productos(idProducto)
);





