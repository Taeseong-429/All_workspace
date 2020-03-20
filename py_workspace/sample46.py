# sample46.py

# 전자계산기 - 4개 기능: 덧셈, 뺄샘, 곱셈, 나눗셈

# 1. 덧셈기능 구현 ---> 함수로 구현
def add(number1, number2):
    # result = number1 + number2
    # return result

    return ( number1 + number2 )
    pass

# 2. 덧셈기능 구현 --> lambda expression으로 구현
# 문법: lambda <매개변수선언부> : <값을생성하는표현식>
# 위 문법의 결과 --> '익명함수' 객체이다!!!!!
# Lvalue = Rvalue
addFunc = lambda  num1, num2 : ( num1 + num2 )

addResult = addFunc(44, 33)
print('- addResult:', addResult)

# 2. 두번째 함수
def div(number1, number2):
    return (number1 / number2)
    pass

divFunc = lambda no1, no2: (no1 / no2)
divResult = divFunc(2, 3)
print(divResult)

# 3. 세번째 def 함수
def nextYear(thisYear):
    return ( thisYear + 1 )
    pass


# 4. 네번째 def 함수
def sayHello(name):
    return "Hello, %s" % name
    pass

# 5. 다섯번째 def 함수
def sayHelloEveryone():
    return "Hello, Everyone !!!"
    pass

# 6. 여섯번째 def 함수
def sayHello2(name = 'Yoseph', age = 24):
    return "Hello, %s, %d" % (name, age)
    pass

sayhello2Func = \
    lambda \
        name = 'Yoseph', \
        age = 24: "Hello, %s, %d" \
        % (name, age)

hello1 = sayhello2Func() # 전달인자가 하나도 없는 경우
hello2 = sayhello2Func('Trinity')
hello3 = sayhello2Func('Trinity', 18)

# 람다식의 응용 예
# def func1():
#     return "func1"
#     pass

# def func2():
#     return "func2"
#     pass

switch = {
    1: ( lambda no1, no2: "func1" ),
    2: ( lambda : "func2" )
} # switch using function feature

choice = 1  # 사용자가 선택한 메뉴번호
switchResult = switch[choice](1,2)
