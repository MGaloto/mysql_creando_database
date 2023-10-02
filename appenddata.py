
import pymysql
import os
from dotenv import load_dotenv
from datetime import datetime

load_dotenv()

class AppendData():

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
            self.cursor.execute("""USE centro_medicina_prepaga;""")
            while True:
                database = input('Desea darse de alta en nuestro sistema? (Si/No): \n')
                if database == 'No':
                    print('Muchas gracias\n')
                    break
                elif database == 'Si':
                    print('Excelente, por favor comienza con tu dni para validarte en la base de datos\n')
                    while True:
                        dni = int(input('Ingrese su dni: \n'))
                        self.cursor.execute("SELECT COUNT(*) FROM afiliado WHERE dni = %s", (dni,))
                        result = self.cursor.fetchone()
                        if result[0] > 0:
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
                            estado_civil = input('Ingrese su estado civil: \n')     
                            id_plan = int(input('Ingrese su id_plan: \n'))  
                            id_ocupacion = int(input('Ingrese su id_ocupacion: \n'))  
                            query = 'INSERT INTO afiliado (nombre, apellido, email, telefono, fecha_nacimiento, domicilio, estado_civil, dni, id_plan, id_ocupacion) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)'
                            self.cursor.execute(query, (nombre, apellido, email, telefono, fecha_nacimiento, domicilio, estado_civil, dni, id_plan, id_ocupacion))
                            self.conn.commit()
                            print('Datos cargador, muchas gracias por darse de alta en nuestro sistema, dentro de las proximas horas un representante lo llamara al numero que ha ingresado')
                            break
                else:
                    print('Por favor colocar (Si/No)')


        except Exception  as e:
            print(f"Error: {e}")

        self.cursor.close()


if __name__ == "__main__":

    obj = AppendData()
    obj.run()
    print("finish")
    


