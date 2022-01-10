CREATE SCHEMA IF NOT EXISTS centro_medicina_prepaga;

USE centro_medicina_prepaga;

# Primero crear tablas sin relaciones


CREATE TABLE IF NOT EXISTS afiliado (
id_afiliado INT  PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(50) ,
apellido VARCHAR(50) ,
email VARCHAR(50) ,
telefono INT ,
fecha_nacimiento DATE ,
domicilio VARCHAR(50) ,
ocupacion VARCHAR(50) ,
estado_civil VARCHAR(50) ,
plan VARCHAR(50) ,
dni INT 
);

CREATE TABLE IF NOT EXISTS especialidad (
id_especialidad INT  PRIMARY KEY AUTO_INCREMENT,
especialidad VARCHAR(50) 
);

CREATE TABLE IF NOT EXISTS medico (

id_medico INT  PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(50) ,
apellido VARCHAR(50) ,
fecha_nacimiento DATE ,
domicilio VARCHAR(50) ,
telefono INT 
);

CREATE TABLE IF NOT EXISTS plan_familiar (
id_plan_familiar INT PRIMARY KEY AUTO_INCREMENT,
tipo VARCHAR(50) ,
fecha_alta DATE,
total_consultas INT

);


CREATE TABLE IF NOT EXISTS turnos (

id_turno INT  PRIMARY KEY AUTO_INCREMENT,
consulta VARCHAR(50) ,
diagnostico VARCHAR(50) ,
fecha DATE 

);



CREATE TABLE IF NOT EXISTS centro_medico (

id_centro INT PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(50) ,
direccion VARCHAR(50) ,
telefono INT ,
fecha_asistencia DATE ,
id_plan_familiar INT ,
FOREIGN KEY (id_plan_familiar) REFERENCES plan_familiar(id_plan_familiar),
id_medico INT ,
FOREIGN KEY (id_medico) REFERENCES medico(id_medico),
id_especialidad INT ,
FOREIGN KEY (id_especialidad) REFERENCES especialidad(id_especialidad),
id_afiliado INT ,
FOREIGN KEY (id_afiliado) REFERENCES afiliado(id_afiliado),
id_turno INT ,
FOREIGN KEY (id_turno) REFERENCES turnos(id_turno)

);

