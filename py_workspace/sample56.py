# sample56.py

# To use python module 'mod1'

import mod1 as m1

print(dir(m1))
print(type(m1.Mod1Class))

obj = m1.Mod1Class()
print(obj)

print(m1.Mod1Class.staticField)
print(obj.instanceField)
print(obj.method1())

# print(__name__)
