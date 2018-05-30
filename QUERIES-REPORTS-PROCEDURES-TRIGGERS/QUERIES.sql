--CONSULTAS

--CONSULTAR LA EXISTENCIA DE ALGUN INSUMO

  create procedure stock_insumo(in claveInsumo varchar(45))
    BEGIN
    set @min = (select stock_min from insumo where clave_insumo = claveInsumo);
    set @stock = (select stock from insumo where clave_insumo = claveInsumo);

    if(@stock > @min) then select "Hay suficiente del insumo" as "MENSAJE";
    select clave_insumo as "CLAVE INSUMO", nombre_insumo as "NOMBRE", stock as "STOCK",stock_min as "EXISTENCIA MINIMA", medida as "MEDIDA"
    from insumo
    where clave_insumo = claveInsumo;
    end if;
    if(@stock < @min) then select "Es necesario surtir el insumo" as "ALERTA";
    select clave_insumo as "CLAVE INSUMO", nombre_insumo as "NOMBRE", stock as "STOCK",stock_min as "EXISTENCIA MINIMA", medida as "MEDIDA"
    from insumo
    where clave_insumo = claveInsumo;
    end if;

    END//

    -- CONSULTAR LOS DATOS DE UN FOLIO DE FACTURA
  create procedure consultar_factura(in folioFactura smallint)
  begin
   set @idEmpleado= (select id_empleado from facturar where folio_factura=folioFactura);
   set @folio = (select folio_factura from facturar where folio_factura=folioFactura);
   if(@folio=folioFactura) THEN
  select folio_factura as "FACTURA",fecha_emision as "EMISION",folio_pedido as "PEDIDO",facturar.id_empleado as "EMPLEADO",concat_ws(" ",nombre_empleado,pat,mat) as "NOMBRE", turno as TURNO, puesto as PUESTO
  from facturar,empleado where folio_factura=folioFactura and empleado.id_empleado=@idEmpleado;
  else
  select "Folio de factura no existente" as "ALERTA";
  end if;
  end//

************************************************************************************************************************************************
--llamadas de consultas
call stock_insumo("")//
call consultar_factura("")//


**************************************************************************************************************************************************
