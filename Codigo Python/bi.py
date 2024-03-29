# ------- Conexion a Base de Datos: ------- #
    

import pymysql
import pandas as pd
import os
from dotenv import load_dotenv

load_dotenv()




connection = pymysql.connect(host= os.getenv('LOCALHOST'), 
                             user= os.getenv('ROOT'), 
                             password= os.getenv('NUMBER'), 
                             db='centro_medicina_prepaga' )


cursor = connection.cursor()

#%%

# ------- Creando un Data Frame desde My Sql: ------- #


query = 'SELECT * FROM vista_consulta_diagnostico'

cursor.execute(query)


df = pd.read_sql(query, connection)


df.to_excel('df.xlsx', index=False)


#%%

query_2 = '''SELECT proveedor.nombre AS nombre_proveedor,
            pagos.fecha_transaccion AS fecha_pago,
            SUM(pagos.importe) AS pago_total
            FROM proveedor 
            INNER JOIN pagos 
            ON proveedor.id_proveedor = pagos.id_proveedor
            GROUP BY  proveedor.nombre
            ORDER BY pago_total DESC;'''

cursor.execute(query_2)


df_2 = pd.read_sql(query_2, connection)


df_2.to_excel('df_2.xlsx', index=False)


#%%


