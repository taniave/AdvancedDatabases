--REPORTES

--PROCEDIMIENTO PARA CREAR EL REPORTE DE FACTURAS REALIZADAS EN EL MES ACTUAL Y MOSTRAR LOS DATOS DE LOS CLIENTES

    create procedure reporte_actual_facturas()
      BEGIN
        declare anio,mes,temp,cont,cli integer;
          set anio=(select year(current_date()));
          set mes = (select month(current_date()));
          set temp = (select count(*) from facturar
                      where month(fecha_emision) = mes AND
                      year(fecha_emision) = anio
                      );
          if(temp != 0) then
          select monthname(current_date()) as "MES ACTUAL";
              select folio_factura as "FOLIO FACTURA",fecha_emision as "FECHA DE EMISION",pedido_cliente.folio_pedido as "FOLIO PEDIDO", pedido_cliente.num_cliente as "NUMERO CLIENTE", rfc_cliente as RFC,
              concat_ws(" ",nombre_cliente,ap_pat,ap_mat) as "NOMBRE",
              concat_ws(" ",calleynum,colonia,cp,ciudad,estado) as "DIRECCION", email_cliente as "EMAIL"
              from pedido_cliente,facturar,cliente
              where facturar.folio_pedido = pedido_cliente.folio_pedido AND mes = month(fecha_emision) AND anio = year(fecha_emision) AND cliente.num_cliente = pedido_cliente.num_cliente
              and facturar.folio_pedido = pedido_cliente.folio_pedido and facturar.folio_pedido = pedido_cliente.folio_pedido
              order by fecha_emision;
          else
          select monthname(current_date()) as "MES ACTUAL";
          select "Hasta el momento no se han emitido facturas" as MENSAJE;
          end if;
      END//

--PROCEDIMIENTO PARA MOSTRAR EL REPORTE DE PRODUCTOS MAS VENDIDOS EN EL MES
create procedure mas_vendidos()
  BEGIN
    declare temp,mes,anio integer;

    set anio=(select year(current_date()));
    set mes = (select month(current_date()));
    set temp = (select count(*) from pedido_cliente
                where month(fecha_pedido) = mes
                and year(fecha_pedido) = anio);

    if(temp!=0) THEN
      select monthname(current_date()) as "MES ACTUAL";
      select "Desglose de los pedidos en el mes" as "REPORTE";
      select pedido_cliente.folio_pedido as "PEDIDO",fecha_pedido as "FECHA DE PEDIDO",desglose_pedido.cantidad as "CANTIDAD VENDIDA", nombre_producto as "PRODUCTO"
      from producto, desglose_pedido,pedido_cliente
      where producto.clave_producto = desglose_pedido.clave_producto
      AND desglose_pedido.folio_pedido = pedido_cliente.folio_pedido
      AND month(fecha_pedido) = mes
      AND year(fecha_pedido) = anio
      order by desglose_pedido.cantidad desc;
      select "Reporte de cantidades totales vendidas por producto en el mes" as "REPORTE";
      select nombre_producto as PRODUCTO, sum(desglose_pedido.cantidad) VENTAS
      from producto, desglose_pedido,pedido_cliente
      where producto.clave_producto = desglose_pedido.clave_producto
      AND desglose_pedido.folio_pedido = pedido_cliente.folio_pedido
      AND month(fecha_pedido) = mes
      AND year(fecha_pedido) = anio
      group by nombre_producto
      order by sum(desglose_pedido.cantidad) desc;

    ELSE
      select monthname(current_date()) as "MES ACTUAL";
      select "Hasta el momento no se tienen ventas registradas" as MENSAJE;

    end if;

  END//

  ********************************************************************************
    --LLAMADAS A REPORTES

    call reporte_actual_facturas()//
    call mas_vendidos()//

  ********************************************************************************
