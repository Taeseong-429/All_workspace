# sample55.py

class Calculator:
    # 클래스변수(X) ---> 정적필드(static field)
    # 어느 특정 객체마다 고유하게 값을 가지고 있는
    # 필드가 아니라!!!!!!, 이 클래스로부터 생성된
    # 모든 객체에 공통적으로 사용가능한 공유필드!!!
    manufacturer = "A"
    count = 0

    def __init__(self):
        super().__init__()
        count += 1
        
        # color 속성 --> 이 클래스에서 생성된
        #                객체의 인스턴스 필드
        #                (= 객체변수)
        self.color = 'black'        
        pass

    def div(self, num1, num2):
        return num1 / num2
        pass # div

    pass # end class

calc = Calculator()
divResult = calc.div(5, 1)  # 5 / 0

print(Calculator.manufacturer)  # OK
print(calc.manufacturer)        # X

#-----------------------------------#
class SafeCalulator(Calculator):

    # Method Overloading ???
    # - 파이썬 언어는 지원하지 않음
    # - 의미: 같은 이름의 메소드를 여러개 정의하는 특징
    # def div(self, num1, num2, num3):
    #     print('- div2 invoked.')
    #     pass

    # Method Overriding
    def div(self, num1, num2, num3=-999):
        print('- div1 invoked.')
        
        if(num3 == -999):
            print('다른 로직을 수행합니다')

            return
            pass

        if(num2 == 0):
            return 0
            pass    # if

        return num1 / num2

        pass # div

    pass # end class

# calc2 = SafeCalulator()
# divResult = calc2.div(1, 0, 99)
# print(divResult)