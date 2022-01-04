
# ------- Conexion a Base de Datos: ------- #
    
# Instalar el paquete PyMySql

import pymysql

with open('Keys.txt') as claves: keys = [clave for clave in claves]

connection = pymysql.connect(host= keys[0].strip('\n'), 
                             user= keys[1].strip('\n'), 
                             password= keys[2].strip('\n'), 
                             db='centro_medicina_prepaga' )


#%%

# Query SQL para crear las Tablas:

sql_create_table_afiliado= """
      CREATE TABLE IF NOT EXISTS afiliado (
            id_afiliado INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
            nombre VARCHAR(50) NOT NULL,
            apellido VARCHAR(50) NOT NULL,
            email VARCHAR(50) NOT NULL,
            telefono INT NOT NULL,
            fecha_nacimiento DATE NOT NULL,
            domicilio VARCHAR(50) NOT NULL,
            ocupacion VARCHAR(50) NOT NULL,
            estado_civil VARCHAR(50) NOT NULL,
            plan VARCHAR(50) NOT NULL
            );
            """

sql_create_table_especialidad= """

    CREATE TABLE IF NOT EXISTS especialidad (
            id_especialidad INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
            especialidad VARCHAR(50) NOT NULL
            );
            """

    
sql_create_table_medico= """
    
    CREATE TABLE IF NOT EXISTS medico (
            
            id_medico INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
            nombre VARCHAR(50) NOT NULL,
            apellido VARCHAR(50) NOT NULL,
            fecha_nacimiento DATE NOT NULL,
            domicilio VARCHAR(50) NOT NULL,
            telefono INT NOT NULL
            );
            """
    
sql_create_table_insumos= """
    
    CREATE TABLE IF NOT EXISTS insumos (
            id_insumo INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
            tipo VARCHAR(50) NOT NULL,
            proveedor VARCHAR(50) NOT NULL
            
            );
            """

sql_create_table_centro_medico= """

    CREATE TABLE IF NOT EXISTS centro_medico (

            id_centro INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
            nombre VARCHAR(50) NOT NULL,
            direccion VARCHAR(50) NOT NULL,
            telefono INT NOT NULL,
            id_insumo INT NOT NULL,
            FOREIGN KEY (id_insumo) REFERENCES insumos(id_insumo),
            id_medico INT NOT NULL,
            FOREIGN KEY (id_medico) REFERENCES medico(id_medico),
            id_especialidad INT NOT NULL,
            FOREIGN KEY (id_especialidad) REFERENCES especialidad(id_especialidad),
            id_afiliado INT NOT NULL,
            FOREIGN KEY (id_afiliado) REFERENCES afiliado(id_afiliado)
            
            );
            """

sql_create_table_turnos= """

    CREATE TABLE IF NOT EXISTS turnos (

            id_turno INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
            consulta VARCHAR(50) NOT NULL,
            diagnostico VARCHAR(50) NOT NULL,
            fecha DATE NOT NULL,
            id_medico INT NOT NULL,
            FOREIGN KEY (id_medico) REFERENCES medico(id_medico),
            id_afiliado INT NOT NULL,
            FOREIGN KEY (id_afiliado) REFERENCES afiliado(id_afiliado)
            
            );   
            """
            
            
sql_create_table_insumo_centro= """

    CREATE TABLE IF NOT EXISTS insumo_centro (

            id_insumo INT NOT NULL,
            FOREIGN KEY (id_insumo) REFERENCES insumos(id_insumo),
            id_centro INT NOT NULL,
            FOREIGN KEY (id_centro) REFERENCES centro_medico(id_centro)
            
            );
            """

#%%

# Ejecutar los comandos:

cursor = connection.cursor()

cursor.execute(sql_create_table_afiliado)
cursor.execute(sql_create_table_especialidad)
cursor.execute(sql_create_table_medico)
cursor.execute(sql_create_table_insumos)
cursor.execute(sql_create_table_centro_medico)
cursor.execute(sql_create_table_turnos)
cursor.execute(sql_create_table_insumo_centro)

#%%

# Chequeamos que las tablas esten creadas:

cursor.execute("USE centro_medicina_prepaga;")
cursor.execute("Show tables;")

tablas = cursor.fetchall()


for i in tablas:
    print(i)


#%%

# Cerrar el Cursor y la Conexion:

cursor.close()

connection.close()



#%%