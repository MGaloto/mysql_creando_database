    
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

SELECT calcular_resultado();






