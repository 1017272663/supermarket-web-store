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
nombre_user varchar (50) NOT null,			-- nombre del Usuario
Apellido_user varchar (50)null,			-- Apellido del Usuario
telefono_user bigint not null,			-- Numero del telefono selular
correo varchar (50) default null,		-- Correo electronico 
contrasenia varchar (150) not null,		-- Contrasenia de la cuenta de usuario
direcion_user varchar (100) not null,	-- Direcion del usuario
ID_rol int not null,					-- rol del usuario(cliente, administrador,vendedor)
primary key (ID_user),
constraint FK_ROL foreign key (ID_rol) references ROL (ID_rol)
);


Create table PRODUCTO(
ID_producto int not null,
codi_barras bigint default null,
nombre_producto varchar (50) not null,
descripcion_producto varchar (200) default null,
Imagen_producto Varchar (250) null,
precio_unitario decimal not null check (precio_unitario >= 1),
cantidad_producto int not null check (cantidad_producto>= 0),
primary key (ID_producto)
);


Create table Compra(
ID_pedido int not null auto_increment,
ID_producto int not null,
ID_user bigInt not null,
total_compra decimal not null,
total_Descuento decimal not null,
cantidad_productos int NOT null,
Fecha_Compra datetime not null,
Hora_compra time not null,
primary key (ID_pedido),
constraint FK_PRODUCTO Foreign key (ID_producto) references PRODUCTO (ID_producto),
constraint FK_USUARIO foreign key (ID_user) references USUARIO(ID_user)
); 


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



/*---------------------------------------------------------------------------------------------- PRODUCTO --------------------------------------------------------------------------------------------------------------------*/
insert into PRODUCTO values(1,null,'Leche pasteurisado de 1 Litro',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\Leche-Colanta-Entera-1000-ml.jpg',2500,2);
insert into PRODUCTO values(2,null,'MARGARINA RAMA CULINARIA X 125 GRS',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\md-Otros-MARGARINAS-MARG-RAMA_125G-CULINARIA-PLAM-1389.jpg',1550.48,10);
insert into PRODUCTO values(3,null,'PANELA MOLDE 8UN X 113.5G CARIBE',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\PANELA_X_8_EL_CARIBE-01.jpg',5450.48,45);
insert into PRODUCTO values(4,null,'NESCAFÉ FRASCO X 50GRS',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\NESCAF__FRASCO_50_GRS',5200,5);
insert into PRODUCTO values(5,null,'BLANQUILLO ABURRA X 500 GRS',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\BLANQUILLO_ABURRA_500_GRS.jpg',2500,8);

insert into PRODUCTO values(6,null,'MAIZENA FÉCULA X 720 GRS',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\maizena_fecula_720_grs',15350.48,7);
insert into PRODUCTO values(7,null,'GELATINA ROYAL FRESA 40 GR INDIV',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\GELATINA_ROYAL_FRESA_40_GR_INDIV',1200,2);
insert into PRODUCTO values(8,null,'MODIFR. CHOCOLISTO CROCANTE X 500 GRS',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\CHOCOLISTO_CROCANTE_X_500_GRS.jpg',11850.48,8);
insert into PRODUCTO values(9,null,'TOSTADA INTEGRAL JUANCHOPAN 10UN X 16G',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\TOSTADA_INTEGRAL_JUANCHOPAN_10UN_X_16G.jpg',1950.48,45);
insert into PRODUCTO values(10,null,'COSECHA PURA NARANJA 330ML',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\COSECHA_PURA_330ML.jpg',1750.48,90);

insert into PRODUCTO values(11,null,'ACEITE  URMET 1000 CC N.V',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\ACEITE_URMET_1000CC.jpg',13350.48,50);
insert into PRODUCTO values(12,null,'CREMA MAGGI MARINERA INDIV C24',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\7702024007463-1.jpg',2900,60);
insert into PRODUCTO values(13,null,'FRUCO SALSA TOM X 400 GRS VIDRIO',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\FRUCO_SALSA_TOMATE_400_GRS_VIDRIO.jpg',6750.48,70);
insert into PRODUCTO values(14,null,'KLIM 1 MIEL FORTIPROTECT X 1 KL',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\KLIM_1_MIEL_PREBIO_1_KL',31650.47,70);
insert into PRODUCTO values(15,null,'SALCHI. VIENA ZENÚ PLL. X 150 GRS',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\salchichas-viena-de-pollo_150.png',3400,12);

insert into PRODUCTO values(16,null,'Leche pasteurisado de 1 Litro',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\Leche-Colanta-Entera-1000-ml.jpg',2500,60);
insert into PRODUCTO values(17,null,'MARGARINA RAMA CULINARIA X 125 GRS',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\md-Otros-MARGARINAS-MARG-RAMA_125G-CULINARIA-PLAM-1389.jpg',1550.48,40);
insert into PRODUCTO values(18,null,'PANELA MOLDE 8UN X 113.5G CARIBE',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\PANELA_X_8_EL_CARIBE-01.jpg',5450.48,30);
insert into PRODUCTO values(19,null,'NESCAFÉ FRASCO X 50GRS',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\NESCAF__FRASCO_50_GRS',5200,45);
insert into PRODUCTO values(20,null,'BLANQUILLO ABURRA X 500 GRS',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\BLANQUILLO_ABURRA_500_GRS.jpg',2500,36);

insert into PRODUCTO values(21,null,'MAIZENA FÉCULA X 720 GRS',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\maizena_fecula_720_grs',15350.48,78);
insert into PRODUCTO values(22,null,'GELATINA ROYAL FRESA 40 GR INDIV',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\GELATINA_ROYAL_FRESA_40_GR_INDIV',1200,90);
insert into PRODUCTO values(23,null,'MODIFR. CHOCOLISTO CROCANTE X 500 GRS',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\CHOCOLISTO_CROCANTE_X_500_GRS.jpg',11850.48,75);
insert into PRODUCTO values(24,null,'TOSTADA INTEGRAL JUANCHOPAN 10UN X 16G',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\TOSTADA_INTEGRAL_JUANCHOPAN_10UN_X_16G.jpg',1950.48,45);
insert into PRODUCTO values(25,null,'COSECHA PURA NARANJA 330ML',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\COSECHA_PURA_330ML.jpg',1750.48,75);

insert into PRODUCTO values(26,null,'ACEITE  URMET 1000 CC N.V',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\ACEITE_URMET_1000CC.jpg',13350.48,89);
insert into PRODUCTO values(27,null,'CREMA MAGGI MARINERA INDIV C24',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\7702024007463-1.jpg',2900,15);
insert into PRODUCTO values(28,null,'FRUCO SALSA TOM X 400 GRS VIDRIO',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\FRUCO_SALSA_TOMATE_400_GRS_VIDRIO.jpg',6750.48,32);
insert into PRODUCTO values(29,null,'KLIM 1 MIEL FORTIPROTECT X 1 KL',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\KLIM_1_MIEL_PREBIO_1_KL',31650.47,74);
insert into PRODUCTO values(30,null,'SALCHI. VIENA ZENÙ PLL. X 150 GRS',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\salchichas-viena-de-pollo_150.png',3400,95);

/*------------------------------------------------------------------------------------------------------------------------------------*/

select * from PRODUCTO;
select * from ROL;
select * from USUARIO;
select * from COMPRA;



