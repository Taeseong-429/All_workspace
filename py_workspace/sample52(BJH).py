# sample52.py
class Screen:
    # 속성의 종류
    # 1) 객체의 고유한 속성
    # 2) 집합관계에 있는 부품
    # 3) 시간에 따라 값이 변하는 상태(예: 속도)
    pass

class FourCal:
    #setdata --> Constructor로 변경
    def __init__(self):
        # 객체를 통해서, 생성한 (속성)을
        # OOP에서는, "인스턴스 필드(=객체변수)"라고 부른다. 
        self.result = 0     #연산결과를 보존하는 속성 선언3
        self.screen = Screen
        pass
    
    def add(self, op):
        self.result += op
        return self.result
        pass

    def mul(self, op):
        self.result *= op
        return self.result
        pass

    def sub(self, op):
        self.result -= op
        return self.result
        pass

    def div(self, op):
        self.result /= op
        return self.result
        pass

Cal1 = FourCal()
# Cal2 = FourCal()

import pprint as pp

pp.pprint(dir(Cal1))

# print(Cal1.add(1))
# print(Cal1.mul(2))
# print(Cal1.div(3))
# print(Cal1.sub(4.4))