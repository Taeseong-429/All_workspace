# Python Module: mod1

# To make a python module.
if (__name__ == '__main__'):

    print('The name of "mod1" is', __name__)
    print('---------------------mod1 start -----------------')
def add(num1, num2):
    return num1 + num2
    pass

def sub(num1, num2):
    return num1 - num2
    pass

mulFunc = lambda num1, num2 : num1 * num2

PI = 3.14159   # 원주율

class Mod1Class:
    staticField = 10

    def __init__(self):
        print('Mod1Class::Constructor invoked.')

        super().__init__() # 부모생성자 호출-> 부모객체생성(최상위Class)
        self.instanceField = 20
        
        pass # constructor

    def method1(self):
        print('Mod1Class::method1 invoked.')
        
        pass
    pass

print('----------------------mod1 end-----------------')