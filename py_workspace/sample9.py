globalVariable = 1

def func1():
    print('func1 invoked.')
    pass

lambdaFunc = lambda : print('lambda func invoked.')

class Bike:
    def __init__(self):
        print('Bike::constructor invoked.')
        super().__init__()
        pass

    def method1(self):
        print('Bike::method1 invoked.')
        pass

    pass

#---------------------------------------------------------------#
import temp.temp as t
# print(type(t))
# print(dir(t))
# print(id(t))
# print("-t:", t)

print(t.func2())
print(t.funcInTemp())
print(t.number)
print(t.__name__)


from temp2 import temp as t1
print(dir(t1))

print('__name__:', __name__)

import os
print('1. os.getcwd():', os.getcwd())

import game
print('2. os.getcwd():', os.getcwd())
