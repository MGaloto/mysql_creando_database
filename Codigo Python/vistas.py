
# Creando Vistas


# Query SQL para crear las Vistas:

sql_create_vista_consulta_diagnostico= """
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
            """

sql_create_vista_medico_paciente= """
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
            """

    
sql_create_vista_centromedico_medico= """
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
            """
    
sql_create_vista_cobros_afiliados= """
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
            """

sql_create_vista_pagos_proveedores= """
            CREATE VIEW pagos_proveedores AS
            SELECT proveedor.nombre AS Nombre_proveedor,
             proveedor.mail AS Mail_proveedor, 
             pagos.fecha_transaccion AS Fecha_pago, 
             pagos.importe AS Importe
            FROM proveedor 
            INNER JOIN pagos 
            ON proveedor.id_proveedor = pagos.id_proveedor
            ORDER BY pagos.importe DESC;
            """




#%%

# Ejecutar los comandos:

cursor.execute(sql_create_vista_consulta_diagnostico)
cursor.execute(sql_create_vista_medico_paciente)
cursor.execute(sql_create_vista_centromedico_medico)
cursor.execute(sql_create_vista_cobros_afiliados)
cursor.execute(sql_create_vista_pagos_proveedores)


#%%
