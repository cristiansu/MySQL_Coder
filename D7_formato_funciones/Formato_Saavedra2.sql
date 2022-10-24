use db_tienda;

/*Función calcula valor bruto es decir neto más iva*/
DELIMITER //
create function valor_bruto(a float, b float) returns float
deterministic
begin
	declare resultado float;
	set resultado = a*b;
    return resultado;

end
//

select totalApagar, valor_bruto(totalApagar,1.19) from detalle_factura;

/* Funcion devuelve nombre cliente según su id */
DELIMITER //
create function get_cliente(id int) returns varchar(24)
deterministic
begin
	declare nombre_cliente varchar(24);
    set nombre_cliente=(select nombre from db_tienda.clientes where idCliente=id);
    return nombre_cliente;
end
//

select get_cliente(1);