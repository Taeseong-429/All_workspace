# sample38.py

# 두 양수만 덧셈을 수행
def add(num1, num2):
    print('- add({}, {}) invoked.'.format(num1, num2))

    if(num1 <= 0) or (num2 <= 0):
        return -1
        pass

    result = num1 + num2
    return result
    pass

print(type(add))
print(id(add))
print(add)

# 함수호출 --> Function Call(X) --> Function Invocation
# Invoke(동사) : 호출하다
result = add(1, 2)
add(1, 2)

#-------------------------------------------
# 정의된 함수는 변수에 저장할 수 있다!!!!!
#-------------------------------------------

func = add
print(func)

result1 = add(3, 4)     # 함수명으로 함수를 호출
result2 = func(3, 4)    # 변수명으로 함수를 호출


def add2(addFunction, num1, num2):
    return addFunction(num1, num2)
    pass

result3 = add2(func, 4, 4)
#---------------------------------------------
# 함수의 특수한 성질: 이 성질은 C언어의 함수포인터의 개념과 같다!
#   1) 함수도 객체이다 ('function' type)
#   2) 함수는 변수에 저장할 수 있다
#   3) 함수를 저장한 변수로, 함수를 호출할 수 있다
#   4) 함수는 다른 함수의 매개변수로 전달가능하다
#   5) 함수는 다른 함수의 return 키워드의 반환값으로 지정가능하다
#   6) 함수를 저장한 변수나, 함수명이나 같다!!!
#---------------------------------------------
print('-'*50)

def returnFunc(function):
    print('- returnFunc({}) invoked.'.format(function))

    return function
    pass

result4 = returnFunc(add)
print("return4:", result4)
print( result4(7, 7) )