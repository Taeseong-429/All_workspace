# sample51.py

# To define a calculator class.

print("__name__:", __name__)



# class <클래스이름> :
class Calculator:

    # 생성자 - Constructor : 
    #   객체의 속성을 초기화(만들어낸다) 수행
    def __init__(self, color, shape, material):
        print('- Calculator::__init__ invoked.')
        print('\t+ self:', self)

        # 색상속성(== 생상필드)
        self.color = color
        self.shape = shape
        self.material = material

        pass # Constructor

    # 메소드 - 꿈틀거리다
    def wriggle(self, value):
        print('- Calculator::wriggle invoked.')

        # color = 'blue'
        print('\t+ %s 색깔의 전자계산기가 꿈틀거립니다' % self.color)

        return False
        pass

    def say_hello(self):
        print('- Calculator::say_hello invoked.')

        # 같은 클래스내에 선언되어잇는
        # 다른 메소드를 호출
        # wriggle()         # X
        # wriggle(self)     # X

        # 정리) 같은 클래스 내에서, 다른 메소드
        # 호출이 가능하며, 이때, self.<다른메소드명>()
        # 호출하면 됩니다!!!
        # 만일, 같은 클래스 내에, 다른 메소드의
        # 매개변수가 여러개(self를 제외한) 있다면,
        # 함수호출과 동일하게, 매개변수를 맞춰져서
        # 호출하면 됩니다.
        self.wriggle("value")      # OK
        # self.wriggle(self)  # X

        # 클래스의 새로운 속성 선언
        self.weight = 50    # unit: gram (LG)
        pass

    pass # end class

# A회사의 전자계산기
calc1 = Calculator('black', 'rectangle', 'plastic')    # class에서 객체를 생성
print("\t+ calc1:", calc1)
print("\t\t++ calc1.color:", calc1.color)
print("\t\t++ calc1.shape:", calc1.shape)
print("\t\t++ calc1.material:", calc1.material)

result = calc1.wriggle(1) # 객체의 메소드 호출
print('- result:', result)

calc1.say_hello()   # 객체의 메소드 호출
calc1.size = 4      # 단위: cm
print("\t\t++ calc1.weight:", calc1.weight)
print("\t\t++ calc1.size:", calc1.size)

# B회사의 전자계산기
# calc2 = Calculator()    # class에서 객체를 생성
# print("\t+ calc2:", calc2)

