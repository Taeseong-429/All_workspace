# 실습.py
'''
1. 
data = {1,2,3,4,5,6,7,8,9,10}

for element in data:
    print(element)'''

'''
2. 
for i in range(2,10,2):
    for j in range(1,10):
        print(i*j,sep = '')
        pass # end j
    pass # end i'''

'''
3.
A = 1
B = 2
(A,B) = (B,A)'''

'''
4.
def func1():
    pass
def func2():
    pass
def func3():
    pass
switch = {1:func1, 2:func2, 3:func3}

number = int(input('메뉴를 입력하세요.'))

switch[number]()'''

'''
5.
class Calculator:
    def __init__(self):
        pass # __init__
    def add(self,num1,num2):
        return num1 + num2
    def sub(self,num1,num2):
        return num1 - num2
    def mul(self,num1,num2):
        return num1 * num2
    def div(self,num1,num2):
        return num1 / num2
    pass # Calcu '''
'''
l = [1,2,3,4,5,6,7,8,9,10]

condition = lambda num : True if (num % 2 != 0) else False
J = list(filter(condition,l))

print(J)'''