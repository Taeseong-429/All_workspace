class Screen:
    #---------------------
    # 속성의 종류
    #---------------------
    # 1) 객체의 고유한 속성
    # 2) 집합관계에 있는 부품
    # 3) 시간에 따라 값이 변하는 상태(예: 속도)

    pass

class FourCal:

    # setdata --> Constructor로 변경
    def __init__(self):
        # 객체를 통해서, 생성한 속성(필드)을 
        # OOP에서는, "인스턴스 필드(=객체변수)"라고 부른다!!!
         self.result = 0    # 연산결과를 보존하는 속성 선언3

         self.screen = Screen() # 집합관계: 부품을 결합

         pass # constructor

    def add(self, newOperand):    # 덧셈결과 반환
         self.result += newOperand

         screen = Screen()
         screen.mro

         return self.result
         pass # add
        
    def mul(self, newOperand):    # 곱셈결과 반환
         self.result *= newOperand

         return self.result
         pass # mul
        
    def sub(self, newOperand):    # 뺄셈결과 반환
         self.result -= newOperand

         return self.result
         pass # sub
        
    def div(self, newOperand):    # 나눗셈결과 반환
         self.result /= newOperand

         return self.result
         pass # div

    pass # end class


calc1 = FourCal()

import pprint as pp
pp.pprint(dir(calc1))



# print(type(calc1))

# calc2 = FourCal()

# print(calc1.add(1))        # result + 1 == 1
# print(calc1.mul(2))        # 1 x 2 = 2
# print(calc1.div(3))        # 2 / 3 = .66666666666
# print(calc1.sub(4.4))      # .666... - 4.4 = ??


# print(dir(FourCal))