# sample6.py
# 함수에 대해서 간략히 배워봅시다!!!
# 덧셈을 수행하는 함수(function)을 만들어 봅시다!(함수정의/선언)

""" 
def 함수이름():
    코드1
    코드2
    .... 
"""

def add(op1, op2):          # add 함수 정의(선언)
    result = op1 + op2

    return result


# 위에서 정의한 add 함수를 사용 --> "함수를 호출한다!!!"라고 함
# result = add(1, 2)
result111 = add(10, 10)
print(result111)


""" 주석1
주석2
주석3 """

food = "I like mother's food"
food = 'I like mother"s food'
food = "I like mother\"s food"