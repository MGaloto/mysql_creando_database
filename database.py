
import pymysql
import os
from dotenv import load_dotenv
from datetime import datetime

load_dotenv()

class ConfigDataBase():

    def __init__(self):
        self.date = self.getDateNow()
        self.conn = self.connect()
        self.cursor = self.conn.cursor()
    
    def getDateNow(self):
        fecha_hora_actual = datetime.now()
        formato = "%Y-%m-%d %H:%M:%S.%f"
        date = fecha_hora_actual.strftime(formato)[:-3]
        return date
    
    def connect(self):
        try:
            conn = pymysql.connect(host= os.getenv('LOCALHOST'), 
                             user= os.getenv('ROOT'), 
                             password= os.getenv('NUMBER'))
        except Exception  as e:
            print(f"Error: {e}")
        return conn
    

    def run(self):
        
        try:
            self.cursor.execute("""CREATE SCHEMA IF NOT EXISTS centro_medicina_prepaga;""")
            self.cursor.execute("""USE centro_medicina_prepaga;""")
            self.cursor.execute("""
                CREATE TABLE IF NOT EXISTS medico (
                id_medico INT PRIMARY KEY AUTO_INCREMENT,
                nombre VARCHAR(50) ,
                apellido VARCHAR(50) ,
                fecha_nacimiento DATE ,
                domicilio VARCHAR(50) ,
                telefono INT 
                );
                """)
            self.cursor.execute("""
                CREATE TABLE IF NOT EXISTS ocupacion_afiliado (
                id_ocupacion INT  PRIMARY KEY AUTO_INCREMENT,
                ocupacion VARCHAR(50) 
                );
                """)
            self.cursor.execute("""
                CREATE TABLE IF NOT EXISTS plan_afiliado (
                id_plan INT  PRIMARY KEY AUTO_INCREMENT,
                nombre VARCHAR(50) 
                );
                """)
            self.cursor.execute("""
                CREATE TABLE IF NOT EXISTS consulta (
                id_consulta INT PRIMARY KEY AUTO_INCREMENT,
                consulta VARCHAR(50) ,
                diagnostico VARCHAR(50) 
                );
                """)
            self.cursor.execute("""
                CREATE TABLE IF NOT EXISTS medio_operacion (
                id_medio_operacion INT  PRIMARY KEY AUTO_INCREMENT,
                tipo_medio_operacion VARCHAR(50) 
                );
                """)
            self.cursor.execute("""
                CREATE TABLE IF NOT EXISTS proveedor (
                id_proveedor INT PRIMARY KEY AUTO_INCREMENT,
                nombre VARCHAR(50) ,
                telefono INT,
                cuit INT ,
                mail VARCHAR(50) 
                );
                """)
            self.cursor.execute("""
                CREATE TABLE IF NOT EXISTS centro_medico (
                id_centro INT PRIMARY KEY AUTO_INCREMENT,
                nombre VARCHAR(50) ,
                direccion VARCHAR(50) ,
                telefono INT ,
                cod_postal INT ,
                email VARCHAR(50) ,
                especialidad_principal VARCHAR(50) 
                );
                """)
            self.cursor.execute("""
                CREATE TABLE IF NOT EXISTS tipo_insumo (
                id_tipo_insumo INT  PRIMARY KEY AUTO_INCREMENT,
                tipo_insumo VARCHAR(50) 
                );
                """)
            self.cursor.execute("""
                CREATE TABLE IF NOT EXISTS afiliado (
                id_afiliado INT  PRIMARY KEY AUTO_INCREMENT,
                nombre VARCHAR(50) ,
                apellido VARCHAR(50) ,
                email VARCHAR(50) ,
                telefono INT ,
                fecha_nacimiento DATE ,
                domicilio VARCHAR(50) ,
                estado_civil VARCHAR(50) ,
                dni INT ,
                id_plan INT ,
                id_ocupacion INT ,
                FOREIGN KEY (id_plan) REFERENCES plan_afiliado(id_plan) ,
                FOREIGN KEY (id_ocupacion) REFERENCES ocupacion_afiliado(id_ocupacion) 
                )engine = innodb;
                """)
            self.cursor.execute("""
                CREATE TABLE IF NOT EXISTS cobros (
                id_cobros INT  PRIMARY KEY AUTO_INCREMENT,
                fecha_transaccion DATE ,
                importe INT ,
                id_medio_operacion INT ,
                id_afiliado INT ,
                FOREIGN KEY (id_medio_operacion) REFERENCES medio_operacion(id_medio_operacion) ,
                FOREIGN KEY (id_afiliado) REFERENCES afiliado(id_afiliado) 
                )engine = innodb;
                """)
            self.cursor.execute("""
                CREATE TABLE IF NOT EXISTS pagos (
                id_pagos INT  PRIMARY KEY AUTO_INCREMENT,
                fecha_transaccion DATE ,
                importe BIGINT ,
                id_medio_operacion INT ,
                id_proveedor INT ,
                FOREIGN KEY (id_medio_operacion) REFERENCES medio_operacion(id_medio_operacion) ,
                FOREIGN KEY (id_proveedor) REFERENCES proveedor(id_proveedor) 
                )engine = innodb;
                """)
            self.cursor.execute("""
                CREATE TABLE IF NOT EXISTS turnos (
                id_turno INT  PRIMARY KEY AUTO_INCREMENT,
                fecha DATE ,
                id_centro INT ,
                id_medico INT ,
                id_afiliado INT ,
                id_consulta INT ,
                FOREIGN KEY (id_centro) REFERENCES centro_medico(id_centro) ,
                FOREIGN KEY (id_medico) REFERENCES medico(id_medico) ,
                FOREIGN KEY (id_afiliado) REFERENCES afiliado(id_afiliado) ,
                FOREIGN KEY (id_consulta) REFERENCES consulta(id_consulta) 
                )engine = innodb;
                """)
            self.cursor.execute("""
                CREATE TABLE IF NOT EXISTS insumos (
                id_insumo INT  PRIMARY KEY AUTO_INCREMENT,
                nombre VARCHAR(50) ,
                id_tipo_insumo INT ,
                id_proveedor INT ,
                FOREIGN KEY (id_tipo_insumo) REFERENCES tipo_insumo(id_tipo_insumo) ,
                FOREIGN KEY (id_proveedor) REFERENCES proveedor(id_proveedor) 
                )engine = innodb;
                """)
            self.cursor.execute("""
                CREATE TABLE IF NOT EXISTS centro_medico_insumos (
                id_centro_medico_insumos INT  PRIMARY KEY AUTO_INCREMENT,
                id_centro INT ,
                id_insumo INT ,
                FOREIGN KEY (id_centro) REFERENCES centro_medico(id_centro) ,
                FOREIGN KEY (id_insumo) REFERENCES insumos(id_insumo) 
                )engine = innodb;
                """)
        except Exception  as e:
            print(f"Error: {e}")

        self.conn.commit()

    
    def insert_data(self):
        folder = "sql"
        sql_files = [
            '/medico', # replicar en todas las demas tablas
            '/ocupacion_afiliado',
            '/plan_afiliado',
            '/consulta',
            '/medio_operacion',
            '/proveedor',
            '/centro_medico',
            '/afiliado',
            '/tipo_insumo',
            '/cobros',
            '/pagos',
            '/turnos',
            '/insumos',
            '/centro_medico_insumos'
        ]
        for file in sql_files:

            with open(folder+file+".sql", 'r') as sql_file:
                sql_commands = sql_file.read().split(";")
                for command in sql_commands:
                    if command.strip():
                        self.cursor.execute(command)

        self.conn.commit()
        self.cursor.close()


if __name__ == "__main__":

    obj = ConfigDataBase()
    obj.run()
    obj.insert_data()
    print("finish")
    







#%%





#%%

# Ejecutar los comandos:


# cursor.execute(sql_create_table_ocupacion_afiliado)
# cursor.execute(sql_create_table_plan_afiliado)
# cursor.execute(sql_create_table_consulta)
# cursor.execute(sql_create_table_medio_operacion)
# cursor.execute(sql_create_table_proveedor)
# cursor.execute(sql_create_table_centro_medico)
# cursor.execute(sql_create_table_tipo_insumo)
# cursor.execute(sql_create_table_afiliado)
# cursor.execute(sql_create_table_cobros)
# cursor.execute(sql_create_table_pagos)
# cursor.execute(sql_create_table_turnos)
# cursor.execute(sql_create_table_insumos)
# cursor.execute(sql_create_table_centro_medico_insumos)


# #%%

# # Chequeamos que las tablas esten creadas:

# cursor.execute("USE centro_medicina_prepaga;")
# cursor.execute("Show tables;")

# tablas = cursor.fetchall()


# for i in tablas:
#     print(i)





# #%%

# # Ejemplo query del dni

# consultadni = 'SELECT dni FROM afiliado'
# cursor.execute(consultadni)
# listadni = [dni[0] for dni in cursor] 



# #%%

# # Insertar valores desde el transaccional

# while True:
    
#     database = input('Desea darse de alta en nuestro sistema? (Si/No): \n')
    
#     if database == 'No':
#         print('Muchas gracias\n')
#         break
#     elif database == 'Si':
#         print('Excelente, por favor comienza con tu dni para validarte en la base de datos\n')
        
#         while True:
#             dni = int(input('Ingrese su dni: \n'))
#             if dni in listadni:
#                 print("el dni ya se encuentra en la base de datos\n")
#                 break
#             else:
#                 id_afiliado = 'null'
#                 nombre = input('Ingrese su nombre: \n')
#                 apellido = input('Ingrese su apellido: \n')
#                 email = input('Ingrese su email: \n')     
#                 telefono = int(input('Ingrese su telefono: \n'))     
#                 fecha_nacimiento = input('Ingrese su fecha de nacimiento (AAAA-MM-DD): \n')
#                 domicilio = input('Ingrese su domicilio: \n')      
#                 estado_civil = input('Ingrese su estado civil: \n')     
#                 id_plan = int(input('Ingrese su id_plan: \n'))  
#                 id_ocupacion = int(input('Ingrese su id_ocupacion: \n'))  
#                 query = 'INSERT INTO afiliado (nombre, apellido, email, telefono, fecha_nacimiento, domicilio, estado_civil, dni, id_plan, id_ocupacion) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)'
#                 cursor.execute(query, (nombre, apellido, email, telefono, fecha_nacimiento, domicilio, estado_civil, dni, id_plan, id_ocupacion))
#                 connection.commit()
#                 print('Datos cargador, muchas gracias por darse de alta en nuestro sistema, dentro de las proximas horas un representante lo llamara al numero que ha ingresado')
#                 break
#     else:
#         print('Por favor colocar (Si/No)')

# # Cerrar el Cursor y la Conexion:

# cursor.close()

# connection.close()




#%%




