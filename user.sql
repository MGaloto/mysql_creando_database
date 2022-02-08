
/*Creando los usuarios*/
CREATE USER 'usuario_uno'@'localhost' identified BY 'usuariouno';
CREATE USER 'usuario_dos'@'localhost' identified BY 'usuariodos';

/*Busqueda del usuario*/
SELECT * FROM mysql.user WHERE user = 'usuario_uno';
SELECT * FROM mysql.user WHERE user = 'usuario_dos';

/*Cambio de clave a una mas segura*/
ALTER USER 'usuario_uno'@'localhost' identified BY 'unousuario123';
ALTER USER 'usuario_dos'@'localhost' identified BY 'dosusuario123';

/*Con GRANT le podemos dar permiso al usuario de: SELECT, INSERT, UPDATE y DELETE*/
SHOW GRANTS FOR 'usuario_uno'@'localhost';
SHOW GRANTS FOR 'usuario_dos'@'localhost';

/*Le otorgo permisos de solo lectura al usuario_uno, Le otorgo permisos de lectura, insert y alter al usuario_dos*/
GRANT SELECT ON centro_medicina_prepaga.* TO 'usuario_uno'@'localhost';
GRANT SELECT, ALTER, INSERT ON centro_medicina_prepaga.* TO 'usuario_dos'@'localhost';

/*Le saco permisos a los usuarios para que no borren registros*/
REVOKE DELETE ON centro_medicina_prepaga.* FROM  'usuario_uno'@'localhost';
REVOKE DELETE ON centro_medicina_prepaga.* FROM  'usuario_dos'@'localhost';




