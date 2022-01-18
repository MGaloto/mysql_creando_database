    
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


SELECT calcular_covid_diagnosticos('covid') as porcentaje_diagnostico;
    
    

DELIMITER $$
CREATE FUNCTION calcular_porcentaje_plan_familiar (plan varchar(100)) 
    RETURNS numeric(8,2)  
    NO SQL
    BEGIN
        DECLARE total_planes numeric(8,2);
        DECLARE total_plan numeric(8,2);
        SELECT count(tipo) INTO total_plan FROM plan_familiar WHERE tipo = plan;
        SELECT count(tipo) INTO total_planes FROM plan_familiar;
        RETURN ROUND((total_plan / total_planes)*100, 2);
    END$$
DELIMITER ;


SELECT calcular_porcentaje_plan_familiar('premium') as porcentaje_plan_familiar;
    