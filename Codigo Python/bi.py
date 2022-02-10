# ------- Conexion a Base de Datos: ------- #
    

import pymysql
import pandas as pd

with open('Keys.txt') as claves: keys = [clave for clave in claves]

connection = pymysql.connect(host= keys[0].strip('\n'), 
                             user= keys[1].strip('\n'), 
                             password= keys[2].strip('\n'), 
                             db='centro_medicina_prepaga' )


cursor = connection.cursor()

#%%

# ------- Creando un Data Frame desde My Sql: ------- #

query = 'SELECT * FROM vista_consulta_diagnostico'


cursor.execute(query)


df = pd.read_sql(query, connection)


df.to_excel('df.xlsx', index=False)



#%%


