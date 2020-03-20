# pyoracle.py

import pandas_oracle.tools as pt


query = "SELECT * FROM emp"

conn = pt.open_connection('PANDAS\oracle\config.yml')
# print('1. conn:', type(conn), conn)

df_emp = pt.query_to_df(query, conn, 1000)

df_emp.info()
print(df_emp)

pt.close_connection(conn)

#--------------------------------------------------------------#

emp_json = df_emp.to_json()
print(emp_json)

with open('emp.json', 'w') as f:
    f.write(emp_json)
    pass
