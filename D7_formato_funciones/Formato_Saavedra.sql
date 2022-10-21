use db_tienda;

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