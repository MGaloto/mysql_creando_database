
SET AUTOCOMMIT = 0;
SET FOREIGN_KEY_CHECKS=0;
SELECT @@autocommit;

##################### Tabla 1 ####################
SELECT * FROM centro_medicina_prepaga.medico;

# Tabla 1 Star Transaction
START TRANSACTION;
UPDATE centro_medicina_prepaga.medico
SET
	nombre = 'Alan'
WHERE 
	id_medico = 2;

# Tabla 1 Consulta
SELECT * FROM centro_medicina_prepaga.medico;

# Tabla 1 Rollback y Commit
ROLLBACK;
COMMIT;

# Tabla 1 Consulta Final
SELECT * FROM centro_medicina_prepaga.medico;
###############################################


##################### Tabla 2 ####################
SELECT * FROM centro_medicina_prepaga.medico;

# Tabla 2 Star Transaction + Insert Values + Savepoints
START TRANSACTION;
	INSERT INTO centro_medicina_prepaga.medico VALUES(NULL, 'Alan', 'Lopez', '1980-01-02', "calle 655", 1168804545);
	INSERT INTO centro_medicina_prepaga.medico VALUES(NULL, 'Sergio', 'Lopez', '1980-01-02', "calle 655", 1168804545);
	INSERT INTO centro_medicina_prepaga.medico VALUES(NULL, 'Juli', 'Guti', '1980-01-02', "calle 655", 1168804545);
	INSERT INTO centro_medicina_prepaga.medico VALUES(NULL, 'Giuli', 'Messi', '1980-01-02', "calle 655", 1168804545);
	SAVEPOINT medico_4;
	INSERT INTO centro_medicina_prepaga.medico VALUES(NULL, 'Diego', 'Lopez', '1980-01-02', "calle 655", 1168804545);
	INSERT INTO centro_medicina_prepaga.medico VALUES(NULL, 'Juan', 'Lopez', '1980-01-02', "calle 655", 1168804545);
	INSERT INTO centro_medicina_prepaga.medico VALUES(NULL, 'Lore', 'Guti', '1980-01-02', "calle 655", 1168804545);
	INSERT INTO centro_medicina_prepaga.medico VALUES(NULL, 'Dante', 'Messi', '1980-01-02', "calle 655", 1168804545);
	SAVEPOINT medico_8;
	RELEASE SAVEPOINT medico_8;
	ROLLBACK TO medico_4;
    
COMMIT;
		
SELECT * FROM centro_medicina_prepaga.medico;
###############################################







	


