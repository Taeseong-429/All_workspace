# # sample51.py

# # To define a calculator class.

# # class <클래스이름> :
# class Calculator:
#     # 생성자 - Constructor : 객체의 초기화
#     def __init__(self, color, shape, material): # color = 'black'의 방식으로 default값을 지정할 수 있지만 일반적으로 그렇게 하지 않음
#         print("__name__:",__name__)         # 직접수행시키면 __main__이 나옴
#         print('- Calculator::__init__ invoked.')
#         print('\t+ Self:', self)
#         self.result = 0
#         self.color = color
#         self.shape = shape
#         self.material = material

#         pass    #Constructor

#     def wriggle(self):
#         print('- Calculaor::wriggle invoked')
#         print("\t+ %s 색깔의 전자계산기가 꿈틀거립니다." % self.color)

#         return False
#         pass

#     def say_hello(self):
#         print('- Calculaor::say_hello invoked')
#         # 같은 클래스 내에 선언되어 있는
#         # 다른 메소드를 호출
#         # wriggle(self)         # X
#         # self.wriggle(self)    # X
        
#         # 정리) 같은 클래스 내에서,
#         # 다른 메소드 호출이 가능하며, 이때, self.<다른메소드명>()의 방식으로 호출
#         # 만일, 같은 클래스 내에, 다른 메소드의
#         # 매개변수가 여러개(self를 제외한) 있다면,
#         # 함수호출과 동일하게, 매개변수를 맞춰줘서
#         # 호출하면 됩니다.
#         self.wriggle()   

#         # 클래스의 새로운 속성 선언
#         self.weight = 50        # unit : gram
#                                 # 이런식으로 쓰면 안됨

#         pass

#     def add(self, *num):
#         for i in num:
#             self.result += i

#         return self.result

#     pass    #end class

# # A회사의 전자계산기
# cal1 = Calculator('black','rectangle', 'plastic')

# print(type(cal1))
# print(id(cal1))
# print('\t+ cal1:',cal1)
# print('\t+ cal1:',cal1.color)
# print('\t+ cal1:',cal1.material)


# result = cal1.wriggle()

# print('- result :',result)
# # B회사의 전자계산기
# # cal2 = Calculator()

# cal1.say_hello()
# print('\t+ cal1:',cal1.weight)

# cal1.size = 4       # 속성은 클래스 내의 함수나 
# print(cal1.size)    # 클래스 바깥에서도 만들어짐(하지만 이렇게 X)

class Screen:
    # 속성의 종류
    # 1) 객체의 고유한 속성
    # 2) 집합관계에 있는 부품
    # 3) 시간에 따라 값이 변하는 상태(예: 속도)
    pass

class FourCal:
    def __init__(self):
        
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
Cal2 = FourCal()

print(Cal1.add(1))
print(Cal1.mul(2))
print(Cal1.div(3))
print(Cal1.sub(4.4))