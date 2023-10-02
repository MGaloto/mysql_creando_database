CREATE VIEW pagos_proveedores AS
SELECT proveedor.nombre AS Nombre_proveedor,
 proveedor.mail AS Mail_proveedor, 
 pagos.fecha_transaccion AS Fecha_pago, 
 pagos.importe AS Importe
FROM proveedor 
INNER JOIN pagos 
ON proveedor.id_proveedor = pagos.id_proveedor
ORDER BY pagos.importe DESC;