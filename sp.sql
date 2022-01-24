

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_centromedico_turno`(IN fecha DATE, 
IN id_centro INT, 
IN id_plan_familiar INT,
IN id_medico INT,
IN id_especialidad INT,
IN id_afiliado INT,
IN id_consulta INT)
BEGIN
INSERT INTO turnos(fecha,id_centro,id_plan_familiar,id_medico,id_especialidad,id_afiliado,id_consulta) 
VALUES(fecha,id_centro,id_plan_familiar,id_medico,id_especialidad,id_afiliado,id_consulta);
    END$$
DELIMITER ;

CALL sp_centromedico_turno('2022-01-24', 10, 10, 9, 10, 10, 10)


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