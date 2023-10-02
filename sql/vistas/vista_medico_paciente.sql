CREATE VIEW vista_medico_paciente AS
SELECT turnos.fecha AS Fecha_Turno,
 afiliado.nombre AS Nombre_Paciente, 
 afiliado.apellido AS Apellido_Paciente, 
 medico.nombre AS Nombre_Medico,
 medico.apellido AS Apellido_Medico
FROM turnos 
INNER JOIN afiliado 
ON turnos.id_afiliado = afiliado.id_afiliado
INNER JOIN medico 
ON turnos.id_medico = medico.id_medico
ORDER BY turnos.fecha DESC;