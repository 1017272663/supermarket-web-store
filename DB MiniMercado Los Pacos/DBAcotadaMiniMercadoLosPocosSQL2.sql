create database DB_MiniMercado_los_Pacos;


use DB_MiniMercado_los_Pacos;


/*---------------------------------------------------------  TABLAS  ---------------------------------------------------------------*/
Create table rol(
rol_id int not null,
nombre_rol varchar(50) not null,
constraint rol_pk primary key (rol_id)
);


Create table usuario(
user_id bigint not null,				-- tarjeta de indentidad(Cedula de Ciudadania) 
nombre_user varchar (50) NOT null,	    -- nombre del usuario
apellido_user varchar (50)null,			-- Apellido del usuario
telefono_user bigint not null,			-- Numero del telefono selular
correo varchar (50)  not null,	    	-- Correo electronico 
contrasenia varchar (150) not null,		-- Contrasenia de la cuenta de usuario
direcion_user varchar (100) not null,	-- Direcion del usuario
rol_id int not null,					-- rol del usuario(cliente, administrador,vendedor)
constraint usuario_pk primary key (user_id),
constraint rol_fk foreign key (rol_id) references rol (rol_id)
);


Create table producto(
producto_id int not null,
codigo_barras bigint default null,
nombre_producto varchar (50) not null,
descripcion_producto varchar (200) default null,
imagen_producto Varchar (250) null,
precio_unitario decimal not null check (precio_unitario >= 1),
cantidad_producto int not null check (cantidad_producto>= 0),
constraint producto_pk primary key (producto_id)
);

Create table compra(
pedido_id int not null auto_increment,
total_compra decimal not null,
total_descuento decimal not null,
cantidad_productos decimal NOT null,
fecha_compra datetime not null,
hora_compra time not null,
producto_id int not null,
user_id bigInt not null,
constraint pedido_pk primary key (pedido_id),
constraint producto_fk Foreign key (producto_id) references producto (producto_id),
constraint  usuario_FK foreign key (user_id) references usuario(user_id)
); 


/*///////////////////////////////////////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\*/
/*//////////////////////////////////////////////////////      INSERCIÃ“N    \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\*/
/*//////////////////////////////////////////////////////         DE        \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\*/
/*//////////////////////////////////////////////////////      VALORES      \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\*/
/*///////////////////////////////////////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\*/


/* --------------------------Rol------------------------------- */
insert into rol values(1,'Cliente');
insert into rol values(2,'Vendedor');
insert into rol values(3,'Administrador');
/* ------------------------------------------------------------- */

/* ---------------------------------------------- usuario ------------------------------------------------*/
insert into usuario values(1,'sabina','gonzales',3215801010,'sabina@gmail.com','123','calle 1 carrera 1',1); 
insert into usuario values(2,'salme','herrera',3215801011,'salomo726@gmail.com','123','calle 2 carreara 5',1);
insert into usuario values(3,'salomon','almeida',3215801012,'salomo716@gmail.com','123','calle 3 carrera 9',1);
insert into usuario values(4,'samantha','sanchez',3215801013,'salomo746@gmail.com','123','calle 3 carrera 9',1);
insert into usuario values(5,'samuel','garzon',3215801014,'samuelsalud158@saludpet.v.co','123','calle 5 carrera 8',1);
insert into usuario values(6,'sara','alvarez',3215801015,'sara243@hotmai.com','123','calle 8 carrera 1',1);
insert into usuario values(7,'napoleon','piedrahita',3215801016,'salomo748@gmail.com','123','calle 9 carrera 9',1);
insert into usuario values(8,'john','nzales',3215801017,'LaParka@quenotepille.ric.co','123','calle 20 carrera 45',1);
insert into usuario values(9,'pedro','Guzman',3215801018,'pedro.adasd@hotmai.com','123','calle 21 carrera 69',1);
insert into usuario values(10,'alicia','montreal',3215801019,'salomo746@gmail.com','123','calle 22 carrera 98',2);
insert into usuario values(11,'carla','jaramillo',3215801020,'salomo946@gmail.com','123','calle 23 carrera 63',2);
insert into usuario values(12,'jesus','alcasares',3215801021,'jesus@teama.edu.co','123','calle 29 carrera 64',2);
insert into usuario values(13,'juan','Alvarez',3215801022,'salomo746@gmail.com','123','calle 30 carrera 11',2);
insert into usuario values(14,'sara','nzales',3215801023,'sara243@hotmai.com','123','calle 8 carrera 1',3);
insert into usuario values(15,'juan','piedrahita',3215801024,'juanadminitrador@gmail.com','123','calle 32 carrera 12',3);
/* ------------------------------------------------------------------------------------------------------------------------*/



/*---------------------------------------------------------------------------------------------- producto --------------------------------------------------------------------------------------------------------------------*/
insert into producto values(1,null,'Leche pasteurisado de 1 Litro',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\Leche-Colanta-Entera-1000-ml.jpg',2500,2);
insert into producto values(2,null,'MARGARINA RAMA CULINARIA X 125 GRS',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\md-Otros-MARGARINAS-MARG-RAMA_125G-CULINARIA-PLAM-1389.jpg',1550.48,10);
insert into producto values(3,null,'PANELA MOLDE 8UN X 113.5G CARIBE',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\PANELA_X_8_EL_CARIBE-01.jpg',5450.48,45);
insert into producto values(4,null,'NESCAFÉ FRASCO X 50GRS',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\NESCAF__FRASCO_50_GRS',5200,5);
insert into producto values(5,null,'BLANQUILLO ABURRA X 500 GRS',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\BLANQUILLO_ABURRA_500_GRS.jpg',2500,8);

insert into producto values(6,null,'MAIZENA FÉCULA X 720 GRS',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\maizena_fecula_720_grs',15350.48,7);
insert into producto values(7,null,'GELATINA ROYAL FRESA 40 GR INDIV',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\GELATINA_ROYAL_FRESA_40_GR_INDIV',1200,2);
insert into producto values(8,null,'MODIFR. CHOCOLISTO CROCANTE X 500 GRS',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\CHOCOLISTO_CROCANTE_X_500_GRS.jpg',11850.48,8);
insert into producto values(9,null,'TOSTADA INTEGRAL JUANCHOPAN 10UN X 16G',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\TOSTADA_INTEGRAL_JUANCHOPAN_10UN_X_16G.jpg',1950.48,45);
insert into producto values(10,null,'COSECHA PURA NARANJA 330ML',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\COSECHA_PURA_330ML.jpg',1750.48,90);

insert into producto values(11,null,'ACEITE  GURMET 1000 CC N.V',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\ACEITE_URMET_1000CC.jpg',13350.48,50);
insert into producto values(12,null,'CREMA MAGGI MARINERA INDIV C24',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\7702024007463-1.jpg',2900,60);
insert into producto values(13,null,'FRUCO SALSA TOM X 400 GRS VIDRIO',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\FRUCO_SALSA_TOMATE_400_GRS_VIDRIO.jpg',6750.48,70);
insert into producto values(14,null,'KLIM 1 MIEL FORTIPROTECT X 1 KL',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\KLIM_1_MIEL_PREBIO_1_KL',31650.47,70);
insert into producto values(15,null,'SALCHICHAS VIENA ZENÚ PLL. X 150 GRS',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\salchichas-viena-de-pollo_150.png',3400,12);

insert into producto values(16,null,'Leche pasteurisado de 1 Litro',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\Leche-Colanta-Entera-1000-ml.jpg',2500,60);
insert into producto values(17,null,'MARGARINA RAMA CULINARIA X 125 GRS',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\md-Otros-MARGARINAS-MARG-RAMA_125G-CULINARIA-PLAM-1389.jpg',1550.48,40);
insert into producto values(18,null,'PANELA MOLDE 8UN X 113.5G CARIBE',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\PANELA_X_8_EL_CARIBE-01.jpg',5450.48,30);
insert into producto values(19,null,'NESCAFÉ FRASCO X 50GRS',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\NESCAF__FRASCO_50_GRS',5200,45);
insert into producto values(20,null,'BLANQUILLO ABURRA X 500 GRS',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\BLANQUILLO_ABURRA_500_GRS.jpg',2500,36);

insert into producto values(21,null,'MAIZENA FÉCULA X 720 GRS',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\maizena_fecula_720_grs',15350.48,78);
insert into producto values(22,null,'GELATINA ROYAL FRESA 40 GR INDIV',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\GELATINA_ROYAL_FRESA_40_GR_INDIV',1200,90);
insert into producto values(23,null,'MODIFR. CHOCOLISTO CROCANTE X 500 GRS',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\CHOCOLISTO_CROCANTE_X_500_GRS.jpg',11850.48,75);
insert into producto values(24,null,'TOSTADA INTEGRAL JUANCHOPAN 10UN X 16G',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\TOSTADA_INTEGRAL_JUANCHOPAN_10UN_X_16G.jpg',1950.48,45);
insert into producto values(25,null,'COSECHA PURA NARANJA 330ML',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\COSECHA_PURA_330ML.jpg',1750.48,75);

insert into producto values(26,null,'ACEITE  URMET 1000 CC N.V',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\ACEITE_URMET_1000CC.jpg',13350.48,89);
insert into producto values(27,null,'CREMA MAGGI MARINERA INDIV C24',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\7702024007463-1.jpg',2900,15);
insert into producto values(28,null,'FRUCO SALSA TOM X 400 GRS VIDRIO',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\FRUCO_SALSA_TOMATE_400_GRS_VIDRIO.jpg',6750.48,32);
insert into producto values(29,null,'KLIM 1 MIEL FORTIPROTECT X 1 KL',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\KLIM_1_MIEL_PREBIO_1_KL',31650.47,74);
insert into producto values(30,null,'SALCHICHAS VIENA ZENÚ PLL. X 150 GRS',null,'C:\Users\john\Desktop\DB MiniMercado Los Pacos\img\salchichas-viena-de-pollo_150.png',3400,95);

/*------------------------------------------------------------------------------------------------------------------------------------*/

select * from producto;
select * from rol;
select * from usuario;
select * from compra;



