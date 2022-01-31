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
ocupacion VARCHAR(50) ,
estado_civil VARCHAR(50) ,
plan VARCHAR(50) ,
dni INT,
tipo_operacion VARCHAR(200) NULL);
  
CREATE TRIGGER `after_logs_afiliado`
AFTER INSERT ON `afiliado`
FOR EACH ROW
INSERT INTO `logsafiliado` (id_movimiento, fecha_user, 
	usuario_id, id_afiliado, nombre, apellido, email, telefono, fecha_nacimiento,
    domicilio, ocupacion, estado_civil, plan, dni, tipo_operacion)
VALUES (NULL, NOW(), SESSION_USER(), NEW.id_afiliado, NEW.nombre, new.apellido,
     new.email, new.telefono, new.fecha_nacimiento, new.domicilio, 
     new.ocupacion, new.estado_civil, new.plan, new.dni,'INSERT');
    
CREATE TRIGGER `before_logs_afiliado`
BEFORE INSERT ON `afiliado`
FOR EACH ROW
INSERT INTO `logsafiliado` (id_movimiento, fecha_user, 
	usuario_id, id_afiliado, nombre, apellido, email, telefono, fecha_nacimiento,
    domicilio, ocupacion, estado_civil, plan, dni, tipo_operacion)
VALUES (NULL, NOW(), SESSION_USER(), NEW.id_afiliado, NEW.nombre, new.apellido,
     new.email, new.telefono, new.fecha_nacimiento, new.domicilio, 
     new.ocupacion, new.estado_civil, new.plan, new.dni,'INSERT');   

    
INSERT INTO afiliado VALUES (NULL,'juan', 'centurion', 'juancen@gmail', 1165654848, 
'1980-01-05', 'calle 1500', 'empleado', 'soltero', 'premium', 30374152);

SELECT * FROM afiliado;

SELECT * FROM logsafiliado;










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

SELECT * FROM consulta;

SELECT * FROM logsconsulta;


