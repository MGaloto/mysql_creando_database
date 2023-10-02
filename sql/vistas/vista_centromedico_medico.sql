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