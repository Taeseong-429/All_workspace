# sample50.py

# Calculator : 덧셈기능만 구현

# 1. 연산결과를 보존하지 못하는 덧셈 계산기
def add(num1, num2):
    result = num1+num2
    return result
    pass

result = add(1, 2)
result = add(result, 3)

#------------------------------------

def add2(num1, num2):
    # result = num1+num2
    # return result
    return add(num1, num2)
    pass

result2 = add(4,5)
result2 = add(result2, 6)

