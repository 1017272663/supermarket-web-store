create database DB_MiniMercado_los_Pacos;


use DB_MiniMercado_los_Pacos;


/*---------------------------------------------------------  TABLAS  ---------------------------------------------------------------*/
Create table ROL(
ID_rol int not null,
nombre_rol varchar(50) not null,
Primary key (ID_rol)
);


Create table USUARIO(
ID_user bigint not null,				-- tarjeta de indentidad(Cedula de Ciudadania) 
nombre_user varchar (50) null,			-- nombre del Usuario
Apellido_user varchar (50)null,			-- Apellido del Usuario
telefono_user bigint not null,			-- Numero del telefono selular
correo varchar (50) default null,		-- Correo electronico 
contrasenia varchar (150) not null,		-- Contrasenia de la cuenta de usuario
direcion_user varchar (100) not null,	-- Direcion del usuario
ID_rol int not null,					-- rol del usuario(cliente, administrador,vendedor)
primary key (ID_user),
constraint FK_ROL foreign key (ID_rol) references ROL (ID_rol)
);


Create table MEDIO_PAGO(
ID_medio_pago int not null,
nombre_medio_pago varchar (50)not null,
primary key (ID_medio_pago)
);


Create table CLIENTE_MEDIO_PAGO(
ID_CLIENTE_MEDIO_PAGO int not null auto_increment,
ID_user bigint not null,
ID_medio_pago int not null,
numero bigint null,					-- Número de la tajeta de credito, debito o infromacion del medio de pa
Primary key (ID_CLIENTE_MEDIO_PAGO),
constraint FK_USUARIO foreign key (ID_user) references USUARIO(ID_user),
constraint FK_MEDIO_PAGO foreign key (ID_medio_pago) references MEDIO_PAGO(ID_medio_pago)
);


Create table CATERIA_PRODUCTO(
ID_cateria_producto  int not null auto_increment,
nombre_categria_producto varchar (50) not null,
primary key (ID_cateria_producto)
);


Create table SUBCATERIAS_PRODUCTO(
ID_subcateria_producto int not null auto_increment,
ID_cateria_producto int not null,
nombre_categria_producto varchar (50) not null,
primary key (ID_subcateria_producto),
constraint FK_CATERIA_PRODUCTO foreign key (ID_cateria_producto) references CATERIA_PRODUCTO(ID_cateria_producto)
);


Create table SUBCATERIAS_TIPO2_PRODUCTO(
ID_subcateria_tipo2_producto int not null auto_increment,
ID_subcateria_producto int not null,
nombre_categria_producto varchar (50) not null,
primary key (ID_subcateria_tipo2_producto),
constraint FK_SUBCATERIAS_PRODUCTO foreign key (ID_subcateria_producto) references SUBCATERIAS_PRODUCTO(ID_subcateria_producto)
);


Create table ESTADO_PRODUCTO(
ID_estado_producto  int not null auto_increment,
estado_producto varchar (50) default null,
primary key (ID_estado_producto)
);


Create table MARCA_PRODUCTO(
ID_marca_producto int not null,
nombre_marcaProducto varchar (250) not null,
primary key (ID_marca_producto)
);


Create table PRODUCTO(
ID_producto int not null,
codi_barras bigint default null,
nombre_producto varchar (50) not null,
descripcion_producto varchar (200) default null,
Imagen_producto Varchar (250) null,
precio_unitario decimal not null check (precio_unitario >= 1),
cantidad_producto int not null,
ID_cateria_producto int null,
ID_subCateriaProducto int null,
ID_subcateria_tipo2_producto int null,
ID_estado_producto int default null,
ID_marca_producto int default null,
primary key (ID_producto),
constraint FK_CATERIA_PRODUCTO2 foreign key (ID_cateria_producto) references CATERIA_PRODUCTO(ID_cateria_producto),
constraint FK_SUBCATERIAS_PRODUCTO2 foreign key (ID_subCateriaProducto) references SUBCATERIAS_PRODUCTO (ID_subcateria_producto),
constraint FK_SUBCATERIAS_TIPO2_PRODUCTO foreign key (ID_subcateria_tipo2_producto) references SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_tipo2_producto),
constraint FK_ESTADO_PRODUCTO foreign key (ID_estado_producto) references ESTADO_PRODUCTO (ID_estado_producto),
constraint FK_MARCA_PRODUCTO foreign key (ID_marca_producto) references MARCA_PRODUCTO (ID_marca_producto)
);


Create table PEDIDO(
ID_pedido int not null auto_increment,
ID_producto int not null,
ID_CLIENTE_MEDIO_PAGO int not null,
total_pedido decimal not null,
total_Descuento decimal not null,
cantidad_productos int null,
primary key (ID_pedido),
constraint FK_PRODUCTO Foreign key (ID_producto) references PRODUCTO (ID_producto)
); 


Create table VENTA (
ID_venta int not null auto_increment,
ID_pedido int not null,
total_venta decimal not null,
Fecha_Venta datetime default CURDATE() null check (Fecha_Venta >= '02/09/2020' ),
Hora_Venta  Time default CURDATE() null,
ID_CLIENTE_MEDIO_PAGO int not null,-- nos dise la cantidad de productos de un mismo tipo o ID que el cliente desea comprar
Primary key (ID_venta),
constraint FK_PEDIDO foreign key (ID_pedido) references PEDIDO(ID_pedido),
constraint FK_CLIENTE_MEDIO_PAGO foreign key (ID_CLIENTE_MEDIO_PAGO) references CLIENTE_MEDIO_PAGO(ID_CLIENTE_MEDIO_PAGO)
);
/*-------------------------------------------------------------------------------------------------------------------------------------*/


/** TRIGGER **/
-- nos permite que cuando se realisa un peido se deve descontar la cantidad de productos

-- Prubas oara ver ver la syntax de un trigger
/*
create trigger TR_PEDIDO1
on PEDIDO
for insert
as
update PRODUCTO
set cantidad_producto =cantidad_producto - inserted.cantidad_productos
from PRODUCTO inner join inserted on PRODUCTO.ID_producto=inserted.ID_pedido


create trigger TR_PEDIDO aftert 
on PEDIDO
FOR EACH ROW
UPDATE PRODUCTO
set cantidad_producto =cantidad_producto - .cantidad_productos
from PRODUCTO inner join inserted on PRODUCTO.ID_producto=inserted.ID_pedido




create trigger TR_PEDIDO aftert 
on PEDIDO
FOR EACH ROW
UPDATE PRODUCTO
set cantidad_producto =cantidad_producto - (cantidad_productos-1)
where ID_producto = NEW.ID_producto*/
/*
--Vista que Muestre el Total de Ventas en un Dia
CREATE VIEW VW_TOTAL_VENTAS_DIA
as
SELECT sum(total_venta) as Total_Ventas_Del_Dia FROM VENTA
WHERE Fecha_Venta = GETDATE()

--Vista que sive para saver el total de Ventas en el mes al dia actual
CREATE VIEW VW_TOTAL_VENTAS_MES
as
SELECT sum(total_venta) as Total_Ventas_Del_Mes FROM VENTA
where  month(Fecha_venta)=GETDATE()

--Vista que sive para saver el total de Ventas en el Año al dia actual
CREATE VIEW VW_TOTAL_VENTAS_ANIO
as
SELECT sum(total_venta) as Total_Ventas_Del_AÑO  FROM VENTA
where  year(Fecha_venta)=GETDATE()
*/

/*
--funcion que permite saber el total de ventas en un dia en específico
create function fnTOTAL_VENTAS_DIA_ESPECIFICO(@dia datetime)
returns int
as
begin
declare @suma decimal

SELECT @suma=sum(total_venta) FROM VENTA
where  day(Fecha_venta)=@dia
return (@suma)
end

 -- se llama la funcion

select dbo.fnTOTAL_VENTAS_DIA_ESPECIFICO(10) as TotalDia



--funcion que permite saver el total de ventas en un mes en específico
create function fnTOTAL_VENTAS_MES_ESPECIFICO(@mes datetime)
returns int
as
begin
declare @suma decimal

SELECT @suma=sum(total_venta) FROM VENTA
where  month(Fecha_venta)=@mes
return (@suma)
end

-- se llama la funcion

select dbo.fnTOTAL_VENTAS_MES_ESPECIFICO(10) as TotalMes


--funcion que permite saver el total de ventas en un año en específico
create function fnTOTAL_VENTAS_ANIO_ESPECIFICO(@anio datetime)
returns int
as
begin
declare @suma decimal

SELECT @suma=sum(total_venta) FROM VENTA
where  year(Fecha_venta)=@anio
return (@suma)
end

-- se llama la funcion

select dbo.fnTOTAL_VENTAS_anio_ESPECIFICO(2020) as TotalAnio
*/





/*///////////////////////////////////////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\*/
/*//////////////////////////////////////////////////////      INSERCIÓN    \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\*/
/*//////////////////////////////////////////////////////         DE        \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\*/
/*//////////////////////////////////////////////////////      VALORES      \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\*/
/*///////////////////////////////////////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\*/

/* --------------------------Rol------------------------------- */
insert into ROL values(1,'Cliente');
insert into ROL values(2,'Vendedor');
insert into ROL values(3,'Administrador');
/* ------------------------------------------------------------- */


/* ---------------------------------------------- Usuario ------------------------------------------------*/
insert into USUARIO values(1,'sabina','nzales',3215801010,'sabina@gmail.com','123','calle 1 carrera 1',1); 
insert into USUARIO values(2,'salme','herrera',3215801011,null,'123','calle 2 carreara 5',1);
insert into USUARIO values(3,'salomon','almeida',3215801012,'salomo746@gmail.com','123','calle 3 carrera 9',1);
insert into USUARIO values(4,'samantha','sanchez',3215801013,null,'123','calle 3 carrera 9',1);
insert into USUARIO values(5,'samuel','garzon',3215801014,'samuelsalud158@saludpet.v.co','123','calle 5 carrera 8',1);
insert into USUARIO values(6,'sara','alvarez',3215801015,'sara243@hotmai.com','123','calle 8 carrera 1',1);
insert into USUARIO values(7,'napoleon','piedrahita',3215801016,null,'123','calle 9 carrera 9',1);
insert into USUARIO values(8,'john','nzales',3215801017,'LaParka@quenotepille.ric.co','123','calle 20 carrera 45',1);
insert into USUARIO values(9,'pedro','Guzman',3215801018,'pedro.adasd@hotmai.com','123','calle 21 carrera 69',1);
insert into USUARIO values(10,'alicia','montreal',3215801019,null,'123','calle 22 carrera 98',2);
insert into USUARIO values(11,'carla','jaramillo',3215801020,null,'123','calle 23 carrera 63',2);
insert into USUARIO values(12,'jesus','alcasares',3215801021,'jesus@teama.edu.co','123','calle 29 carrera 64',2);
insert into USUARIO values(13,'juan','Alvarez',3215801022,null,'123','calle 30 carrera 11',2);
insert into USUARIO values(14,'sara','nzales',3215801023,'sara243@hotmai.com','123','calle 8 carrera 1',3);
insert into USUARIO values(15,'juan','piedrahita',3215801024,'juanadminitrador@gmail.com','123','calle 32 carrera 12',3);
/* ------------------------------------------------------------------------------------------------------------------------*/


/* --------------------------MEDIO DE PAGO--------------------------*/
insert into MEDIO_PAGO values(1,'Tarjeta Credito');
insert into MEDIO_PAGO values(2,'Tarjeta Debito');
insert into MEDIO_PAGO values(3,'Cheque');
insert into MEDIO_PAGO values(4,'Efectivo');
insert into MEDIO_PAGO values(5,'Bonos');
insert into MEDIO_PAGO values(6,'Tarjeta Regalo');
insert into MEDIO_PAGO values(7,'Combenio');
/* ----------------------------------------------------------------*/


/*----------------------------------------CLIENTE DEL MEDIO DE PAGO ---------------------------------------------*/
insert into CLIENTE_MEDIO_PAGO(ID_user, ID_medio_pago, numero) values (1, 1, 1234567890000000); 
insert into CLIENTE_MEDIO_PAGO(ID_user, ID_medio_pago, numero) values (1, 1, 1234567890000000); 
insert into CLIENTE_MEDIO_PAGO(ID_user, ID_medio_pago, numero) values (2, 1, 1234567890000001);
insert into CLIENTE_MEDIO_PAGO(ID_user, ID_medio_pago, numero) values(3,1,1234567890000002);
insert into CLIENTE_MEDIO_PAGO(ID_user, ID_medio_pago, numero)values(4,1,1234567890000003);
insert into CLIENTE_MEDIO_PAGO(ID_user, ID_medio_pago, numero) values(5,1,1234567890000004);
insert into CLIENTE_MEDIO_PAGO(ID_user, ID_medio_pago, numero) values(6,2,1234567890000005);
insert into CLIENTE_MEDIO_PAGO(ID_user, ID_medio_pago, numero) values(7,2,1234567890000006);
insert into CLIENTE_MEDIO_PAGO(ID_user, ID_medio_pago, numero) values(8,4,null);
insert into CLIENTE_MEDIO_PAGO(ID_user, ID_medio_pago, numero) values(9,6,1234567890000008);

/*---------------------------------------------------------------------------------------------------------------*/


/*--------------------------------------- CATEGORIA DEL PRODUCTO --------------------------------------------*/
insert into CATERIA_PRODUCTO(nombre_categria_producto) values('Alimentos');
insert into CATERIA_PRODUCTO(nombre_categria_producto) values('Refigerados');
insert into CATERIA_PRODUCTO(nombre_categria_producto) values('Fruber');
insert into CATERIA_PRODUCTO(nombre_categria_producto) values('Aseo Personal y del Hogar');
insert into CATERIA_PRODUCTO(nombre_categria_producto) values('Bebés');
insert into CATERIA_PRODUCTO(nombre_categria_producto) values('Mascotas');
insert into CATERIA_PRODUCTO(nombre_categria_producto) values('Licoreria y Cigarrillos');
insert into CATERIA_PRODUCTO(nombre_categria_producto) values('Refrescos');
insert into CATERIA_PRODUCTO(nombre_categria_producto) values('Pasabocas');
insert into CATERIA_PRODUCTO(nombre_categria_producto) values('Dulseria');
insert into CATERIA_PRODUCTO(nombre_categria_producto) values('Medicamentos');
/*--------------------------------------------------------------- --------------------------------------------*/



/*----------------------------------------------SUBCATEGORIA DEL PRODUCTO----------------------------------------------------*/
insert into SUBCATERIAS_PRODUCTO(ID_cateria_producto, nombre_categria_producto) values(2,'Lácteos');
insert into SUBCATERIAS_PRODUCTO(ID_cateria_producto, nombre_categria_producto) values(1,'huevos');
insert into SUBCATERIAS_PRODUCTO(ID_cateria_producto, nombre_categria_producto) values(1,'Abarrotes');
insert into SUBCATERIAS_PRODUCTO(ID_cateria_producto, nombre_categria_producto) values(1,'Despensa');
insert into SUBCATERIAS_PRODUCTO(ID_cateria_producto, nombre_categria_producto) values(1,'Panadería Y Arepas');
insert into SUBCATERIAS_PRODUCTO(ID_cateria_producto, nombre_categria_producto) values(4,'Aseo Hogar');
insert into SUBCATERIAS_PRODUCTO(ID_cateria_producto, nombre_categria_producto) values(4,'Cuidado de la Ropa');
insert into SUBCATERIAS_PRODUCTO(ID_cateria_producto, nombre_categria_producto) values(4,'Cuidado Personal');
insert into SUBCATERIAS_PRODUCTO(ID_cateria_producto, nombre_categria_producto) values(1,'Café, Chocolate Y Te');
insert into SUBCATERIAS_PRODUCTO(ID_cateria_producto, nombre_categria_producto) values(10,'Galletas Y Dulces');
insert into SUBCATERIAS_PRODUCTO(ID_cateria_producto, nombre_categria_producto) values(2,'Pollo, carne, pescado y embutios');
insert into SUBCATERIAS_PRODUCTO(ID_cateria_producto, nombre_categria_producto) values(1,'Saludables');
insert into SUBCATERIAS_PRODUCTO(ID_cateria_producto, nombre_categria_producto) values(8,'Bebidas');
insert into SUBCATERIAS_PRODUCTO(ID_cateria_producto, nombre_categria_producto) values(7,'Cervezas');
insert into SUBCATERIAS_PRODUCTO(ID_cateria_producto, nombre_categria_producto) values(7,'Vinos');
insert into SUBCATERIAS_PRODUCTO(ID_cateria_producto, nombre_categria_producto) values(7,'Licores');
insert into SUBCATERIAS_PRODUCTO(ID_cateria_producto, nombre_categria_producto) values(2,'Congelados');
insert into SUBCATERIAS_PRODUCTO(ID_cateria_producto, nombre_categria_producto) values(5,'Bebés');
insert into SUBCATERIAS_PRODUCTO(ID_cateria_producto, nombre_categria_producto) values(3,'Frutas y Verduras');
insert into SUBCATERIAS_PRODUCTO(ID_cateria_producto, nombre_categria_producto) values(9,'Pasabocas');
insert into SUBCATERIAS_PRODUCTO(ID_cateria_producto, nombre_categria_producto) values(6,'Mascotas');
insert into SUBCATERIAS_PRODUCTO(ID_cateria_producto, nombre_categria_producto) values(11,'Medicamentos');
/*-----------------------------------------------------------------------------------------------------------------------------------*/


/*------------------------------------------------------ SUBCATERIAS_TIPO2_PRODUCTO --------------------------------------------------------*/
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(1,'Leches');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(1,'Leches Saborizadas');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(1,'Quesos');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(1,'Mantequillas');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(1,'Leche en Polvo');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(1,'Lácteos Refrescantes');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(1,'Yogurt');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(1,'Kumis');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(1,'Avenas');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(1,'Lácteos con Adicionales');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(1,'Lácteos Saludables');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(1,'Yogurt Grie');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(1,'Prostres Refrigerados');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(1,'Cremas');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(1,'Bebidas Vegetales');

insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(2,'Huevos');

insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(3,'Arroz');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(3,'Aceites');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(3,'Azúcar Y Endulzantes');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(3,'Sal');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(3,'Granos');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(3,'Pastas');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(3,'Harinas Y Mezclas Listas');


insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(4,'Enlatados y Conservas');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(4,'Cerelales');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(4,'Barra de Cereal');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(4,'Granolas Y Avenas');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(4,'Salsas y Vinagre');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(4,'Condimentos, Especias y Adobos');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(4,'Caldos,Sopas y Cremas');

insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(5,'Arepas');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(5,'Panes');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(5,'Tostadas y Hojaldres');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(5,'Panes Congelados');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(5,'Muffins Y Waffles');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(5,'Tortillas');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(5,'Tortas Y Ponqués');

insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(6,'Baño');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(6,'Desinfección');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(6,'Lavaloza Y Quitagrasa');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(6,'Ambientadores');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(6,'Toallas de cocina,Servilletas y paños');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(6,'Implementos de Limpieza');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(6,'Limpia Pisos');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(6,'Limpieza de Superficies y Ceras');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(6,'Blanqueadores');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(6,'Insecticidas');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(6,'Bolsas');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(6,'Desechables y Miscelanea');

insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(7,'Detergente Líquido');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(7,'Detergente en Polvo');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(7,'Suavizantes');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(7,'Desmanchadores');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(7,'Jabón en Barra');

insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(8,'Cuidado bucal');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(8,'Shampoo');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(8,'Acondicionadores');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(8,'Cremas para Peinar');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(8,'Tratamiento y Gel para el cabello');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(8,'Jabón');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(8,'Desodorantes');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(8,'Cremas Corporales');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(8,'Talcos y Copitos');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(8,'Afitadoras y Depilacion');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(8,'Cuidado Facial');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(8,'Cuidado íntimo');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(8,'Proteccíon Solar y Repelente');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(8,'Coloración');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(8,'Maquillaje y Uñas');

insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(9,'Chocolate de Mesa');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(9,'Café Molido');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(9,'Café Soluble');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(9,'Café en Grano');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(9,'Cápsulas de Café');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(9,'Complementos de Café');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(9,'Aromáticas');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(9,'Infusiones');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(9,'Te');

insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(10,'Galletas Dulces');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(10,'Galletas Saladas');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(10,'Chocolates');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(10,'Productos Esparcibles');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(10,'Dulces');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(10,'Chicles y Mentas');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(10,'mitas y Masmelos');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(10,'Dulces Tradicionales');

insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(11,'Pollo');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(11,'Pescado');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(11,'Mariscos');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(11,'Salchicas');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(11,'Jamón y Mortadela');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(11,'Embutidos');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(11,'Hamburguesas');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(11,'Carnes y Congelados');

insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(12,'Lácteos y Derivados');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(12,'Despensa');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(12,'Snacks');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(12,'Antojos');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(12,'Pamadería y Arepas');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(12,'Bebidas');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(12,'Endulzantes');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(12,'Orgánicos');

insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(13,'Aguas');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(13,'Aguas Saborizadas');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(13,'Gaseosas');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(13,'Jus y Néctares');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(13,'Maltas');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(13,'Modificadores de Leche');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(13,'Bebias en polvo');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(13,'Hidratantes');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(13,'Complementos Nutricionales');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(13,'Té Liquido');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(13,'Energizantes');

insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(14,'Cervezas');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(14,'Cervezas Artesanales');

insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(15,'Vinos Chilenos');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(15,'Vinos Argentinos');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(15,'Vinos');

insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(16,'Aguardiente');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(16,'Whisky');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(16,'Ron');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(16,'Vodka');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(16,'Ginebra');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(16,'Tequila');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(16,'Otors Licores');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(16,'Tónicas');

insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(17,'Apanados');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(17,'Comidas Listas Y Snacks');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(17,'Fruta Congelada');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(17,'Panes Congelados');

insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(18,'Alimento para Bebé');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(18,'Fórmulas Infantiles');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(18,'Hora del Baño');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(18,'Humectacón y Colonias');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(18,'Pañales');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(18,'Pañitos y Cremas Antipañalitis');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(18,'Maternidad');

insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(19,'Frutas');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(19,'Verduras');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(19,'Papa');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(19,'Desgranados');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(19,'Orgánicos');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(19,'Hierbas y Especias');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(19,'fruta y Verdura Congelada');

insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(20,'Papas');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(20,'Mixtos');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(20,'Snacks');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(20,'Tortillas de Maíz');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(20,'Platanitos');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(20,'Crispetas');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(20,'Maní, Nueces y Snacks');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(20,'Frutos Secos y Deshidratados');

insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(21,'Arena para Gatos');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(21,'Concentrado Perros');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(21,'Concentrado Gatos');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(21,'Alimento Húmedo Perros');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(21,'Alimento Húmedo Gatos');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(21,'Higiene de la Mascota');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(21,'Snacks y Juguetes');

insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(22,'Alivio del Dolor');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(22,'Gripa y Tos');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(22,'Salud Digestiva');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(22,'Fórmulas Infantiles');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(22,'Vitaminas y Alimentos Funcionales');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(22,'Cuidado del Adulto');
insert into SUBCATERIAS_TIPO2_PRODUCTO(ID_subcateria_producto, nombre_categria_producto) values(22,'Complementos Nutricionales');
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/


/*----------------------------ESTADO DEL PRODUCTO-------------------------------*/
insert into ESTADO_PRODUCTO(estado_producto) values('Normal');
insert into ESTADO_PRODUCTO(estado_producto) values('Atado');
insert into ESTADO_PRODUCTO(estado_producto) values('Promocion');
insert into ESTADO_PRODUCTO(estado_producto) values('Descuneto');
/*------------------------------------------------------------------------------*/


/*--------------------------MARCA DEL PRODUCTO-----------------------------*/
insert into MARCA_PRODUCTO values(1,'Colanta');
insert into MARCA_PRODUCTO values(2,'Rama');
insert into MARCA_PRODUCTO values(3,'EL CARIBE');
insert into MARCA_PRODUCTO values(4,'NESCAFE');
insert into MARCA_PRODUCTO values(5,'ABURRA');
insert into MARCA_PRODUCTO values(6,'MAISENA');
insert into MARCA_PRODUCTO values(7,'ROYAL');
insert into MARCA_PRODUCTO values(8,'NACIONAL DE CHOCOLATES');
insert into MARCA_PRODUCTO values(9,'JUANCHO PAN');
insert into MARCA_PRODUCTO values(10,'COLOMBINA');
insert into MARCA_PRODUCTO values(11,'URMET');
insert into MARCA_PRODUCTO values(12,'MAGGI');
insert into MARCA_PRODUCTO values(13,'FRUCO');
insert into MARCA_PRODUCTO values(14,'KLIM');
insert into MARCA_PRODUCTO values(15,'ZENÚ');
/*---------------------------------------------------------------------------*/

/*---------------------------------------------------------------------------------------------- PRODUCTO --------------------------------------------------------------------------------------------------------------------*/
insert into PRODUCTO values(1,null,'Leche pasteurisado de 1 Litro',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\Leche-Colanta-Entera-1000-ml.jpg',2500,2,1,2,1,1,1);
insert into PRODUCTO values(2,null,'MARGARINA RAMA CULINARIA X 125 GRS',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\md-Otros-MARGARINAS-MARG-RAMA_125G-CULINARIA-PLAM-1389.jpg',1550.48,10,2,1,4,1,2);
insert into PRODUCTO values(3,null,'PANELA MOLDE 8UN X 113.5G CARIBE',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\PANELA_X_8_EL_CARIBE-01.jpg',5450.48,45,null,null,null,1,3);
insert into PRODUCTO values(4,null,'NESCAFÉ FRASCO X 50GRS',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\NESCAF__FRASCO_50_GRS',5200,5,1,9,null,1,4);
insert into PRODUCTO values(5,null,'BLANQUILLO ABURRA X 500 GRS',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\BLANQUILLO_ABURRA_500_GRS.jpg',2500,8,1,3,null,1,5);

insert into PRODUCTO values(6,null,'MAIZENA FÉCULA X 720 GRS',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\maizena_fecula_720_grs',15350.48,7,1,3,null,1,6);
insert into PRODUCTO values(7,null,'GELATINA ROYAL FRESA 40 GR INDIV',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\GELATINA_ROYAL_FRESA_40_GR_INDIV',1200,2,1,3,null,1,7);
insert into PRODUCTO values(8,null,'MODIFR. CHOCOLISTO CROCANTE X 500 GRS',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\CHOCOLISTO_CROCANTE_X_500_GRS.jpg',11850.48,8,1,3,null,1,8);
insert into PRODUCTO values(9,null,'TOSTADA INTEGRAL JUANCHOPAN 10UN X 16G',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\TOSTADA_INTEGRAL_JUANCHOPAN_10UN_X_16G.jpg',1950.48,45,1,5,null,1,9);
insert into PRODUCTO values(10,null,'COSECHA PURA NARANJA 330ML',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\COSECHA_PURA_330ML.jpg',1750.48,90,8,13,null,1,10);

insert into PRODUCTO values(11,null,'ACEITE  URMET 1000 CC N.V',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\ACEITE_URMET_1000CC.jpg',13350.48,50,1,3,null,1,11);
insert into PRODUCTO values(12,null,'CREMA MAGGI MARINERA INDIV C24',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\7702024007463-1.jpg',2900,60,1,4,null,1,12);
insert into PRODUCTO values(13,null,'FRUCO SALSA TOM X 400 GRS VIDRIO',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\FRUCO_SALSA_TOMATE_400_GRS_VIDRIO.jpg',6750.48,70,1,4,null,1,13);
insert into PRODUCTO values(14,null,'KLIM 1 MIEL FORTIPROTECT X 1 KL',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\KLIM_1_MIEL_PREBIO_1_KL',31650.47,70,1,1,2,1,14);
insert into PRODUCTO values(15,null,'SALCHI. VIENA ZENÚ PLL. X 150 GRS',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\salchichas-viena-de-pollo_150.png',3400,12,1,4,null,1,15);

insert into PRODUCTO values(16,null,'Leche pasteurisado de 1 Litro',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\Leche-Colanta-Entera-1000-ml.jpg',2500,60,1,2,1,1,1);
insert into PRODUCTO values(17,null,'MARGARINA RAMA CULINARIA X 125 GRS',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\md-Otros-MARGARINAS-MARG-RAMA_125G-CULINARIA-PLAM-1389.jpg',1550.48,40,2,1,4,1,2);
insert into PRODUCTO values(18,null,'PANELA MOLDE 8UN X 113.5G CARIBE',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\PANELA_X_8_EL_CARIBE-01.jpg',5450.48,30,null,null,null,1,3);
insert into PRODUCTO values(19,null,'NESCAFÉ FRASCO X 50GRS',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\NESCAF__FRASCO_50_GRS',5200,45,1,9,null,1,4);
insert into PRODUCTO values(20,null,'BLANQUILLO ABURRA X 500 GRS',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\BLANQUILLO_ABURRA_500_GRS.jpg',2500,36,1,3,null,1,5);

insert into PRODUCTO values(21,null,'MAIZENA FÉCULA X 720 GRS',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\maizena_fecula_720_grs',15350.48,78,1,3,null,1,6);
insert into PRODUCTO values(22,null,'GELATINA ROYAL FRESA 40 GR INDIV',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\GELATINA_ROYAL_FRESA_40_GR_INDIV',1200,90,1,3,null,1,7);
insert into PRODUCTO values(23,null,'MODIFR. CHOCOLISTO CROCANTE X 500 GRS',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\CHOCOLISTO_CROCANTE_X_500_GRS.jpg',11850.48,75,1,3,null,1,8);
insert into PRODUCTO values(24,null,'TOSTADA INTEGRAL JUANCHOPAN 10UN X 16G',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\TOSTADA_INTEGRAL_JUANCHOPAN_10UN_X_16G.jpg',1950.48,45,1,5,null,1,9);
insert into PRODUCTO values(25,null,'COSECHA PURA NARANJA 330ML',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\COSECHA_PURA_330ML.jpg',1750.48,75,8,13,null,1,10);

insert into PRODUCTO values(26,null,'ACEITE  URMET 1000 CC N.V',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\ACEITE_URMET_1000CC.jpg',13350.48,89,1,3,null,1,11);
insert into PRODUCTO values(27,null,'CREMA MAGGI MARINERA INDIV C24',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\7702024007463-1.jpg',2900,15,1,4,null,1,12);
insert into PRODUCTO values(28,null,'FRUCO SALSA TOM X 400 GRS VIDRIO',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\FRUCO_SALSA_TOMATE_400_GRS_VIDRIO.jpg',6750.48,32,1,4,null,1,13);
insert into PRODUCTO values(29,null,'KLIM 1 MIEL FORTIPROTECT X 1 KL',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\KLIM_1_MIEL_PREBIO_1_KL',31650.47,74,1,1,2,1,14);
insert into PRODUCTO values(30,null,'SALCHI. VIENA ZENÚ PLL. X 150 GRS',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\salchichas-viena-de-pollo_150.png',3400,95,1,4,null,1,15);

/*------------------------------------------------------------------------------------------------------------------------------------*/


select * from PRODUCTO;
select * from CATERIA_PRODUCTO;
select * from SUBCATERIAS_PRODUCTO;
select * from SUBCATERIAS_TIPO2_PRODUCTO;
