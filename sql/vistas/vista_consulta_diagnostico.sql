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