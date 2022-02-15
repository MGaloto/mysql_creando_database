SELECT * FROM centro_medicina_prepaga.proveedor;

SELECT * FROM centro_medicina_prepaga.pagos;

SELECT proveedor.nombre AS nombre_proveedor,
 pagos.fecha_transaccion AS fecha_pago,
 SUM(pagos.importe) AS pago_total
FROM proveedor 
INNER JOIN pagos 
ON proveedor.id_proveedor = pagos.id_proveedor
GROUP BY  proveedor.nombre
ORDER BY pago_total DESC;
