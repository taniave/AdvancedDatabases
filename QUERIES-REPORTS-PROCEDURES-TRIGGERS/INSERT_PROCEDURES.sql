--PROCEDIMIENTOS QUE INSERTAN DATOS DENTRO DE LA BASE DE DATOS italian.sql
delimiter //

--PROCEDIMIENTO INSERT CLIENTE
create procedure insert_cliente(IN nombre varchar(45),IN ap varchar(45),IN am varchar(45),IN calleynum varchar(25),IN colonia varchar(25),IN ciudad varchar(25),IN estado varchar(25),IN cp varchar(25),IN telefono varchar(15),IN rfc varchar(25),IN email varchar(45))
begin
  if(nombre like "" or ap like "" or am like "" or calleynum like "" or colonia like "" or ciudad like "" or estado like "" or cp like "") then
    if(nombre like "") then select "Tiene que digitar el nombre" as Error; end if;
    if(ap like "") then select "Tiene que digitar el apellido paterno" as Error; end if;
    if(am like "") then select "Tiene que digitar el apellido materno" as Error; end if;
    if(calleynum like "") then select "Tiene que digitar la calle con el número" as Error; end if;
    if(colonia like "") then select "Tiene que digitar la colonia" as Error; end if;
    if(ciudad like "") then select "Tiene que digitar la ciudad" as Error; end if;
    if(estado like "") then select "Tiene que digitar el estado" as Error; end if;
    if(cp like "") then select "Tiene que digitar el código postal" as Error; end if;
  else
    insert into cliente values(default,nombre,ap,am,calleynum,colonia,ciudad,estado,cp,telefono,rfc,email);
    select "Cliente registrado correctamente"  as Resultado;
  end if;
end
//

-- PROCEDIMIENTO INSERT PRODUCTO

create procedure insert_producto(IN clave varchar(8),IN nombre varchar(18),IN cantidad int(10),IN medida varchar(25),IN precio_venta decimal(4,2))
begin
  if(clave like "" or nombre like "" or medida like "" or precio_venta like "" or precio_venta<=0 ) then
    if(clave like "") then select "Tiene que digitar la clave del producto" as Error; end if;
    if(nombre like "") then select "Tiene que digitar el nombre del producto" as Error; end if;
    if(medida like "") then select "Tiene que digitar la medida" as Error; end if;
    if(precio_venta like "") then select "Tiene que digitar el precio de venta" as Error; end if;
    if(cantidad<0) then select "La cantidad debe ser mayor a cero" as Error; end if;
    if(precio_venta<=0) then select "El precio de venta debe ser mayor a cero" as Error; end if;
  else
    insert into producto values(clave,nombre,cantidad,medida,precio_venta);
    select "Producto registrado correctamente"  as Resultado;
  end if;
end
//

--PROCEDIMIENTO INSERT PROVEEDOR

create procedure insert_proveedor(IN rfc varchar(14),IN nombre varchar(45),IN calleynum varchar(25),IN colonia varchar(25),IN ciudad varchar(25),IN estado varchar(25),IN cp int(10),IN telefono varchar(15),IN email varchar(45))
begin
  if(rfc like "" or nombre like "" or calleynum like "" or colonia like "" or ciudad like "" or estado like "" or cp like "") then
    if(rfc like "") then select "Tiene que digitar el RFC" as Error; end if;
    if(nombre like "") then select "Tiene que digitar el nombre" as Error; end if;
    if(calleynum like "") then select "Tiene que digitar la calle con el número" as Error; end if;
    if(colonia like "") then select "Tiene que digitar la colonia" as Error; end if;
    if(ciudad like "") then select "Tiene que digitar la ciudad" as Error; end if;
    if(estado like "") then select "Tiene que digitar el estado" as Error; end if;
    if(cp like "") then select "Tiene que digitar el código postal" as Error; end if;
  else
    insert into proveedor values(rfc,nombre,calleynum,colonia,ciudad,estado,cp,telefono,email);
    select "Proveedor registrado correctamente"  as Resultado;
  end if;
end
//

--PROCEDIMIENTO INSERT PUESTO SUELDO

create procedure insert_puesto_sueldo(IN puesto_ varchar(15),IN sueldo decimal(8,2))
begin
  set @x=(select puesto from puesto_sueldo where puesto=puesto_ COLLATE 'latin1_spanish_ci');

  if(@x is not null or puesto_ like "" or sueldo like "" or sueldo<=0) then
    if(@x is not null) then select "El nombre del puesto ya existe" as Error; end if;
    if(puesto_ like "") then select "Tiene que digitar el puesto" as Error; end if;
    if(sueldo like "") then select "Tiene que digitar el sueldo" as Error; end if;
    if(sueldo<=0) then select "El sueldo debe ser mayor a cero" as Error; end if;
  else
    insert into puesto_sueldo values(puesto_,sueldo);
    select "Registro ingresado correctamente"  as Resultado;
  end if;
end
//

--PROCEDIMIENTO INSERT EMPLEADO

create procedure insert_empleado(IN nombre varchar(45),IN ap varchar(45),IN am varchar(45),IN calleynum varchar(25),IN colonia varchar(25),IN ciudad varchar(25),IN estado varchar(25),IN cp varchar(25),IN telefono varchar(15),IN email varchar(45),IN turno varchar(25),IN puesto_emp varchar(15))
begin
  set @x =(select puesto from puesto_sueldo where puesto=puesto_emp COLLATE 'latin1_spanish_ci');

  if(nombre like "" or ap like "" or am like "" or calleynum like "" or colonia like "" or ciudad like "" or estado like "" or cp like "" or turno like "" or @x is null) then
    if(nombre like "") then select "Tiene que digitar el nombre" as Error; end if;
    if(ap like "") then select "Tiene que digitar el apellido paterno" as Error; end if;
    if(am like "") then select "Tiene que digitar el apellido materno" as Error; end if;
    if(calleynum like "") then select "Tiene que digitar la calle con el número" as Error; end if;
    if(colonia like "") then select "Tiene que digitar la colonia" as Error; end if;
    if(ciudad like "") then select "Tiene que digitar la ciudad" as Error; end if;
    if(estado like "") then select "Tiene que digitar el estado" as Error; end if;
    if(cp like "") then select "Tiene que digitar el código postal" as Error; end if;
    if(turno like "") then select "Tiene que digitar el turno" as Error; end if;
    if(@x is null) then select "El puesto dado no existe" as Error; end if;

  else
    insert into empleado values(default,nombre,ap,am,calleynum,colonia,ciudad,estado,cp,telefono,email,turno,puesto_emp);
    select "Empleado registrado correctamente"  as Resultado;
  end if;
end
//


--PROCEDIMIENTO INSERT INSUMO

create procedure insert_insumo(IN clave varchar(7),IN nombre varchar(45),IN marca varchar(45),IN stock int(10),IN minimo int,IN medida varchar(25))
begin
  if(clave like "" or nombre like "" or marca like "" or medida like "" or stock<=0 or minimo<=0 ) then
    if(clave like "") then select "Tiene que digitar la clave del insumo" as Error; end if;
    if(nombre like "") then select "Tiene que digitar el nombre del insumo" as Error; end if;
    if(marca like "") then select "Tiene que digitar la medida" as Error; end if;
    if(medida like "") then select "Tiene que digitar la medida" as Error; end if;
    if(minimo<1) then select "El stock minimo debe ser mayor a uno" as Error; end if;
    if(stock<=0) then select "El stock debe ser mayor a cero" as Error; end if;
  else
    insert into insumo values(clave,nombre,marca,stock,minimo,medida);
    select "Insumo registrado correctamente"  as Resultado;
  end if;
end
//
--PROCEDIMIENTO INSERT SURTE
create procedure insert_surte(IN rfc_proveedor varchar(14))
begin
  set @x =(select rfc from proveedor where rfc=rfc_proveedor COLLATE 'latin1_spanish_ci');

  if(@x is null or  rfc_proveedor like "") then
    if(@x is null) then select "El RFC de proveedor dado no existe" as Error; end if;
    if(rfc_proveedor like "") then select "Tiene que digitar el RFC" as Error; end if;
  else
    insert into surte values(default,curdate(),rfc_proveedor);
    select "Registro ingresado correctamente"  as Resultado;
  end if;
end
//


--PROCEDIMIENTO INSER CANTIDAD_SURTE

create procedure insert_cantidad_surte(IN folio smallint(3),IN clave varchar(7),IN cantidad int(10),IN precio_compra float(9,2))
begin
  set @x =(select folio_surte from surte where folio_surte=folio COLLATE 'latin1_spanish_ci');
  set @y =(select clave_insumo from insumo where clave_insumo=clave COLLATE 'latin1_spanish_ci');

  if(@x is null or @y is null or cantidad like "" or clave like "" or cantidad<=0 or precio_compra<=0) then
    if(@x is null) then select "El folio dado no existe" as Error; end if;
    if(@y is null) then select "La clave del insumo dado no existe" as Error; end if;
    if(cantidad like "") then select "Tiene que digitar la cantidad" as Error; end if;
    if(cantidad<=0) then select "La cantidad debe ser mayor a cero" as Error; end if;
    if(precio_compra<=0) then select "El precio debe ser mayor a cero" as Error; end if;
    if(clave like "") then select "Tiene que digitar la clave del insumo" as Error; end if;
  else
    insert into cantidad_surte values(folio,clave,cantidad,precio_compra);
    select "Registro ingresado correctamente"  as Resultado;
  end if;
end
//


--PROCEDIMIENTO INSERT SURTE FRECUENCIA

create procedure insert_surte_frecuencia(IN clave varchar(7),IN frecuencia varchar(45))
begin
  set @x =(select clave_insumo from insumo where clave_insumo=clave COLLATE 'latin1_spanish_ci');

  if(@x is null or frecuencia like "" or clave like "") then
    if(@x is null) then select "La clave del insumo dado no existe" as Error; end if;
    if(frecuencia like "") then select "Tiene que digitar la frecuencia" as Error; end if;
    if(clave like "") then select "Tiene que digitar la clave" as Error; end if;
  else
    insert into surte_frecuencia values(clave,frecuencia);
    select "Registro ingresado correctamente"  as Resultado;
  end if;
end
//


--PROCEDIMIENTO INSERT UTILIZA

create procedure insert_utiliza(IN claveProducto varchar(8),IN claveInsumo varchar(7),IN folioSurte smallint(3),IN cantidad int(10))
begin
  set @x =(select clave_producto from producto where clave_producto=claveProducto COLLATE 'latin1_spanish_ci');
  set @y =(select clave_insumo from insumo where clave_insumo=claveInsumo COLLATE 'latin1_spanish_ci');
  set @z =(select folio_surte from surte where folio_surte=folioSurte COLLATE 'latin1_spanish_ci');

  if(@x is null or @y is null or @z is null or claveProducto like "" or claveInsumo like "" or cantidad like "" or cantidad<0) then
    if(@x is null) then select "La clave del producto dado no existe" as Error; end if;
    if(@y is null) then select "La clave del insumo dado no existe" as Error; end if;
    if(@z is null) then select "El folio dado no existe" as Error; end if;
    if(cantidad like "") then select "Tiene que digitar la cantidad" as Error; end if;
    if(claveProducto like "") then select "Tiene que digitar la clave del producto" as Error; end if;
    if(claveInsumo like "") then select "Tiene que digitar la clave del insumo" as Error; end if;
    if(cantidad<0) then select "La cantidad debe ser mayor o igual a cero" as Error; end if;
  else
    insert into utiliza values(claveProducto,claveInsumo,folioSurte,cantidad);
    select "Registro ingresado correctamente"  as Resultado;
  end if;
end
//



--PROCEDIMIENTO INSERT PEDIDO CLIENTE

create procedure insert_pedido_cliente(IN id_cliente smallint(3))
begin
  set @x =(select num_cliente from cliente where num_cliente=id_cliente COLLATE 'latin1_spanish_ci');

  if(@x is null ) then
    if(@x is null) then select "El id del cliente dado no existe" as Error; end if;
  else
    insert into pedido_cliente values(default,id_cliente,curdate(),default);
    select "Pedido registrado correctamente"  as Resultado;
  end if;
end
//


-- PROCEDIMIENTO INSERT DESGLOSE PEDIDO


create procedure insert_desglose_pedido(IN folioPedido smallint(2),IN cantidad int(10),IN claveProducto varchar(8))
begin
  set @cantidadExistente = (select cantidad_producto from producto where clave_producto=claveProducto COLLATE 'latin1_spanish_ci');
  set @x =(select folio_pedido from pedido_cliente where folio_pedido=folioPedido COLLATE 'latin1_spanish_ci');
  set @y =(select clave_producto from producto where clave_producto=claveProducto COLLATE 'latin1_spanish_ci');

  if(@x is null or @y is null or cantidad like "" or cantidad<=0 or @cantidadExistente<cantidad or claveProducto like "") then
    if(@x is null) then select "El folio del pedido dado no existe" as Error; end if;
    if(cantidad like "") then select "Tiene que digitar la cantidad" as Error; end if;
    if(claveProducto like "") then select "Tiene que digitar la clave del producto" as Error; end if;
    if(@y is null) then select "La clave del producto dado no existe" as Error; end if;
    if(cantidad<=0) then select "La cantidad debe ser mayor a cero" as Error; end if;
    if(@cantidadExistente<cantidad) then select "La cantidad digitada es mayor a la cantidad del producto en el stock" as Error; end if;
  else
    insert into desglose_pedido values(folioPedido,cantidad,claveProducto);
    select "Registro ingresado correctamente"  as Resultado;
  end if;
end
//


-- PROCEDIMIENTO INSERT FACTURA

create procedure insert_facturar(IN folioPedido smallint(2),IN idEmpleado smallint(3))
begin
  set @x =(select folio_pedido from pedido_cliente where folio_pedido=folioPedido COLLATE 'latin1_spanish_ci');
  set @y =(select id_empleado from empleado where id_empleado=idEmpleado COLLATE 'latin1_spanish_ci');

  if(@x is null or @y is null) then
    if(@x is null) then select "EL folio dado no existe" as Error; end if;
    if(@y is null) then select "El id del empleado dado no existe" as Error; end if;
  else
    insert into facturar values(default,curdate(),folioPedido,idEmpleado);
    select "Factura registrada correctamente"  as Resultado;
  end if;
end
//


--PROCEDIMIENTO INSERT DESGLOSE FACTURA

create procedure insert_desglose_factura(IN pedido smallint(3),IN claveProducto varchar(8))
begin
  set @x =(select folio_pedido from pedido_cliente where folio_pedido=pedido COLLATE 'latin1_spanish_ci');
  set @y =(select clave_producto from producto where clave_producto=claveProducto COLLATE 'latin1_spanish_ci');

  if(@x is null or @y is null or  claveProducto like "") then
    if(@x is null) then select "El pedido dado no existe" as Error; end if;
    if(@y is null) then select "La clave del producto dado dado no existe" as Error; end if;
    if(claveProducto like "") then select "Tiene que digitar la clave del producto" as Error; end if;
  else
    insert into desglose_factura values(pedido,claveProducto);
    select "Registro ingresado correctamente"  as Resultado;
  end if;
end
//


DELIMITER ;


select * from cantidad_surte  //
select * from cliente         //
select * from desglose_factura//
select * from desglose_pedido //
select * from empleado        //
select * from facturar        //
select * from insumo          //
select * from pedido_cliente  //
select * from producto        //
select * from proveedor       //
select * from puesto_sueldo   //
select * from surte           //
select * from surte_frecuencia//
select * from utiliza         //
+-------------------+

reporte_actual_facturas()
cliente()
mas_vendidos()
existencia_stock()


drop procedure insert_cliente //
drop procedure insert_producto //
drop procedure insert_proveedor //
drop procedure insert_puesto_sueldo //
drop procedure insert_empleado //
drop procedure insert_insumo //
drop procedure insert_surte //
drop procedure insert_cantidad_surte //
drop procedure insert_surte_frecuencia //
drop procedure insert_utiliza //
drop procedure insert_pedido_cliente //
drop procedure insert_desglose_pedido //
drop procedure insert_facturar //
drop procedure insert_desglose_factura //

--INICIAN PRUEBAS DE INSERCION

call insert_cliente("Laura Camila","Joya","Aroca","Privada del tigre 1841","Las Hadas","Puebla","Puebla","70701","222 235 6464","65283GHF537","laura@gmail.com")//
call insert_cliente("Laura Camila","Joya","Aroca","Privada del tigre 1841","Las Hadas","Puebla","Puebla","70701","","","")//
call insert_cliente("","Joya","Aroca","Privada del tigre 1841","","Puebla","Puebla","70701","","65283GHF537","laura@gmail.com")//


call insert_producto("HHH234","Gourmet Tea",3,"litros",38)//
call insert_producto("","Gourmet Tea",3,"litros",38)//
call insert_producto("HHH234342","",-1,"litros",-38)//

call insert_proveedor("HEO450HR7HHE","Caffe Trombetta","San Martin 453","Jardines de Santiago","Puebla","Puebla","70794","2227461934","caffe@trombetta.com")//
call insert_proveedor("AAABBBT67856","Caffe Ita","Martin 453","Jardines de Santiago","Puebla","Puebla","70794","","")//
call insert_proveedor("","Caffe Trombetta","San Martin 453","","Puebla","Puebla","","2227461934","caffe@trombetta.com")//

call insert_puesto_sueldo("Administrador",5000)//
call insert_puesto_sueldo("Cocinero",0)//
call insert_puesto_sueldo("",-5000)//

call insert_empleado("Javier","Salazar","Avila","21 sur 2343", "Santiago","Puebla","Puebla","70605","2228581234","javier23@gmail.com","Matutino","Cocinero")//
call insert_empleado("Jose","Salazar","Avila","19 sur 654", "Santiago","Puebla","Puebla","70605","","","Matutino","Gerente")//
call insert_empleado("Javier","","Avila","21 sur 2343","","Puebla","Puebla","70605","2228581234","javier23@gmail.com","Matutino","Cocinero")//

call insert_insumo("BEI638","Servilletas","Italian Coffee",3,4,"paquetes")//
call insert_insumo("","Vasos","Italian Coffee",0,5,"")//
call insert_insumo("BEI638","Vasos","Italian Coffee",-3,8,"")//

call insert_surte("WLM245PP2000")//
call insert_surte("")//
call insert_surte("WLM245PP2000")//

call insert_cantidad_surte("110","RY15QG",2,50)//
call insert_cantidad_surte("110","",-1,-80)//

call insert_surte_frecuencia("BEI638","mensual")//
call insert_surte_frecuencia("BEI638","")//
call insert_surte_frecuencia("BEI638aa","mensual")//

call insert_utiliza("CA152","RY21JM",150,3)//
call insert_utiliza("CA152","",150,0)//
call insert_utiliza("CA15232","RY21JMq",150,-3)//

call insert_pedido_cliente(1)//
call insert_pedido_cliente(081)//
call insert_pedido_cliente(2)//

call insert_desglose_pedido("14",2,"CCJ43CH")//
call insert_desglose_pedido("14",0,"")//
call insert_desglose_pedido("04",-2,"CA152")//

call insert_facturar(11,202)//
call insert_facturar(150,204)//
call insert_facturar(03,0)//

call insert_desglose_factura(14,"GA180")//
call insert_desglose_factura(14,"")//
call insert_desglose_factura(150,"GA180")//
--TERMINAN PRUEBAS DE INSERCION

-- ALGUNAS OCURRENCIAS QUE SE ENCUENTRAN EN LA BASE DE DATOS

--pedido 18
call insert_pedido_cliente("1","2018-05-04");
call insert_desglose_pedido("17",1,"PI043");
call insert_desglose_pedido("17",2,"GA180");
call insert_desglose_pedido("18",1,"CCJ43CH");
call insert_desglose_pedido("18",1,"MFR43G");
call insert_desglose_pedido("18",3,"HHH234");


--CREACION DE UN NUEVO CLIENTE,PRODUCTO,PROVEEDOR,EMPLEADO

call insert_cliente("Salvador","Chavez","Orozco","15 pte","Las Animas","San Martin","Puebla","70714","2224587961","OCS45102047K","chavez007@gmail.com")//
call insert_producto("ALF140","Alfajores",3,"paquetes",20)//
call insert_proveedor("PLNHA42583S2","Confetti","Presidente Masaryk 412","Polanco","Ciudad de Mexico","CDMX","14278","5552813845","productos@confetti.com")//
call insert_empleado("Lorena","Arquimides","de la Rosa","27 ote 10 int. 15", "San Martin","Guadalajara","Jalisco","14752","3362805471","lore_arq@gmail.com","Vespertino","Mesero")//

--INSUMO Alfajores
call insert_insumo("ALF160","Alfajores","Confetti",3,4,"paquetes")//
call insert_surte("2018-04-15","PLNHA42583S2")//
call insert_surte_frecuencia("ALF160","semanal")//
call insert_cantidad_surte("222","ALF160",5,16)//
call insert_utiliza("ALF140","ALF160",222,0)//

--INSUMO cafe americano
call insert_producto("CA018","Cafe Americano",0,"litros",25)//
call insert_utiliza("CA018","PL014R",130,2)//

--PEDIDO 19
call insert_pedido_cliente("8","2018-05-09")//
call insert_desglose_pedido("19",2,"CCJ43CH")//
call insert_desglose_pedido("19",3,"ALF140")//
call insert_desglose_pedido("19",1,"CA152")//

--factura pedido 19
call insert_desglose_factura(19,"CCJ43CH")//
call insert_desglose_factura(19,"ALF140")//
call insert_desglose_factura(19,"CA152")//
call insert_facturar("2018-05-09",19,201)//

--factura pedido 18
DELIMITER //
call insert_desglose_factura(18,"CCJ43CH")//
call insert_desglose_factura(18,"HHH234")//
call insert_desglose_factura(18,"MFR43G")//
call insert_facturar("2018-05-06",18,207)//

--PEDIDO 20
call insert_pedido_cliente("7","2018-05-15")//
call insert_desglose_pedido("20",5,"CA152")//
call insert_desglose_pedido("20",3,"ALF140")//

--factura pedido 20
call insert_desglose_factura("20","CA152")//
call insert_desglose_factura("20","ALF140")//
call insert_facturar("2018-05-16",20,207)//

--PEDIDO 21
call insert_pedido_cliente("8","2018-05-20")//
call insert_desglose_pedido("21",1,"PI043")//
call insert_desglose_pedido("21",1,"CA152")//
call insert_desglose_pedido("21",1,"CA018")//

--factura pedido 21
call insert_desglose_factura("21","PI043")//
call insert_desglose_factura("21","CA152")//
call insert_desglose_factura("21","CA018")//
call insert_facturar("2018-05-21",21,202)//

--PEDIDO 22
call insert_pedido_cliente("3","2018-05-21")//
call insert_desglose_pedido("22",4,"ALF140")//
call insert_desglose_pedido("22",2,"CA018")//
call insert_desglose_pedido("22",1,"C502")//

--factura pedido 22
call insert_desglose_factura("22","ALF140")//
call insert_desglose_factura("22","CA018")//
call insert_desglose_factura("22","C502")//
call insert_facturar("2018-05-22",22,202)//
