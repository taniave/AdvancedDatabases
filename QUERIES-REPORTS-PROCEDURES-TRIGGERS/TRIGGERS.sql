--TRIGGERS

delimiter //
--Actualizar cantidad existente del producto.

create trigger act_existencia_producto after insert on desglose_pedido
for each row
begin
  update producto set cantidad_producto=(cantidad_producto-new.cantidad) where clave_producto=new.clave_producto;
end;//


--Actualizar total del pedido.

create trigger act_total_pedido before insert on desglose_pedido
for each row
begin
    set @precio=(select precio_venta from producto where clave_producto=new.clave_producto);
    set @monto= @precio*new.cantidad;
  update pedido_cliente set total_pedido=total_pedido+@monto where folio_pedido=new.folio_pedido;
end; //

DELIMITER ;
