# sample49.py

# How to use runtime arguments

# import sys
# import temp

# print(type(sys))
# print(id(sys))
# print(dir(sys))
# print(sys)

# print("My name is sample49.py Hello")

# print("- name:", temp.name)

# print(temp.tempFunc())

# result = temp.lambdaFunc()

# print('- result :',result)

import sys

print(type(sys.argv))

print(id(sys.argv))

print(sys.argv)

for arg in sys.argv:
    print("- arg :", arg)
    pass

import sample50

print ('-result :', sample50.Calculator.add())