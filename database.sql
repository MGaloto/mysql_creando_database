CREATE SCHEMA IF NOT EXISTS centro_medicina_prepaga;

USE centro_medicina_prepaga;

# Primero crear tablas sin relaciones

CREATE TABLE IF NOT EXISTS afiliado (
id_afiliado INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(50) NOT NULL,
apellido VARCHAR(50) NOT NULL,
email VARCHAR(50) NOT NULL,
telefono INT NOT NULL,
fecha_nacimiento DATE NOT NULL,
domicilio VARCHAR(50) NOT NULL,
ocupacion VARCHAR(50) NOT NULL,
estado_civil VARCHAR(50) NOT NULL,
plan VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS especialidad (
id_especialidad INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
especialidad VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS medico (

id_medico INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(50) NOT NULL,
apellido VARCHAR(50) NOT NULL,
fecha_nacimiento DATE NOT NULL,
domicilio VARCHAR(50) NOT NULL,
telefono INT NOT NULL
);

CREATE TABLE IF NOT EXISTS insumos (
id_insumo INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
tipo VARCHAR(50) NOT NULL,
proveedor VARCHAR(50) NOT NULL

);


CREATE TABLE IF NOT EXISTS insumos (
id_insumo INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
tipo VARCHAR(50) NOT NULL,
proveedor VARCHAR(50) NOT NULL

);


CREATE TABLE IF NOT EXISTS centro_medico (

id_centro INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(50) NOT NULL,
direccion VARCHAR(50) NOT NULL,
telefono INT NOT NULL,
id_insumo INT NOT NULL,
FOREIGN KEY (id_insumo) REFERENCES insumos(id_insumo),
id_medico INT NOT NULL,
FOREIGN KEY (id_medico) REFERENCES medico(id_medico),
id_especialidad INT NOT NULL,
FOREIGN KEY (id_especialidad) REFERENCES especialidad(id_especialidad),
id_afiliado INT NOT NULL,
FOREIGN KEY (id_afiliado) REFERENCES afiliado(id_afiliado)

);


CREATE TABLE IF NOT EXISTS turnos (

id_turno INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
consulta VARCHAR(50) NOT NULL,
diagnostico VARCHAR(50) NOT NULL,
fecha DATE NOT NULL,
id_medico INT NOT NULL,
FOREIGN KEY (id_medico) REFERENCES medico(id_medico),
id_afiliado INT NOT NULL,
FOREIGN KEY (id_afiliado) REFERENCES afiliado(id_afiliado)

);


CREATE TABLE IF NOT EXISTS insumo_centro (

id_insumo INT NOT NULL,
FOREIGN KEY (id_insumo) REFERENCES insumos(id_insumo),
id_centro INT NOT NULL,
FOREIGN KEY (id_centro) REFERENCES centro_medico(id_centro)
            
);