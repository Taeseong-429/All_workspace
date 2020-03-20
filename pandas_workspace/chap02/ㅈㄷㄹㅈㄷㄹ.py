import pandas as pd

emp_json = df_emp.to_json()
print(emp_json)

with open('emp.json', 'w') as f:
    f.write(emp_json)
    pass
