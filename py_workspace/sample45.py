# sample45.py

# 람다식 = Lambda Expression
# 람다식의 목표는 단 한가지: 
#       익명함수(Anonymous Function) 정의(선언)

# 1. def 키워드로 덧셈함수 선언
# def add(num1, num2):
#     return num1 + num2
#     pass

# result = add(1, 3)
# print(result)

# 2. 람다식을 이용한 덧셈수행
# print('-'*30)

# 덧셈함수(add)를 람다식으로 구현
add = lambda num1, num2 : num1 + num2        # OK
# add = lambda num1, num2 : return num1+num2  # X
# add = lambda ( num1, num2 ) : num1+num2    # X
# add = lambda () : 1+2                      # X

# num1 = 10
# num2 = 30

print(type(int))        # <class 'int>
# print(type(lambda))     # lambda: 파이썬 언어의 키워드(예약어)

# add = lambda  : num1+num2                     # OK : 권하지않는다!!!(함수의 독립성을 훼손시키는 코드)
# add = lambda   : 1 + 2
# add = lambda   : print('Hello!')
# add = lambda num1, num2: num1+num2 ; print(777) # OK 편법

# print(type(add))
# print(id(add))
# print(add)

result = add(1,3)
print("- result:", result)
