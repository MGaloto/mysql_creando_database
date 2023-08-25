
INSERT INTO cobros (id_cobros, fecha_transaccion, importe, id_medio_operacion, id_afiliado)
VALUES (NULL, '2022-01-01', 8500, 2, 1);


SELECT afiliado.nombre AS nombre_afiliado,
 afiliado.apellido AS nombre_afiliado,
 SUM(cobros.importe) AS pago_cuota,
 YEAR(cobros.fecha_transaccion) AS año_cuota,
 plan_afiliado.nombre AS plan
FROM afiliado 
INNER JOIN cobros 
ON cobros.id_afiliado = afiliado.id_afiliado
INNER JOIN plan_afiliado 
ON afiliado.id_plan = plan_afiliado.id_plan
GROUP BY  afiliado.id_afiliado
ORDER BY cobros.importe DESC;


