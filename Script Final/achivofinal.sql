CREATE SCHEMA IF NOT EXISTS centro_medicina_prepaga;

USE centro_medicina_prepaga;

# Primero crear tablas sin relaciones

CREATE TABLE IF NOT EXISTS medico (
id_medico INT PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(50) ,
apellido VARCHAR(50) ,
fecha_nacimiento DATE ,
domicilio VARCHAR(50) ,
telefono INT 
);

CREATE TABLE IF NOT EXISTS ocupacion_afiliado (
id_ocupacion INT  PRIMARY KEY AUTO_INCREMENT,
ocupacion VARCHAR(50) 
);

CREATE TABLE IF NOT EXISTS plan_afiliado (
id_plan INT  PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(50) 
);

CREATE TABLE IF NOT EXISTS consulta (
id_consulta INT PRIMARY KEY AUTO_INCREMENT,
consulta VARCHAR(50) ,
diagnostico VARCHAR(50) 
);

CREATE TABLE IF NOT EXISTS medio_operacion (
id_medio_operacion INT  PRIMARY KEY AUTO_INCREMENT,
tipo_medio_operacion VARCHAR(50) 
);

CREATE TABLE IF NOT EXISTS proveedor (
id_proveedor INT PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(50) ,
telefono INT,
cuit INT ,
mail VARCHAR(50) 
);

CREATE TABLE IF NOT EXISTS centro_medico (
id_centro INT PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(50) ,
direccion VARCHAR(50) ,
telefono INT ,
cod_postal INT ,
email VARCHAR(50) ,
especialidad_principal VARCHAR(50) 
);

CREATE TABLE IF NOT EXISTS tipo_insumo (
id_tipo_insumo INT  PRIMARY KEY AUTO_INCREMENT,
tipo_insumo VARCHAR(50) 
);

CREATE TABLE IF NOT EXISTS afiliado (
id_afiliado INT  PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(50) ,
apellido VARCHAR(50) ,
email VARCHAR(50) ,
telefono INT ,
fecha_nacimiento DATE ,
domicilio VARCHAR(50) ,
estado_civil VARCHAR(50) ,
dni INT ,
id_plan INT ,
id_ocupacion INT ,
FOREIGN KEY (id_plan) REFERENCES plan_afiliado(id_plan) ,
FOREIGN KEY (id_ocupacion) REFERENCES ocupacion_afiliado(id_ocupacion) 
)engine = innodb;

CREATE TABLE IF NOT EXISTS cobros (
id_cobros INT  PRIMARY KEY AUTO_INCREMENT,
fecha_transaccion DATE ,
importe INT ,
id_medio_operacion INT ,
id_afiliado INT ,
FOREIGN KEY (id_medio_operacion) REFERENCES medio_operacion(id_medio_operacion) ,
FOREIGN KEY (id_afiliado) REFERENCES afiliado(id_afiliado) 
)engine = innodb;

CREATE TABLE IF NOT EXISTS pagos (
id_pagos INT  PRIMARY KEY AUTO_INCREMENT,
fecha_transaccion DATE ,
importe BIGINT ,
id_medio_operacion INT ,
id_proveedor INT ,
FOREIGN KEY (id_medio_operacion) REFERENCES medio_operacion(id_medio_operacion) ,
FOREIGN KEY (id_proveedor) REFERENCES proveedor(id_proveedor) 
)engine = innodb;


CREATE TABLE IF NOT EXISTS turnos (
id_turno INT  PRIMARY KEY AUTO_INCREMENT,
fecha DATE ,
id_centro INT ,
id_medico INT ,
id_afiliado INT ,
id_consulta INT ,
FOREIGN KEY (id_centro) REFERENCES centro_medico(id_centro) ,
FOREIGN KEY (id_medico) REFERENCES medico(id_medico) ,
FOREIGN KEY (id_afiliado) REFERENCES afiliado(id_afiliado) ,
FOREIGN KEY (id_consulta) REFERENCES consulta(id_consulta) 
)engine = innodb;

CREATE TABLE IF NOT EXISTS insumos (
id_insumo INT  PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(50) ,
id_tipo_insumo INT ,
id_proveedor INT ,
FOREIGN KEY (id_tipo_insumo) REFERENCES tipo_insumo(id_tipo_insumo) ,
FOREIGN KEY (id_proveedor) REFERENCES proveedor(id_proveedor) 
)engine = innodb;

CREATE TABLE IF NOT EXISTS centro_medico_insumos (
id_centro_medico_insumos INT  PRIMARY KEY AUTO_INCREMENT,
id_centro INT ,
id_insumo INT ,
FOREIGN KEY (id_centro) REFERENCES centro_medico(id_centro) ,
FOREIGN KEY (id_insumo) REFERENCES insumos(id_insumo) 
)engine = innodb;



-- Insert Tabla Afiliado --

INSERT INTO afiliado (`id_afiliado`,`nombre`,`apellido`,`email`,`telefono`,`fecha_nacimiento`,`domicilio`,`estado_civil`,`dni`,`id_plan`,`id_ocupacion`) VALUES (1,'Juan','Gomez','juangomez@gmail.com.ar',1945456565,'1990-05-01','calle 1','soltero',37454232,1,1);
INSERT INTO afiliado (`id_afiliado`,`nombre`,`apellido`,`email`,`telefono`,`fecha_nacimiento`,`domicilio`,`estado_civil`,`dni`,`id_plan`,`id_ocupacion`) VALUES (2,'Maxi','Lopez','maxilopez@gmail.com.ar',1945456464,'1989-05-01','calle 2','casado',31444222,1,1);
INSERT INTO afiliado (`id_afiliado`,`nombre`,`apellido`,`email`,`telefono`,`fecha_nacimiento`,`domicilio`,`estado_civil`,`dni`,`id_plan`,`id_ocupacion`) VALUES (3,'Lucas','Gonzales','lucasgonzales@gmail.com.ar',1945455454,'1987-05-01','calle 3','casado',37444228,1,1);
INSERT INTO afiliado (`id_afiliado`,`nombre`,`apellido`,`email`,`telefono`,`fecha_nacimiento`,`domicilio`,`estado_civil`,`dni`,`id_plan`,`id_ocupacion`) VALUES (4,'Julieta','Reta','julietareta@gmail.com.ar',1523235656,'1987-05-02','calle 4','soltero',37444229,1,1);
INSERT INTO afiliado (`id_afiliado`,`nombre`,`apellido`,`email`,`telefono`,`fecha_nacimiento`,`domicilio`,`estado_civil`,`dni`,`id_plan`,`id_ocupacion`) VALUES (5,'Giuliana','Lopez','giulopez@gmail.com.ar',1425253635,'1987-05-03','calle 5','soltero',37444230,1,1);
INSERT INTO afiliado (`id_afiliado`,`nombre`,`apellido`,`email`,`telefono`,`fecha_nacimiento`,`domicilio`,`estado_civil`,`dni`,`id_plan`,`id_ocupacion`) VALUES (6,'Graciela','Galo','gragalo@gmail.com.ar',1168808947,'1987-05-04','calle 6','soltero',37444231,2,1);
INSERT INTO afiliado (`id_afiliado`,`nombre`,`apellido`,`email`,`telefono`,`fecha_nacimiento`,`domicilio`,`estado_civil`,`dni`,`id_plan`,`id_ocupacion`) VALUES (7,'Alejandro','Galo','alegalo@gmail.com.ar',1235356964,'1987-05-05','calle 7','casado',37444232,2,1);
INSERT INTO afiliado (`id_afiliado`,`nombre`,`apellido`,`email`,`telefono`,`fecha_nacimiento`,`domicilio`,`estado_civil`,`dni`,`id_plan`,`id_ocupacion`) VALUES (8,'Luis','Casal','luicasa@gmail.com.ar',1527278946,'1987-05-06','calle 8','soltero',37444233,2,1);
INSERT INTO afiliado (`id_afiliado`,`nombre`,`apellido`,`email`,`telefono`,`fecha_nacimiento`,`domicilio`,`estado_civil`,`dni`,`id_plan`,`id_ocupacion`) VALUES (9,'Nicolas','Schiavi','nicochi@gmail.com.ar',1564796497,'1987-05-07','calle 9','soltero',37444234,2,2);
INSERT INTO afiliado (`id_afiliado`,`nombre`,`apellido`,`email`,`telefono`,`fecha_nacimiento`,`domicilio`,`estado_civil`,`dni`,`id_plan`,`id_ocupacion`) VALUES (10,'Matias','Guitierrez','matgut@gmail.com.ar',1523465678,'1987-05-08','calle 10','soltero',37444235,2,2);
INSERT INTO afiliado (`id_afiliado`,`nombre`,`apellido`,`email`,`telefono`,`fecha_nacimiento`,`domicilio`,`estado_civil`,`dni`,`id_plan`,`id_ocupacion`) VALUES (11,'juan','centurion','juancen@gmail',1165654848,'1980-01-05','calle 1500','soltero',30374152,1,1);

-- Insert Tabla medico --

INSERT INTO medico (`id_medico`,`nombre`,`apellido`,`fecha_nacimiento`,`domicilio`,`telefono`) VALUES (1,'Alan','Milei','1990-01-01','calle 45',1180808080);
INSERT INTO medico (`id_medico`,`nombre`,`apellido`,`fecha_nacimiento`,`domicilio`,`telefono`) VALUES (2,'Franco','Reta','1990-02-01','calle 450',1165656565);
INSERT INTO medico (`id_medico`,`nombre`,`apellido`,`fecha_nacimiento`,`domicilio`,`telefono`) VALUES (3,'Maxi','Ruti','1990-01-01','calle 100',1136363636);
INSERT INTO medico (`id_medico`,`nombre`,`apellido`,`fecha_nacimiento`,`domicilio`,`telefono`) VALUES (4,'Juan','Fernandez','1990-01-01','calle 101',1136363637);
INSERT INTO medico (`id_medico`,`nombre`,`apellido`,`fecha_nacimiento`,`domicilio`,`telefono`) VALUES (5,'Dante','Pichetto','1990-02-01','calle 102',1136363638);
INSERT INTO medico (`id_medico`,`nombre`,`apellido`,`fecha_nacimiento`,`domicilio`,`telefono`) VALUES (6,'Miguel','Boggiano','1990-03-01','calle 103',1136363639);
INSERT INTO medico (`id_medico`,`nombre`,`apellido`,`fecha_nacimiento`,`domicilio`,`telefono`) VALUES (7,'Julieta','Catalina','1990-04-01','calle 104',1136363640);
INSERT INTO medico (`id_medico`,`nombre`,`apellido`,`fecha_nacimiento`,`domicilio`,`telefono`) VALUES (8,'Analia','Cassa','1990-05-01','calle 105',1136363641);
INSERT INTO medico (`id_medico`,`nombre`,`apellido`,`fecha_nacimiento`,`domicilio`,`telefono`) VALUES (9,'Graciela','Binett','1990-06-01','calle 106',1136363642);
INSERT INTO medico (`id_medico`,`nombre`,`apellido`,`fecha_nacimiento`,`domicilio`,`telefono`) VALUES (10,'Juliana','Porto','1990-07-01','calle 107',1136363643);

-- Insert Tabla ocupacion_afiliado --

INSERT INTO ocupacion_afiliado (`id_ocupacion`,`ocupacion`) VALUES (1,'dependencia');
INSERT INTO ocupacion_afiliado (`id_ocupacion`,`ocupacion`) VALUES (2,'autonomo');
INSERT INTO ocupacion_afiliado (`id_ocupacion`,`ocupacion`) VALUES (3,'jubilado');
INSERT INTO ocupacion_afiliado (`id_ocupacion`,`ocupacion`) VALUES (4,'desempleado');

-- Insert Tabla plan_afiliado --

INSERT INTO plan_afiliado (`id_plan`,`nombre`) VALUES (1,'medium');
INSERT INTO plan_afiliado (`id_plan`,`nombre`) VALUES (2,'premium');

-- Insert Tabla consulta --

INSERT INTO consulta (`id_consulta`,`consulta`,`diagnostico`) VALUES (1,'fiebre','covid');
INSERT INTO consulta (`id_consulta`,`consulta`,`diagnostico`) VALUES (2,'fiebre','covid');
INSERT INTO consulta (`id_consulta`,`consulta`,`diagnostico`) VALUES (3,'covid','covid');
INSERT INTO consulta (`id_consulta`,`consulta`,`diagnostico`) VALUES (4,'resfrio','covid');
INSERT INTO consulta (`id_consulta`,`consulta`,`diagnostico`) VALUES (5,'dolor de panza','gastritis');
INSERT INTO consulta (`id_consulta`,`consulta`,`diagnostico`) VALUES (6,'dolor de cuerpo','estrés');
INSERT INTO consulta (`id_consulta`,`consulta`,`diagnostico`) VALUES (7,'fiebre','covid');
INSERT INTO consulta (`id_consulta`,`consulta`,`diagnostico`) VALUES (8,'covid','covid');
INSERT INTO consulta (`id_consulta`,`consulta`,`diagnostico`) VALUES (9,'covid','covid');
INSERT INTO consulta (`id_consulta`,`consulta`,`diagnostico`) VALUES (10,'covid','covid');
INSERT INTO consulta (`id_consulta`,`consulta`,`diagnostico`) VALUES (11,'fiebre','covid');
INSERT INTO consulta (`id_consulta`,`consulta`,`diagnostico`) VALUES (12,'fiebre','gripe');
INSERT INTO consulta (`id_consulta`,`consulta`,`diagnostico`) VALUES (13,'fiebre','covid');
INSERT INTO consulta (`id_consulta`,`consulta`,`diagnostico`) VALUES (14,'fiebre','covid');
INSERT INTO consulta (`id_consulta`,`consulta`,`diagnostico`) VALUES (15,'fiebre','covid');
INSERT INTO consulta (`id_consulta`,`consulta`,`diagnostico`) VALUES (16,'fiebre','fractura');
INSERT INTO consulta (`id_consulta`,`consulta`,`diagnostico`) VALUES (17,'mal estar','gastritis');
INSERT INTO consulta (`id_consulta`,`consulta`,`diagnostico`) VALUES (18,'mal estar','fractura');
INSERT INTO consulta (`id_consulta`,`consulta`,`diagnostico`) VALUES (19,'mal estar','gastritis');

-- Insert Tabla medio_operacion --

INSERT INTO medio_operacion (`id_medio_operacion`,`tipo_medio_operacion`) VALUES (1,'tarjeta de debito');
INSERT INTO medio_operacion (`id_medio_operacion`,`tipo_medio_operacion`) VALUES (2,'tarjeta de credito');
INSERT INTO medio_operacion (`id_medio_operacion`,`tipo_medio_operacion`) VALUES (3,'efectivo');
INSERT INTO medio_operacion (`id_medio_operacion`,`tipo_medio_operacion`) VALUES (4,'transferencia');

-- Insert Tabla proveedor --

INSERT INTO proveedor (`id_proveedor`,`nombre`,`telefono`,`cuit`,`mail`) VALUES (1,'insumos s.a',1145654565,20374351,'insumos@gmail.com');
INSERT INTO proveedor (`id_proveedor`,`nombre`,`telefono`,`cuit`,`mail`) VALUES (2,'colchoneria s.a',1145654566,20374341,'colchoneria@gmail.com');
INSERT INTO proveedor (`id_proveedor`,`nombre`,`telefono`,`cuit`,`mail`) VALUES (3,'vehicle s.a',1145654567,20374354,'vehicle@gmail.com');
INSERT INTO proveedor (`id_proveedor`,`nombre`,`telefono`,`cuit`,`mail`) VALUES (4,'farmacorp',1145654568,20374348,'farmacorp@gmail.com');
INSERT INTO proveedor (`id_proveedor`,`nombre`,`telefono`,`cuit`,`mail`) VALUES (5,'farma s.a',1145654569,20374343,'farma@gmail.com');

-- Insert Tabla centro_medico --

INSERT INTO centro_medico (`id_centro`,`nombre`,`direccion`,`telefono`,`cod_postal`,`email`,`especialidad_principal`) VALUES (1,'Narcizo','calle 254',153113111,150,'narcizo@gmail.com','pediatria');
INSERT INTO centro_medico (`id_centro`,`nombre`,`direccion`,`telefono`,`cod_postal`,`email`,`especialidad_principal`) VALUES (2,'Aleman','calle 255',153113112,151,'aleman@gmail.com','odontologia');
INSERT INTO centro_medico (`id_centro`,`nombre`,`direccion`,`telefono`,`cod_postal`,`email`,`especialidad_principal`) VALUES (3,'Pueyrredon','calle 256',153113113,152,'pueyrredon@gmail.com','psiquiatria');
INSERT INTO centro_medico (`id_centro`,`nombre`,`direccion`,`telefono`,`cod_postal`,`email`,`especialidad_principal`) VALUES (4,'Lopez','calle 257',153113114,153,'lopez@gmail.com','dermatologia');
INSERT INTO centro_medico (`id_centro`,`nombre`,`direccion`,`telefono`,`cod_postal`,`email`,`especialidad_principal`) VALUES (5,'Español','calle 258',153113115,154,'español@gmail.com','traumatologia');
INSERT INTO centro_medico (`id_centro`,`nombre`,`direccion`,`telefono`,`cod_postal`,`email`,`especialidad_principal`) VALUES (6,'Italiano','calle 259',153113116,155,'italiano@gmail.com','pediatria');
INSERT INTO centro_medico (`id_centro`,`nombre`,`direccion`,`telefono`,`cod_postal`,`email`,`especialidad_principal`) VALUES (7,'Comunitario','calle 260',153113117,156,'comunitario@gmail.com','odontologia');
INSERT INTO centro_medico (`id_centro`,`nombre`,`direccion`,`telefono`,`cod_postal`,`email`,`especialidad_principal`) VALUES (8,'Del Valle','calle 261',153113118,157,'delvalle@gmail.com','psiquiatria');
INSERT INTO centro_medico (`id_centro`,`nombre`,`direccion`,`telefono`,`cod_postal`,`email`,`especialidad_principal`) VALUES (9,'Monte Grande','calle 262',153113119,158,'montegrande@gmail.com','dermatologia');
INSERT INTO centro_medico (`id_centro`,`nombre`,`direccion`,`telefono`,`cod_postal`,`email`,`especialidad_principal`) VALUES (10,'Britanico','calle 263',153113120,159,'britanico@gmail.com','traumatologia');

-- Insert Tabla tipo_insumo --

INSERT INTO tipo_insumo (`id_tipo_insumo`,`tipo_insumo`) VALUES (1,'farmaceutico');
INSERT INTO tipo_insumo (`id_tipo_insumo`,`tipo_insumo`) VALUES (2,'instrumento');
INSERT INTO tipo_insumo (`id_tipo_insumo`,`tipo_insumo`) VALUES (3,'hospitalario');
INSERT INTO tipo_insumo (`id_tipo_insumo`,`tipo_insumo`) VALUES (4,'salud e higiene');

-- Insert Tabla cobros --


INSERT INTO cobros (`id_cobros`,`fecha_transaccion`,`importe`,`id_medio_operacion`,`id_afiliado`) VALUES (1,'2022-02-01',8500,2,1);
INSERT INTO cobros (`id_cobros`,`fecha_transaccion`,`importe`,`id_medio_operacion`,`id_afiliado`) VALUES (2,'2022-02-02',8500,2,2);
INSERT INTO cobros (`id_cobros`,`fecha_transaccion`,`importe`,`id_medio_operacion`,`id_afiliado`) VALUES (3,'2022-02-03',8500,2,3);
INSERT INTO cobros (`id_cobros`,`fecha_transaccion`,`importe`,`id_medio_operacion`,`id_afiliado`) VALUES (4,'2022-02-04',8500,2,4);
INSERT INTO cobros (`id_cobros`,`fecha_transaccion`,`importe`,`id_medio_operacion`,`id_afiliado`) VALUES (5,'2022-02-05',8500,2,5);
INSERT INTO cobros (`id_cobros`,`fecha_transaccion`,`importe`,`id_medio_operacion`,`id_afiliado`) VALUES (6,'2022-02-06',10000,1,6);
INSERT INTO cobros (`id_cobros`,`fecha_transaccion`,`importe`,`id_medio_operacion`,`id_afiliado`) VALUES (7,'2022-02-07',10000,1,7);
INSERT INTO cobros (`id_cobros`,`fecha_transaccion`,`importe`,`id_medio_operacion`,`id_afiliado`) VALUES (8,'2022-02-08',10000,1,8);
INSERT INTO cobros (`id_cobros`,`fecha_transaccion`,`importe`,`id_medio_operacion`,`id_afiliado`) VALUES (9,'2022-02-09',10000,1,9);
INSERT INTO cobros (`id_cobros`,`fecha_transaccion`,`importe`,`id_medio_operacion`,`id_afiliado`) VALUES (10,'2022-02-10',10000,1,10);
INSERT INTO cobros (`id_cobros`,`fecha_transaccion`,`importe`,`id_medio_operacion`,`id_afiliado`) VALUES (11,'2022-01-01',8500,2,1);

-- Insert Tabla pagos --

INSERT INTO pagos (`id_pagos`,`fecha_transaccion`,`importe`,`id_medio_operacion`,`id_proveedor`) VALUES (1,'2022-01-01',500,3,1);
INSERT INTO pagos (`id_pagos`,`fecha_transaccion`,`importe`,`id_medio_operacion`,`id_proveedor`) VALUES (2,'2022-01-02',10000,3,2);
INSERT INTO pagos (`id_pagos`,`fecha_transaccion`,`importe`,`id_medio_operacion`,`id_proveedor`) VALUES (3,'2022-01-03',500,3,1);
INSERT INTO pagos (`id_pagos`,`fecha_transaccion`,`importe`,`id_medio_operacion`,`id_proveedor`) VALUES (4,'2022-01-04',500000,3,3);
INSERT INTO pagos (`id_pagos`,`fecha_transaccion`,`importe`,`id_medio_operacion`,`id_proveedor`) VALUES (5,'2022-01-05',500,3,4);
INSERT INTO pagos (`id_pagos`,`fecha_transaccion`,`importe`,`id_medio_operacion`,`id_proveedor`) VALUES (6,'2022-01-06',600,3,4);
INSERT INTO pagos (`id_pagos`,`fecha_transaccion`,`importe`,`id_medio_operacion`,`id_proveedor`) VALUES (7,'2022-01-07',700,3,4);
INSERT INTO pagos (`id_pagos`,`fecha_transaccion`,`importe`,`id_medio_operacion`,`id_proveedor`) VALUES (8,'2022-01-08',800,3,4);
INSERT INTO pagos (`id_pagos`,`fecha_transaccion`,`importe`,`id_medio_operacion`,`id_proveedor`) VALUES (9,'2022-01-09',900,3,4);
INSERT INTO pagos (`id_pagos`,`fecha_transaccion`,`importe`,`id_medio_operacion`,`id_proveedor`) VALUES (10,'2022-01-10',950,3,4);

-- Insert Tabla turnos --

INSERT INTO turnos (`id_turno`,`fecha`,`id_centro`,`id_medico`,`id_afiliado`,`id_consulta`) VALUES (1,'2022-01-01',1,1,1,1);
INSERT INTO turnos (`id_turno`,`fecha`,`id_centro`,`id_medico`,`id_afiliado`,`id_consulta`) VALUES (2,'2022-01-01',1,2,2,2);
INSERT INTO turnos (`id_turno`,`fecha`,`id_centro`,`id_medico`,`id_afiliado`,`id_consulta`) VALUES (3,'2022-01-01',1,3,3,3);
INSERT INTO turnos (`id_turno`,`fecha`,`id_centro`,`id_medico`,`id_afiliado`,`id_consulta`) VALUES (4,'2022-01-01',4,3,4,4);
INSERT INTO turnos (`id_turno`,`fecha`,`id_centro`,`id_medico`,`id_afiliado`,`id_consulta`) VALUES (5,'2022-01-02',5,3,5,5);
INSERT INTO turnos (`id_turno`,`fecha`,`id_centro`,`id_medico`,`id_afiliado`,`id_consulta`) VALUES (6,'2022-01-03',6,3,6,6);
INSERT INTO turnos (`id_turno`,`fecha`,`id_centro`,`id_medico`,`id_afiliado`,`id_consulta`) VALUES (7,'2022-01-04',7,4,7,7);
INSERT INTO turnos (`id_turno`,`fecha`,`id_centro`,`id_medico`,`id_afiliado`,`id_consulta`) VALUES (8,'2022-01-05',8,5,8,8);
INSERT INTO turnos (`id_turno`,`fecha`,`id_centro`,`id_medico`,`id_afiliado`,`id_consulta`) VALUES (9,'2022-01-06',8,8,9,9);
INSERT INTO turnos (`id_turno`,`fecha`,`id_centro`,`id_medico`,`id_afiliado`,`id_consulta`) VALUES (10,'2022-01-07',10,10,10,10);
INSERT INTO turnos (`id_turno`,`fecha`,`id_centro`,`id_medico`,`id_afiliado`,`id_consulta`) VALUES (11,'2022-02-06',1,3,9,11);
INSERT INTO turnos (`id_turno`,`fecha`,`id_centro`,`id_medico`,`id_afiliado`,`id_consulta`) VALUES (13,'2022-02-02',5,2,1,12);
INSERT INTO turnos (`id_turno`,`fecha`,`id_centro`,`id_medico`,`id_afiliado`,`id_consulta`) VALUES (14,'2022-02-02',5,2,1,14);
INSERT INTO turnos (`id_turno`,`fecha`,`id_centro`,`id_medico`,`id_afiliado`,`id_consulta`) VALUES (15,'2022-02-02',4,5,2,15);
INSERT INTO turnos (`id_turno`,`fecha`,`id_centro`,`id_medico`,`id_afiliado`,`id_consulta`) VALUES (16,'2022-02-02',4,5,3,16);
INSERT INTO turnos (`id_turno`,`fecha`,`id_centro`,`id_medico`,`id_afiliado`,`id_consulta`) VALUES (17,'2022-02-02',2,1,4,17);
INSERT INTO turnos (`id_turno`,`fecha`,`id_centro`,`id_medico`,`id_afiliado`,`id_consulta`) VALUES (18,'2022-02-02',7,5,8,18);
INSERT INTO turnos (`id_turno`,`fecha`,`id_centro`,`id_medico`,`id_afiliado`,`id_consulta`) VALUES (19,'2022-02-02',9,3,9,19);

-- Insert Tabla insumos --

INSERT INTO insumos (`id_insumo`,`nombre`,`id_tipo_insumo`,`id_proveedor`) VALUES (1,'jeringa',2,1);
INSERT INTO insumos (`id_insumo`,`nombre`,`id_tipo_insumo`,`id_proveedor`) VALUES (2,'cama',3,2);
INSERT INTO insumos (`id_insumo`,`nombre`,`id_tipo_insumo`,`id_proveedor`) VALUES (3,'barbijo',4,1);
INSERT INTO insumos (`id_insumo`,`nombre`,`id_tipo_insumo`,`id_proveedor`) VALUES (4,'ambulancia',3,3);
INSERT INTO insumos (`id_insumo`,`nombre`,`id_tipo_insumo`,`id_proveedor`) VALUES (5,'medicamento a',1,4);
INSERT INTO insumos (`id_insumo`,`nombre`,`id_tipo_insumo`,`id_proveedor`) VALUES (6,'medicamento b',1,4);
INSERT INTO insumos (`id_insumo`,`nombre`,`id_tipo_insumo`,`id_proveedor`) VALUES (7,'medicamento c',1,4);
INSERT INTO insumos (`id_insumo`,`nombre`,`id_tipo_insumo`,`id_proveedor`) VALUES (8,'medicamento d',1,4);
INSERT INTO insumos (`id_insumo`,`nombre`,`id_tipo_insumo`,`id_proveedor`) VALUES (9,'medicamento e',1,4);
INSERT INTO insumos (`id_insumo`,`nombre`,`id_tipo_insumo`,`id_proveedor`) VALUES (10,'medicamento f',1,4);

-- Insert Tabla centro_medico_insumos --

INSERT INTO centro_medico_insumos (`id_centro_medico_insumos`,`id_centro`,`id_insumo`) VALUES (1,1,1);
INSERT INTO centro_medico_insumos (`id_centro_medico_insumos`,`id_centro`,`id_insumo`) VALUES (2,2,2);
INSERT INTO centro_medico_insumos (`id_centro_medico_insumos`,`id_centro`,`id_insumo`) VALUES (3,3,2);
INSERT INTO centro_medico_insumos (`id_centro_medico_insumos`,`id_centro`,`id_insumo`) VALUES (4,4,3);
INSERT INTO centro_medico_insumos (`id_centro_medico_insumos`,`id_centro`,`id_insumo`) VALUES (5,5,3);
INSERT INTO centro_medico_insumos (`id_centro_medico_insumos`,`id_centro`,`id_insumo`) VALUES (6,6,6);
INSERT INTO centro_medico_insumos (`id_centro_medico_insumos`,`id_centro`,`id_insumo`) VALUES (7,7,7);
INSERT INTO centro_medico_insumos (`id_centro_medico_insumos`,`id_centro`,`id_insumo`) VALUES (8,8,8);
INSERT INTO centro_medico_insumos (`id_centro_medico_insumos`,`id_centro`,`id_insumo`) VALUES (9,9,9);
INSERT INTO centro_medico_insumos (`id_centro_medico_insumos`,`id_centro`,`id_insumo`) VALUES (10,10,10);




-- Vistas-- 

CREATE VIEW vista_consulta_diagnostico AS
SELECT turnos.fecha AS Fecha_Turno,
 afiliado.nombre AS Nombre,
 afiliado.apellido AS Apellido,
 consulta.diagnostico AS Diagnostico,
 consulta.consulta AS Consulta
FROM turnos 
INNER JOIN afiliado 
ON turnos.id_afiliado = afiliado.id_afiliado
INNER JOIN consulta 
ON turnos.id_consulta = consulta.id_consulta
ORDER BY turnos.fecha DESC;




CREATE VIEW vista_medico_paciente AS
SELECT turnos.fecha AS Fecha_Turno,
 afiliado.nombre AS Nombre_Paciente, 
 afiliado.apellido AS Apellido_Paciente, 
 medico.nombre AS Nombre_Medico,
 medico.apellido AS Apellido_Medico
FROM turnos 
INNER JOIN afiliado 
ON turnos.id_afiliado = afiliado.id_afiliado
INNER JOIN medico 
ON turnos.id_medico = medico.id_medico
ORDER BY turnos.fecha DESC;



CREATE VIEW vista_centromedico_medico AS
SELECT medico.nombre AS Nombre_Medico,
 medico.apellido AS Apellido_Medico,
 medico.telefono AS Telefono_Medico,
 centro_medico.nombre AS Nombre_Centro
FROM turnos 
INNER JOIN centro_medico 
ON turnos.id_centro = centro_medico.id_centro
INNER JOIN medico 
ON turnos.id_medico = medico.id_medico
ORDER BY turnos.fecha DESC;



CREATE VIEW cobros_afiliados AS
SELECT afiliado.nombre AS Nombre_Afiliado,
 afiliado.apellido AS Apellido_Afiliado, 
 afiliado.id_afiliado AS Id_afiliado, 
 cobros.fecha_transaccion AS Fecha_Cobro,
 cobros.importe AS Importe_Cobro
FROM afiliado 
INNER JOIN cobros 
ON afiliado.id_afiliado = cobros.id_afiliado
ORDER BY afiliado.nombre DESC;



CREATE VIEW pagos_proveedores AS
SELECT proveedor.nombre AS Nombre_proveedor,
 proveedor.mail AS Mail_proveedor, 
 pagos.fecha_transaccion AS Fecha_pago, 
 pagos.importe AS Importe
FROM proveedor 
INNER JOIN pagos 
ON proveedor.id_proveedor = pagos.id_proveedor
ORDER BY pagos.importe DESC;


-- Funciones -- 


DELIMITER $$
CREATE FUNCTION calcular_covid_diagnosticos (diagnos varchar(100)) 
    RETURNS numeric(8,2)  
    NO SQL
    BEGIN
        DECLARE total_diagnostico numeric(8,2);
        DECLARE total_diagnosticos numeric(8,2);
        SELECT count(diagnostico) INTO total_diagnostico FROM consulta WHERE diagnostico = diagnos;
        SELECT count(diagnostico) INTO total_diagnosticos FROM consulta;
        RETURN ROUND((total_diagnostico / total_diagnosticos)*100, 2);
    END$$
DELIMITER ;


DELIMITER $$
CREATE FUNCTION calcular_resultado () 
    RETURNS numeric(8,2)  
    NO SQL
    BEGIN
        DECLARE pagos_totales numeric(8,2);
        DECLARE cobros_totales numeric(8,2);
        SELECT SUM(importe) INTO cobros_totales FROM cobros;
        SELECT SUM(importe) INTO pagos_totales FROM pagos;
        RETURN (cobros_totales - pagos_totales);
    END$$
DELIMITER ;


-- Triggers -- 

CREATE TABLE IF NOT EXISTS logsafiliado (
id_movimiento INT PRIMARY KEY AUTO_INCREMENT,
fecha_user DATETIME NOT NULL,
usuario_id VARCHAR(45) NULL,
id_afiliado INT,
nombre VARCHAR(50) ,
apellido VARCHAR(50) ,
email VARCHAR(50) ,
telefono INT ,
fecha_nacimiento DATE ,
domicilio VARCHAR(50) ,
estado_civil VARCHAR(50) ,
dni INT,
id_plan INT,
id_ocupacion INT,
tipo_operacion VARCHAR(200) NULL);
  

CREATE TRIGGER `after_logs_afiliado`
AFTER INSERT ON `afiliado`
FOR EACH ROW
INSERT INTO `logsafiliado` (id_movimiento, fecha_user, 
	usuario_id, id_afiliado, nombre, apellido, email, telefono, fecha_nacimiento,
    domicilio, estado_civil, dni, id_plan, id_ocupacion, tipo_operacion)
VALUES (NULL, NOW(), SESSION_USER(), NEW.id_afiliado, NEW.nombre, new.apellido,
     new.email, new.telefono, new.fecha_nacimiento, new.domicilio, new.estado_civil,  
     new.dni, new.id_plan, new.id_ocupacion, 'INSERT');
     

CREATE TRIGGER `before_logs_afiliado`
BEFORE INSERT ON `afiliado`
FOR EACH ROW
INSERT INTO `logsafiliado` (id_movimiento, fecha_user, 
	usuario_id, id_afiliado, nombre, apellido, email, telefono, fecha_nacimiento,
    domicilio, estado_civil, dni, id_plan, id_ocupacion, tipo_operacion)
VALUES (NULL, NOW(), SESSION_USER(), NEW.id_afiliado, NEW.nombre, new.apellido,
     new.email, new.telefono, new.fecha_nacimiento, new.domicilio, new.estado_civil,  
     new.dni, new.id_plan, new.id_ocupacion, 'INSERT');

INSERT INTO afiliado VALUES (NULL,'juan', 'centurion', 'juancen@gmail', 1165654848, 
'1980-01-05', 'calle 1500', 'soltero', 30374152, 1, 1);



CREATE TABLE IF NOT EXISTS logsconsulta (
id_movimiento INT PRIMARY KEY AUTO_INCREMENT,
fecha_user DATETIME NOT NULL,
usuario_id VARCHAR(45) NULL,
id_consulta INT,
consulta VARCHAR(50) ,
diagnostico VARCHAR(50),
tipo_operacion VARCHAR(200) NULL);
  
CREATE TRIGGER `after_logs_consulta`
AFTER INSERT ON `consulta`
FOR EACH ROW
INSERT INTO `logsconsulta` (id_movimiento, fecha_user, 
	usuario_id, id_consulta, consulta, diagnostico, tipo_operacion)
VALUES (NULL, NOW(), SESSION_USER(), NEW.id_consulta, NEW.consulta, new.diagnostico,'INSERT');

CREATE TRIGGER `before_logs_consulta`
BEFORE INSERT ON `consulta`
FOR EACH ROW
INSERT INTO `logsconsulta` (id_movimiento, fecha_user, 
	usuario_id, id_consulta, consulta, diagnostico, tipo_operacion)
VALUES (NULL, NOW(), SESSION_USER(), NEW.id_consulta, NEW.consulta, new.diagnostico,'INSERT'); 

INSERT INTO consulta VALUES (NULL,'dolor corporal', 'covid');




-- Stored Proceddures -- 

# Primero insertamos valores en la tabla consulta
INSERT INTO consulta(consulta,diagnostico) 
VALUES('fiebre', 'covid');

# Luego mediante stored procedure insertamos valores en la tabla turno con el ID ya creado anteriormente
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_centromedico_turno`(IN fecha DATE, 
IN id_centro INT, 
IN id_medico INT,
IN id_afiliado INT,
IN id_consulta INT)
BEGIN
INSERT INTO turnos(fecha,id_centro,id_medico,id_afiliado,id_consulta) 
VALUES(fecha,id_centro,id_medico,id_afiliado,id_consulta);
    END$$
DELIMITER ;

CALL sp_centromedico_turno('2022-02-06', 1, 3, 9, 11);

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_centromedico_order`(IN campo VARCHAR(255) , IN tipo_ordenamiento ENUM('ASC','DESC'), IN tabla VARCHAR(255))
BEGIN
	IF campo <> '' THEN
		SET @ordenar = CONCAT(' ORDER BY ',campo);
	ELSE 
		SET @ordenar ='';
    END IF;
    IF tipo_ordenamiento <> '' THEN
		SET @tipo = CONCAT(' ',tipo_ordenamiento);
	else
		set @tipo ='';
    END IF;
    SET @clausula = CONCAT('SELECT * FROM ', tabla,@ordenar,@tipo );
    PREPARE ejecutarSQL FROM @clausula;
    EXECUTE ejecutarSQL;
    deallocate prepare ejecutarSQL; 
    END$$
DELIMITER ;

CALL sp_centromedico_order('dni', 'DESC', 'afiliado');