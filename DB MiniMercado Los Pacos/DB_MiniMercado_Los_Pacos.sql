create database DB_MiniMercado_los_Pacos
go
use DB_MiniMercado_los_Pacos
go
Create table ROL(
ID_rol int not null,
nombre_rol varchar(50) not null,
Primary key (ID_rol)
)
go
insert into ROL values(1,'Cliente')
insert into ROL values(2,'Vendedor')
insert into ROL values(3,'Administrador')
go
Create table USUARIO(
ID_user bigint not null,				--tarjeta de indentidad(Cedula de Ciudadania) 
nombre_user varchar (50) null,			--nombre del Usuario
Apellido_user varchar (50)null,			--Apellido del Usuario
telefono_user bigint not null,			--Numero del telefono selular
correo varchar (50) default null,		--Correo electronico 
contraseña varchar (max) not null,		--Contraseña de la cuenta de usuario
direcion_user varchar (100) not null,	--Direción del usuario
ID_rol int not null,					-- rol del usuario(cliente, administrador,vendedor)
primary key (ID_user),
foreign key (ID_rol) references ROL (ID_rol)
)
go
insert into USUARIO values(1,'sabina','Gonzales',3215801010,'sabina@gmail.com','123','calle 1 carrera 1',1) 
insert into USUARIO values(2,'salme','herrera',3215801011,null,'123','calle 2 carreara 5',1)
insert into USUARIO values(3,'salomon','almeida',3215801012,'salomo746@gmail.com','123','calle 3 carrera 9',1)
insert into USUARIO values(4,'samantha','sanchez',3215801013,null,'123','calle 3 carrera 9',1)
insert into USUARIO values(5,'samuel','garzon',3215801014,'samuelsalud158@saludpet.gov.co','123','calle 5 carrera 8',1)
insert into USUARIO values(6,'sara','alvarez',3215801015,'sara243@hotmai.com','123','calle 8 carrera 1',1)
insert into USUARIO values(7,'napoleon','piedrahita',3215801016,null,'123','calle 9 carrera 9',1)
insert into USUARIO values(8,'john','Gonzales',3215801017,'LaParka@quenotepille.ric.co','123','calle 20 carrera 45',1)
insert into USUARIO values(9,'pedro','Guzman',3215801018,'pedro.adasd@hotmai.com','123','calle 21 carrera 69',1)
insert into USUARIO values(10,'alicia','montreal',3215801019,null,'123','calle 22 carrera 98',2)
insert into USUARIO values(11,'carla','jaramillo',3215801020,null,'123','calle 23 carrera 63',2)
insert into USUARIO values(12,'jesus','alcasares',3215801021,'jesus@teama.edu.co','123','calle 29 carrera 64',2)
insert into USUARIO values(13,'juan','Alvarez',3215801022,null,'123','calle 30 carrera 11',2)
insert into USUARIO values(14,'sara','gonzales',3215801023,'sara243@hotmai.com','123','calle 8 carrera 1',3)
insert into USUARIO values(15,'juan','piedrahita',3215801024,'juanadminitrador@gmail.com','123','calle 32 carrera 12',3)


go

Create table MEDIO_PAGO(
ID_medio_pago int not null,
nombre_medio_pago varchar (50)not null,
primary key (ID_medio_pago)
)
go
insert into MEDIO_PAGO values(1,'Tarjeta Credito')
insert into MEDIO_PAGO values(2,'Tarjeta Debito')
insert into MEDIO_PAGO values(3,'Cheque')
insert into MEDIO_PAGO values(4,'Efectivo')
insert into MEDIO_PAGO values(5,'Bonos')
insert into MEDIO_PAGO values(6,'Tarjeta Regalo')
insert into MEDIO_PAGO values(7,'Combenio')
go


Create table CLIENTE_MEDIO_PAGO(
ID_cliente_medio_pago  int identity(1,1),
ID_user bigint not null,
ID_medio_pago int not null,
numero bigint null,					--Número de la tajeta de credito, debito o infromacion del medio de pago
Primary key (ID_cliente_medio_pago),
foreign key (ID_user) references USUARIO(ID_user),
foreign key (ID_medio_pago) references MEDIO_PAGO(ID_medio_pago)
)
go
insert into CLIENTE_MEDIO_PAGO values (1,1,1234567890000000) 
insert into CLIENTE_MEDIO_PAGO values(1,1,1234567890000000) 
insert into CLIENTE_MEDIO_PAGO values(2,1,1234567890000001)
insert into CLIENTE_MEDIO_PAGO values(3,1,1234567890000002)
insert into CLIENTE_MEDIO_PAGO values(4,1,1234567890000003)
insert into CLIENTE_MEDIO_PAGO values(5,1,1234567890000004)
insert into CLIENTE_MEDIO_PAGO values(6,2,1234567890000005)
insert into CLIENTE_MEDIO_PAGO values(7,2,1234567890000006)
insert into CLIENTE_MEDIO_PAGO values(8,4,null)
insert into CLIENTE_MEDIO_PAGO values(9,6,1234567890000008)
go


Create table CATEGORIA_PRODUCTO(
ID_categoria_producto int identity(1,1),
nombre_categria_producto varchar (50) not null,
primary key (ID_categoria_producto)
)
go
insert into CATEGORIA_PRODUCTO values('Alimentos')
insert into CATEGORIA_PRODUCTO values('Refigerados')
insert into CATEGORIA_PRODUCTO values('Fruber')
insert into CATEGORIA_PRODUCTO values('Aseo Personal y del Hogar')
insert into CATEGORIA_PRODUCTO values('Bebés')
insert into CATEGORIA_PRODUCTO values('Mascotas')
insert into CATEGORIA_PRODUCTO values('Licoreria y Cigarrillos')
insert into CATEGORIA_PRODUCTO values('Refrescos')
insert into CATEGORIA_PRODUCTO values('Pasabocas')
insert into CATEGORIA_PRODUCTO values('Dulseria')
insert into CATEGORIA_PRODUCTO values('Medicamentos')
go
Create table SUBCATEGORIAS_PRODUCTO(
ID_subcategoria_producto int identity(1,1),
ID_categoria_producto int not null,
nombre_categria_producto varchar (50) not null,
primary key (ID_subcategoria_producto),
foreign key (ID_categoria_producto) references CATEGORIA_PRODUCTO(ID_categoria_producto)
)
go
insert into SUBCATEGORIAS_PRODUCTO values(2,'Lácteos')
insert into SUBCATEGORIAS_PRODUCTO values(1,'huevos')
insert into SUBCATEGORIAS_PRODUCTO values(1,'Abarrotes')
insert into SUBCATEGORIAS_PRODUCTO values(1,'Despensa')
insert into SUBCATEGORIAS_PRODUCTO values(1,'Panadería Y Arepas')
insert into SUBCATEGORIAS_PRODUCTO values(4,'Aseo Hogar')
insert into SUBCATEGORIAS_PRODUCTO values(4,'Cuidado de la Ropa')
insert into SUBCATEGORIAS_PRODUCTO values(4,'Cuidado Personal')
insert into SUBCATEGORIAS_PRODUCTO values(1,'Café, Chocolate Y Te')
insert into SUBCATEGORIAS_PRODUCTO values(10,'Galletas Y Dulces')
insert into SUBCATEGORIAS_PRODUCTO values(2,'Pollo, carne, pescado y embutios')
insert into SUBCATEGORIAS_PRODUCTO values(1,'Saludables')
insert into SUBCATEGORIAS_PRODUCTO values(8,'Bebidas')
insert into SUBCATEGORIAS_PRODUCTO values(7,'Cervezas')
insert into SUBCATEGORIAS_PRODUCTO values(7,'Vinos')
insert into SUBCATEGORIAS_PRODUCTO values(7,'Licores')
insert into SUBCATEGORIAS_PRODUCTO values(2,'Congelados')
insert into SUBCATEGORIAS_PRODUCTO values(5,'Bebés')
insert into SUBCATEGORIAS_PRODUCTO values(3,'Frutas y Verduras')
insert into SUBCATEGORIAS_PRODUCTO values(9,'Pasabocas')
insert into SUBCATEGORIAS_PRODUCTO values(6,'Mascotas')
insert into SUBCATEGORIAS_PRODUCTO values(11,'Medicamentos')
go

Create table SUBCATEGORIAS_TIPO2_PRODUCTO(
ID_subcategoria_tipo2_producto int identity(1,1),
ID_subcategoria_producto int not null,
nombre_categria_producto varchar (50) not null,
primary key (ID_subcategoria_tipo2_producto),
foreign key (ID_subcategoria_producto) references SUBCATEGORIAS_PRODUCTO(ID_subcategoria_producto)
)
go
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(1,'Leches')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(1,'Leches Saborizadas')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(1,'Quesos')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(1,'Mantequillas')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(1,'Leche en Polvo')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(1,'Lácteos Refrescantes')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(1,'Yogurt')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(1,'Kumis')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(1,'Avenas')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(1,'Lácteos con Adicionales')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(1,'Lácteos Saludables')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(1,'Yogurt Griego')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(1,'Prostres Refrigerados')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(1,'Cremas')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(1,'Bebidas Vegetales')

insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(2,'Huevos')

insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(3,'Arroz')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(3,'Aceites')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(3,'Azúcar Y Endulzantes')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(3,'Sal')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(3,'Granos')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(3,'Pastas')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(3,'Harinas Y Mezclas Listas')


insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(4,'Enlatados y Conservas')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(4,'Cerelales')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(4,'Barra de Cereal')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(4,'Granolas Y Avenas')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(4,'Salsas y Vinagre')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(4,'Condimentos, Especias y Adobos')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(4,'Caldos,Sopas y Cremas')

insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(5,'Arepas')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(5,'Panes')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(5,'Tostadas y Hojaldres')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(5,'Panes Congelados')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(5,'Muffins Y Waffles')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(5,'Tortillas')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(5,'Tortas Y Ponqués')

insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(6,'Baño')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(6,'Desinfección')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(6,'Lavaloza Y Quitagrasa')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(6,'Ambientadores')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(6,'Toallas de cocina,Servilletas y paños')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(6,'Implementos de Limpieza')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(6,'Limpia Pisos')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(6,'Limpieza de Superficies y Ceras')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(6,'Blanqueadores')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(6,'Insecticidas')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(6,'Bolsas')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(6,'Desechables y Miscelanea')

insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(7,'Detergente Líquido')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(7,'Detergente en Polvo')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(7,'Suavizantes')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(7,'Desmanchadores')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(7,'Jabón en Barra')

insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(8,'Cuidado bucal')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(8,'Shampoo')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(8,'Acondicionadores')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(8,'Cremas para Peinar')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(8,'Tratamiento y Gel para el cabello')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(8,'Jabón')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(8,'Desodorantes')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(8,'Cremas Corporales')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(8,'Talcos y Copitos')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(8,'Afitadoras y Depilacion')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(8,'Cuidado Facial')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(8,'Cuidado íntimo')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(8,'Proteccíon Solar y Repelente')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(8,'Coloración')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(8,'Maquillaje y Uñas')

insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(9,'Chocolate de Mesa')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(9,'Café Molido')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(9,'Café Soluble')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(9,'Café en Grano')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(9,'Cápsulas de Café')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(9,'Complementos de Café')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(9,'Aromáticas')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(9,'Infusiones')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(9,'Te')

insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(10,'Galletas Dulces')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(10,'Galletas Saladas')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(10,'Chocolates')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(10,'Productos Esparcibles')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(10,'Dulces')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(10,'Chicles y Mentas')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(10,'Gomitas y Masmelos')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(10,'Dulces Tradicionales')

insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(11,'Pollo')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(11,'Pescado')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(11,'Mariscos')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(11,'Salchicas')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(11,'Jamón y Mortadela')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(11,'Embutidos')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(11,'Hamburguesas')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(11,'Carnes y Congelados')

insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(12,'Lácteos y Derivados')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(12,'Despensa')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(12,'Snacks')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(12,'Antojos')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(12,'Pamadería y Arepas')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(12,'Bebidas')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(12,'Endulzantes')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(12,'Orgánicos')

insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(13,'Aguas')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(13,'Aguas Saborizadas')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(13,'Gaseosas')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(13,'Jugos y Néctares')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(13,'Maltas')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(13,'Modificadores de Leche')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(13,'Bebias en polvo')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(13,'Hidratantes')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(13,'Complementos Nutricionales')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(13,'Té Liquido')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(13,'Energizantes')

insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(14,'Cervezas')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(14,'Cervezas Artesanales')

insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(15,'Vinos Chilenos')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(15,'Vinos Argentinos')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(15,'Vinos')

insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(16,'Aguardiente')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(16,'Whisky')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(16,'Ron')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(16,'Vodka')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(16,'Ginebra')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(16,'Tequila')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(16,'Otors Licores')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(16,'Tónicas')

insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(17,'Apanados')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(17,'Comidas Listas Y Snacks')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(17,'Fruta Congelada')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(17,'Panes Congelados')

insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(18,'Alimento para Bebé')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(18,'Fórmulas Infantiles')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(18,'Hora del Baño')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(18,'Humectacón y Colonias')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(18,'Pañales')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(18,'Pañitos y Cremas Antipañalitis')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(18,'Maternidad')

insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(19,'Frutas')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(19,'Verduras')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(19,'Papa')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(19,'Desgranados')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(19,'Orgánicos')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(19,'Hierbas y Especias')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(19,'fruta y Verdura Congelada')

insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(20,'Papas')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(20,'Mixtos')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(20,'Snacks')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(20,'Tortillas de Maíz')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(20,'Platanitos')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(20,'Crispetas')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(20,'Maní, Nueces y Snacks')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(20,'Frutos Secos y Deshidratados')

insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(21,'Arena para Gatos')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(21,'Concentrado Perros')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(21,'Concentrado Gatos')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(21,'Alimento Húmedo Perros')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(21,'Alimento Húmedo Gatos')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(21,'Higiene de la Mascota')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(21,'Snacks y Juguetes')

insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(22,'Alivio del Dolor')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(22,'Gripa y Tos')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(22,'Salud Digestiva')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(22,'Fórmulas Infantiles')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(22,'Vitaminas y Alimentos Funcionales')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(22,'Cuidado del Adulto')
insert into SUBCATEGORIAS_TIPO2_PRODUCTO values(22,'Complementos Nutricionales')


go
Create table ESTADO_PRODUCTO(
ID_estado_producto  int identity(1,1),
estado_producto varchar (50) default null,
primary key (ID_estado_producto)
)
go
insert into ESTADO_PRODUCTO values('Normal')
insert into ESTADO_PRODUCTO values('Agotado')
insert into ESTADO_PRODUCTO values('Promocion')
insert into ESTADO_PRODUCTO values('Descuneto')
go
Create table MARCA_PRODUCTO(
ID_marca_producto int not null,
nombre_marcaProducto varchar (max) not null,
primary key (ID_marca_producto)
)
go
insert into MARCA_PRODUCTO values(1,'Colanta')
insert into MARCA_PRODUCTO values(2,'Rama')
insert into MARCA_PRODUCTO values(3,'EL CARIBE')
insert into MARCA_PRODUCTO values(4,'NESCAFE')
insert into MARCA_PRODUCTO values(5,'ABURRA')
insert into MARCA_PRODUCTO values(6,'MAISENA')
insert into MARCA_PRODUCTO values(7,'ROYAL')
insert into MARCA_PRODUCTO values(8,'NACIONAL DE CHOCOLATES')
insert into MARCA_PRODUCTO values(9,'JUANCHO PAN')
insert into MARCA_PRODUCTO values(10,'COLOMBINA')
insert into MARCA_PRODUCTO values(11,'GOURMET')
insert into MARCA_PRODUCTO values(12,'MAGGI')
insert into MARCA_PRODUCTO values(13,'FRUCO')
insert into MARCA_PRODUCTO values(14,'KLIM')
insert into MARCA_PRODUCTO values(15,'ZENÚ')
go

Create table PRODUCTO(
ID_producto int not null,
codigo_barras bigint default null,
nombre_producto varchar (50) not null,
descripcion_producto varchar (200) default null,
Imagen_producto Varchar (max) null,
precio_unitario decimal not null,
cantidad_producto int not null,
ID_categoria_producto int null,
ID_subCategoriaProducto int null,
ID_subcategoria_tipo2_producto int null,
ID_estado_producto int default null,
ID_marca_producto int default null,
primary key (ID_producto),
foreign key (ID_categoria_producto) references CATEGORIA_PRODUCTO(ID_categoria_producto),
foreign key (ID_subCategoriaProducto) references SUBCATEGORIAS_PRODUCTO (ID_subcategoria_producto),
foreign key (ID_subcategoria_tipo2_producto) references SUBCATEGORIAS_TIPO2_PRODUCTO(ID_subcategoria_tipo2_producto),
foreign key (ID_estado_producto) references ESTADO_PRODUCTO (ID_estado_producto),
foreign key (ID_marca_producto) references MARCA_PRODUCTO (ID_marca_producto)
)

go
insert into PRODUCTO values(1,null,'Leche pasteurisado de 1 Litro',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\Leche-Colanta-Entera-1000-ml.jpg',2500,2,1,2,1,1,1)
insert into PRODUCTO values(2,null,'MARGARINA RAMA CULINARIA X 125 GRS',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\md-Otros-MARGARINAS-MARG-RAMA_125G-CULINARIA-PLAM-1389.jpg',1550.48,10,2,1,4,1,2)
insert into PRODUCTO values(3,null,'PANELA MOLDE 8UN X 113.5G CARIBE',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\PANELA_X_8_EL_CARIBE-01.jpg',5450.48,45,null,null,null,1,3)
insert into PRODUCTO values(4,null,'NESCAFÉ FRASCO X 50GRS',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\NESCAF__FRASCO_50_GRS',5200,5,1,9,null,1,4)
insert into PRODUCTO values(5,null,'BLANQUILLO ABURRA X 500 GRS',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\BLANQUILLO_ABURRA_500_GRS.jpg',2500,8,1,3,null,1,5)

insert into PRODUCTO values(6,null,'MAIZENA FÉCULA X 720 GRS',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\maizena_fecula_720_grs',15350.48,7,1,3,null,1,6)
insert into PRODUCTO values(7,null,'GELATINA ROYAL FRESA 40 GR INDIV',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\GELATINA_ROYAL_FRESA_40_GR_INDIV',1200,2,1,3,null,1,7)
insert into PRODUCTO values(8,null,'MODIFR. CHOCOLISTO CROCANTE X 500 GRS',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\CHOCOLISTO_CROCANTE_X_500_GRS.jpg',11850.48,8,1,3,null,1,8)
insert into PRODUCTO values(9,null,'TOSTADA INTEGRAL JUANCHOPAN 10UN X 16G',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\TOSTADA_INTEGRAL_JUANCHOPAN_10UN_X_16G.jpg',1950.48,45,1,5,null,1,9)
insert into PRODUCTO values(10,null,'COSECHA PURA NARANJA 330ML',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\COSECHA_PURA_330ML.jpg',1750.48,90,8,13,null,1,10)

insert into PRODUCTO values(11,null,'ACEITE  GOURMET 1000 CC N.V',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\ACEITE_GOURMET_1000CC.jpg',13350.48,50,1,3,null,1,11)
insert into PRODUCTO values(12,null,'CREMA MAGGI MARINERA INDIV C24',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\7702024007463-1.jpg',2900,60,1,4,null,1,12)
insert into PRODUCTO values(13,null,'FRUCO SALSA TOM X 400 GRS VIDRIO',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\FRUCO_SALSA_TOMATE_400_GRS_VIDRIO.jpg',6750.48,70,1,4,null,1,13)
insert into PRODUCTO values(14,null,'KLIM 1 MIEL FORTIPROTECT X 1 KL',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\KLIM_1_MIEL_PREBIO_1_KL',31650.47,70,1,1,2,1,14)
insert into PRODUCTO values(15,null,'SALCHI. VIENA ZENÚ PLL. X 150 GRS',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\salchichas-viena-de-pollo_150.png',3400,12,1,4,null,1,15)


insert into PRODUCTO values(16,null,'Leche pasteurisado de 1 Litro',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\Leche-Colanta-Entera-1000-ml.jpg',2500,60,1,2,1,1,1)
insert into PRODUCTO values(17,null,'MARGARINA RAMA CULINARIA X 125 GRS',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\md-Otros-MARGARINAS-MARG-RAMA_125G-CULINARIA-PLAM-1389.jpg',1550.48,40,2,1,4,1,2)
insert into PRODUCTO values(18,null,'PANELA MOLDE 8UN X 113.5G CARIBE',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\PANELA_X_8_EL_CARIBE-01.jpg',5450.48,30,null,null,null,1,3)
insert into PRODUCTO values(19,null,'NESCAFÉ FRASCO X 50GRS',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\NESCAF__FRASCO_50_GRS',5200,45,1,9,null,1,4)
insert into PRODUCTO values(20,null,'BLANQUILLO ABURRA X 500 GRS',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\BLANQUILLO_ABURRA_500_GRS.jpg',2500,36,1,3,null,1,5)

insert into PRODUCTO values(21,null,'MAIZENA FÉCULA X 720 GRS',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\maizena_fecula_720_grs',15350.48,78,1,3,null,1,6)
insert into PRODUCTO values(22,null,'GELATINA ROYAL FRESA 40 GR INDIV',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\GELATINA_ROYAL_FRESA_40_GR_INDIV',1200,90,1,3,null,1,7)
insert into PRODUCTO values(23,null,'MODIFR. CHOCOLISTO CROCANTE X 500 GRS',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\CHOCOLISTO_CROCANTE_X_500_GRS.jpg',11850.48,75,1,3,null,1,8)
insert into PRODUCTO values(24,null,'TOSTADA INTEGRAL JUANCHOPAN 10UN X 16G',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\TOSTADA_INTEGRAL_JUANCHOPAN_10UN_X_16G.jpg',1950.48,45,1,5,null,1,9)
insert into PRODUCTO values(25,null,'COSECHA PURA NARANJA 330ML',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\COSECHA_PURA_330ML.jpg',1750.48,75,8,13,null,1,10)

insert into PRODUCTO values(26,null,'ACEITE  GOURMET 1000 CC N.V',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\ACEITE_GOURMET_1000CC.jpg',13350.48,89,1,3,null,1,11)
insert into PRODUCTO values(27,null,'CREMA MAGGI MARINERA INDIV C24',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\7702024007463-1.jpg',2900,15,1,4,null,1,12)
insert into PRODUCTO values(28,null,'FRUCO SALSA TOM X 400 GRS VIDRIO',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\FRUCO_SALSA_TOMATE_400_GRS_VIDRIO.jpg',6750.48,32,1,4,null,1,13)
insert into PRODUCTO values(29,null,'KLIM 1 MIEL FORTIPROTECT X 1 KL',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\KLIM_1_MIEL_PREBIO_1_KL',31650.47,74,1,1,2,1,14)
insert into PRODUCTO values(30,null,'SALCHI. VIENA ZENÚ PLL. X 150 GRS',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\salchichas-viena-de-pollo_150.png',3400,95,1,4,null,1,15)



go
Create table PEDIDO(
ID_pedido int identity(1,1),
ID_producto int not null,
ID_cliente_medio_pago int not null,
total_pedido decimal not null,
total_Descuento decimal not null,
cantidad_productos int null,
primary key (ID_pedido),
Foreign key (ID_producto) references PRODUCTO (ID_producto)
) 


go
Create table VENTA (
ID_venta int identity(1,1),
ID_pedido int not null,
total_venta decimal not null,
Fecha_Venta datetime default getdate() null,
check (Fecha_Venta >= '02/09/2020' ),
Hora_Venta  Time default getdate() null,
ID_cliente_medio_pago int not null,-- nos dise la cantidad de productos de un mismo tipo o ID que el cliente desea comprar
Primary key (ID_venta),
foreign key (ID_pedido) references PEDIDO(ID_pedido),
foreign key (ID_cliente_medio_pago) references CLIENTE_MEDIO_PAGO(ID_cliente_medio_pago)
)
go


/**TRIGGER**/
--nos permite que cuando se realisa un peido se deve descontar la cantidad de productos a
go
create trigger TR_PEDIDO
on PEDIDO
for insert
as
update PRODUCTO
set cantidad_producto =cantidad_producto - inserted.cantidad_productos
from PRODUCTO inner join inserted on PRODUCTO.ID_producto=inserted.ID_pedido
go

--Vista que Muestre el Total de Ventas en un Dia
CREATE VIEW VW_TOTAL_VENTAS_DIA
as
SELECT sum(total_venta) as Total_Ventas_Del_Dia FROM VENTA
WHERE Fecha_Venta = GETDATE()
go
--Vista que sive para saver el total de Ventas en el mes al dia actual
CREATE VIEW VW_TOTAL_VENTAS_MES
as
SELECT sum(total_venta) as Total_Ventas_Del_Mes FROM VENTA
where  month(Fecha_venta)=GETDATE()
go
--Vista que sive para saver el total de Ventas en el Año al dia actual
CREATE VIEW VW_TOTAL_VENTAS_ANIO
as
SELECT sum(total_venta) as Total_Ventas_Del_AÑO  FROM VENTA
where  year(Fecha_venta)=GETDATE()
go
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
/*se llama la funcion*/
go
select dbo.fnTOTAL_VENTAS_DIA_ESPECIFICO(10) as TotalDia
go


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
/*se llama la funcion*/
go
select dbo.fnTOTAL_VENTAS_MES_ESPECIFICO(10) as TotalMes

go
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
/*se llama la funcion*/
go
select dbo.fnTOTAL_VENTAS_anio_ESPECIFICO(2020) as TotalAnio




go
select * from PRODUCTO
select * from CATEGORIA_PRODUCTO
select * from SUBCATEGORIAS_PRODUCTO
select * from SUBCATEGORIAS_TIPO2_PRODUCTO