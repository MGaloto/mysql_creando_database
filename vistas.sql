
USE centro_medicina_prepaga;

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





CREATE VIEW vista_centromedico_medico AS
SELECT medico.nombre AS Nombre_Medico,
 medico.apellido AS Apellido_Medico,
 medico.telefono AS Telefono_Medico,
 centro_medico.nombre AS Nombre_Centro
FROM turnos 
INNER JOIN centro_medico 
ON turnos.id_centro = centro_medico.id_centro
INNER JOIN medico 
ON turnos.id_medico = medico.id_medico
ORDER BY turnos.fecha DESC;






CREATE VIEW vista_afiliado_planfamiliar AS
SELECT afiliado.nombre AS Nombre_Afiliado,
 afiliado.apellido AS Apellido_Afiliado, 
 plan_familiar.tipo AS Plan_Familiar
FROM turnos 
INNER JOIN afiliado 
ON turnos.id_afiliado = afiliado.id_afiliado
INNER JOIN plan_familiar 
ON turnos.id_plan_familiar = plan_familiar.id_plan_familiar
ORDER BY afiliado.nombre DESC;





CREATE VIEW vista_cantidad_especialidad AS
SELECT COUNT(especialidad.especialidad) AS Cantidad_Por_Especialidad, 
especialidad
FROM especialidad
GROUP BY especialidad
ORDER BY Cantidad_Por_Especialidad DESC;




