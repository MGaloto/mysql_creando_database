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
id_centro INT ,
FOREIGN KEY (id_medio_operacion) REFERENCES medio_operacion(id_medio_operacion) ,
FOREIGN KEY (id_afiliado) REFERENCES afiliado(id_afiliado) ,
FOREIGN KEY (id_centro) REFERENCES centro_medico(id_centro) 
)engine = innodb;

CREATE TABLE IF NOT EXISTS pagos (
id_pagos INT  PRIMARY KEY AUTO_INCREMENT,
fecha_transaccion DATE ,
importe BIGINT ,
id_medio_operacion INT ,
id_proveedor INT ,
id_centro INT ,
FOREIGN KEY (id_medio_operacion) REFERENCES medio_operacion(id_medio_operacion) ,
FOREIGN KEY (id_proveedor) REFERENCES proveedor(id_proveedor) ,
FOREIGN KEY (id_centro) REFERENCES centro_medico(id_centro) 
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




