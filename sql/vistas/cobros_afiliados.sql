CREATE VIEW cobros_afiliados AS
SELECT afiliado.nombre AS Nombre_Afiliado,
 afiliado.apellido AS Apellido_Afiliado, 
 afiliado.id_afiliado AS Id_afiliado, 
 cobros.fecha_transaccion AS Fecha_Cobro,
 cobros.importe AS Importe_Cobro
FROM afiliado 
INNER JOIN cobros 
ON afiliado.id_afiliado = cobros.id_afiliado
ORDER BY afiliado.nombre DESC;