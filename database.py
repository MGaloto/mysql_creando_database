
# ------- Conexion a Base de Datos: ------- #
    
# Instalar el paquete PyMySql

import pymysql

with open('Keys.txt') as claves: keys = [clave for clave in claves]

connection = pymysql.connect(host= keys[0].strip('\n'), 
                             user= keys[1].strip('\n'), 
                             password= keys[2].strip('\n'), 
                             db='centro_medicina_prepaga' )


cursor = connection.cursor()


#%%

# Query SQL para crear las Tablas:

sql_create_table_afiliado= """
      CREATE TABLE IF NOT EXISTS afiliado (
            id_afiliado INT PRIMARY KEY AUTO_INCREMENT,
            nombre VARCHAR(50) ,
            apellido VARCHAR(50) ,
            email VARCHAR(50) ,
            telefono INT ,
            fecha_nacimiento DATE ,
            domicilio VARCHAR(50) ,
            ocupacion VARCHAR(50) ,
            estado_civil VARCHAR(50) ,
            plan VARCHAR(50) ,
            dni INT 
            );
            """

sql_create_table_especialidad= """

    CREATE TABLE IF NOT EXISTS especialidad (
            id_especialidad INT PRIMARY KEY AUTO_INCREMENT,
            especialidad VARCHAR(50) 
            );
            """

    
sql_create_table_medico= """
    
    CREATE TABLE IF NOT EXISTS medico (
            
            id_medico INT PRIMARY KEY AUTO_INCREMENT,
            nombre VARCHAR(50) ,
            apellido VARCHAR(50) ,
            fecha_nacimiento DATE ,
            domicilio VARCHAR(50) ,
            telefono INT 
            );
            """
    
sql_create_table_plan_familiar= """
    
    CREATE TABLE IF NOT EXISTS plan_familiar (
            id_plan_familiar INT PRIMARY KEY AUTO_INCREMENT,
            tipo VARCHAR(50) ,
            fecha_alta DATE,
            total_consultas INT
            
            );
            """

sql_create_table_centro_medico= """

    CREATE TABLE IF NOT EXISTS centro_medico (

            id_centro INT PRIMARY KEY AUTO_INCREMENT,
            nombre VARCHAR(50) ,
            direccion VARCHAR(50) ,
            telefono INT ,
            cod_postal INT ,
            email VARCHAR(50) 
            
            );   
            """


sql_create_table_consulta = """

    CREATE TABLE IF NOT EXISTS consulta (

            id_consulta INT PRIMARY KEY AUTO_INCREMENT,
            consulta VARCHAR(50) ,
            diagnostico VARCHAR(50) 
            
            );
            """


sql_create_table_turnos = """

    CREATE TABLE IF NOT EXISTS turnos (

            id_turno INT  PRIMARY KEY AUTO_INCREMENT,
            fecha DATE,
            id_centro INT ,
            FOREIGN KEY (id_centro) REFERENCES centro_medico(id_centro) ,
            id_plan_familiar INT ,
            FOREIGN KEY (id_plan_familiar) REFERENCES plan_familiar(id_plan_familiar) ,
            id_medico INT ,
            FOREIGN KEY (id_medico) REFERENCES medico(id_medico) ,
            id_especialidad INT ,
            FOREIGN KEY (id_especialidad) REFERENCES especialidad(id_especialidad) ,
            id_afiliado INT ,
            FOREIGN KEY (id_afiliado) REFERENCES afiliado(id_afiliado) ,
            id_consulta INT ,
            FOREIGN KEY (id_consulta) REFERENCES consulta(id_consulta) 
            
            )engine = innodb;;
            """




#%%

# Ejecutar los comandos:

cursor.execute("""USE centro_medicina_prepaga;""")
cursor.execute(sql_create_table_afiliado)
cursor.execute(sql_create_table_especialidad)
cursor.execute(sql_create_table_medico)
cursor.execute(sql_create_table_plan_familiar)
cursor.execute(sql_create_table_centro_medico)
cursor.execute(sql_create_table_consulta)
cursor.execute(sql_create_table_turnos)


#%%

# Chequeamos que las tablas esten creadas:

cursor.execute("USE centro_medicina_prepaga;")
cursor.execute("Show tables;")

tablas = cursor.fetchall()


for i in tablas:
    print(i)


#%%

# Insertamos los valores



values_turnos = """

            LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/tablas/turnos.txt' 
            INTO TABLE turnos
            IGNORE 1 ROWS;
            
            """


values_afiliado = """

            LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/tablas/afiliado.txt' 
            INTO TABLE afiliado
            IGNORE 1 ROWS;
            
            """
            
values_centro_medico = """

            LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/tablas/centro_medico.txt' 
            INTO TABLE centro_medico
            IGNORE 1 ROWS;
            
            """
            
values_consulta = """

            LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/tablas/consulta.txt' 
            INTO TABLE consulta
            IGNORE 1 ROWS;
            
            """
            
values_especialidad = """

            LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/tablas/especialidad.txt' 
            INTO TABLE especialidad
            IGNORE 1 ROWS;
            
            """
            
values_medico = """

            LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/tablas/medico.txt' 
            INTO TABLE medico
            IGNORE 1 ROWS;
            
            """
            
            
values_plan_familiar = """

            LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/tablas/plan_familiar.txt' 
            INTO TABLE plan_familiar
            IGNORE 1 ROWS;
            
            """



#%%


cursor.execute(values_afiliado)
cursor.execute(values_centro_medico)
cursor.execute(values_consulta)
cursor.execute(values_especialidad)
cursor.execute(values_medico)
cursor.execute(values_plan_familiar)



#%%
cursor.execute(values_turnos)


#%%

# Ejemplo query del dni

consultadni = 'SELECT dni FROM afiliado'
cursor.execute(consultadni)
listadni = [dni[0] for dni in cursor] 



#%%

# Insertar valores desde el transaccional

while True:
    
    database = input('Desea darse de alta en nuestro sistema? (Si/No): \n')
    
    if database == 'No':
        print('Muchas gracias\n')
        break
    elif database == 'Si':
        print('Excelente, por favor comienza con tu dni para validarte en la base de datos\n')
        
        while True:
            dni = int(input('Ingrese su dni: \n'))
            if dni in listadni:
                print("el dni ya se encuentra en la base de datos\n")
                break
            else:
                id_afiliado = 'null'
                nombre = input('Ingrese su nombre: \n')
                apellido = input('Ingrese su apellido: \n')
                email = input('Ingrese su email: \n')     
                telefono = int(input('Ingrese su telefono: \n'))     
                fecha_nacimiento = input('Ingrese su fecha de nacimiento (AAAA-MM-DD): \n')
                domicilio = input('Ingrese su domicilio: \n')     
                ocupacion = input('Ingrese su ocupacion: \n')     
                estado_civil = input('Ingrese su estado civil: \n')     
                plan = input('Ingrese su plan deseado: (medium, premium o gold) \n')
                query = 'INSERT INTO afiliado (nombre, apellido, email, telefono, fecha_nacimiento, domicilio, ocupacion, estado_civil, plan, dni) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)'
                cursor.execute(query, (nombre, apellido, email, telefono, fecha_nacimiento, domicilio, ocupacion, estado_civil, plan, dni))
                connection.commit()
                print('Datos cargador, muchas gracias por darse de alta en nuestro sistema, dentro de las proximas horas un representante lo llamara al numero que ha ingresado')
                break
    else:
        print('Por favor colocar (Si/No)')

# Cerrar el Cursor y la Conexion:

cursor.close()

connection.close()


#%%

# Creando Vistas


# Query SQL para crear las Vistas:

sql_create_vista_consulta_diagnostico= """
            CREATE VIEW vista_consulta_diagnostico AS
            SELECT turnos.fecha AS Fecha_Turno, afiliado.nombre AS Nombre, afiliado.apellido AS Apellido, consulta.diagnostico AS Diagnostico, consulta.consulta AS Consulta
            FROM turnos 
            INNER JOIN afiliado 
            ON turnos.id_afiliado = afiliado.id_afiliado
            INNER JOIN consulta 
            ON turnos.id_consulta = consulta.id_consulta
            ORDER BY turnos.fecha DESC;
            """

sql_create_vista_medico_paciente= """

            CREATE VIEW vista_medico_paciente AS
            SELECT turnos.fecha AS Fecha_Turno, afiliado.nombre AS Nombre_Paciente, afiliado.apellido AS Apellido_Paciente, medico.nombre AS Nombre_Medico, medico.apellido AS Apellido_Medico
            FROM turnos 
            INNER JOIN afiliado 
            ON turnos.id_afiliado = afiliado.id_afiliado
            INNER JOIN medico 
            ON turnos.id_medico = medico.id_medico
            ORDER BY turnos.fecha DESC;
            """

    
sql_create_vista_centromedico_medico= """
    
            CREATE VIEW vista_centromedico_medico AS
            SELECT medico.nombre AS Nombre_Medico, medico.apellido AS Apellido_Medico, medico.telefono AS Telefono_Medico,centro_medico.nombre AS Nombre_Centro
            FROM turnos 
            INNER JOIN centro_medico 
            ON turnos.id_centro = centro_medico.id_centro
            INNER JOIN medico 
            ON turnos.id_medico = medico.id_medico
            ORDER BY turnos.fecha DESC;
            """
    
sql_create_vista_afiliado_planfamiliar= """
    
            CREATE VIEW vista_afiliado_planfamiliar AS
            SELECT afiliado.nombre AS Nombre_Afiliado, afiliado.apellido AS Apellido_Afiliado, plan_familiar.tipo AS Plan_Familiar
            FROM turnos 
            INNER JOIN afiliado 
            ON turnos.id_afiliado = afiliado.id_afiliado
            INNER JOIN plan_familiar 
            ON turnos.id_plan_familiar = plan_familiar.id_plan_familiar
            ORDER BY afiliado.nombre DESC;
            """

sql_create_vista_cantidad_especialidad= """

            CREATE VIEW vista_cantidad_especialidad AS
            SELECT COUNT(especialidad.especialidad) AS Cantidad_Por_Especialidad, especialidad
            FROM especialidad
            GROUP BY especialidad
            ORDER BY Cantidad_Por_Especialidad DESC;
            """




#%%

# Ejecutar los comandos:

cursor.execute(sql_create_vista_consulta_diagnostico)
cursor.execute(sql_create_vista_medico_paciente)
cursor.execute(sql_create_vista_centromedico_medico)
cursor.execute(sql_create_vista_afiliado_planfamiliar)
cursor.execute(sql_create_vista_cantidad_especialidad)


#%%


