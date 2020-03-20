# sample52.py

#덧셈 뺄셈 곱셈 기능 만들기
class Screen :
    # --------------------
    # 속성의 종류
    # --------------------
    # 1) 객체의 고유한 속성
    # 2) 집합관계에 있는 부품
    # 3) 시간에 따라 값이 변하는 상태(예 : 속도)

    pass

class FourCal :

    def __init__(self) : 
        # 객체를 통해서, 생성한 속성(필드)을 OOP에서는, "인스턴스 필드(=객체변수)"라고 부른다!!
        self.result = 0        # 연산결과를 보존하는 속성 선언
        self.screen = Screen() # 집합관계 : 부품을 결합
            

        pass # constructor

    def add(self,newOperand) :
        self.result += newOperand

        screen = Screen()
        screen.mro # 사용관계로 만들어 쓰는? 필요할 때 반짝 만들어 쓰는? 1회성
        return self.result 
        pass 
    
    def mul(self,newOperand) :
        self.result *= newOperand
        return self.result
        pass

    def sub(self,newOperand) :
        self.result -= newOperand
        return self.result
        pass

    def div(self, newOperand) :
        # self.result = self.result / newOperand
        self.result /= newOperand
        return self.result
        pass

pass # end class

calc1 = FourCal()

import pprint as pp
pp.pprint(dir(calc1)) # 객체의 모든 멤버를 리스트형태로 리턴하고, pp는 보기좋게 보여줘라 이뜻. 
# calc2 = FourCal()

# print(calc1.add(1))        # result + 1 == 1
# print(calc1.mul(2))        # 1 * 2 == 2
# print(calc1.div(3) )       # 2 / 3 = .6666666666
# print(calc1.sub(4.4) )     # .66666/4.4