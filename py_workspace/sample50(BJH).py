# sample50.py

# Calculator : 덧셈기능만 구현

# 1. 연산결과를 보존하지 못하는 덧셈 계산기

def add(num1, num2):
    result = num1 + num2
    return result
    pass

result = add(1, 2)
result = add(result, 3)

def add2(num1, num2):
    # result = num1 + num2
    # return result
    return add(num1, num2)
    pass

result2 = add(4 ,5)
result2 = add(result2, 6)

class Calculator:
    def __init__(self):     # init : 생성자
        self.result = 0     # 속성의 초기값 배정

    def add(self, *num):
        
        for i in num:
            self.result += i
        
        return self.result

cal1 = Calculator()

print(cal1.add(3,4,5))
print(cal1.add(4,5))