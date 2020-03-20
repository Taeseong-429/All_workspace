# sample51.py

# To define a calculator class.

print("__name__:", __name__) # 내가 만든 파이썬 파일 이름. 
# class <클래스이름> :
class Calculator :
    # 생성자 - Constructor : 객체의 초기화(만들어낸다) 수행 # 추가적인 속성이 있어도 메소드에서 만들지 말고 생성자에서 !!
    def __init__(self, color, shape, material) : # 함수처럼 매개변수 사용할 수 있음. 생성되는 객체마다 지정되는 값으로 초기화 되어 각각
                                                # 다른 전자계산기가 됨.
        print('- Calculator:: __init__.invoked.')
        print('\t+ self:',self) # self는 calculator으로 찍어낸 객체라고 할 수 있음.

        # 색상속성(== 색상필드)
        self.color = color
        self.shape = shape
        self.material = material 
        
        pass # constructor

    # 메소드 - 꿈틀거리다
    def wriggle(self) : 
        print('- Calculator::wriggle invoked.')

        # color = 'blue'
        print('- \t %s 색깔의 전자계산기가 꿈틀거립니다' % self.color)

        return False
        pass

    def say_hello(self) :
        print('- Calculator::say_hello invoked.')
        
        # 같은 클래스 내에 선언되어있는 메소드를 호출
        # 정리) 같은 클래스 내에서, 다른 메소드 호출이 가능하며, 이때, self.<다른메소드명>() 호출하면 됩니다.
        # 만일, 같은 클래스 내에, 다른 메소드의 매개변수가 여러개(self를 제외한) 있다면, 함수호출과 동일하게,
        # 매개변수를 맞춰져서 호출하면 됩니다.
        # wriggle(self)  # X
        self.wriggle("value")   # OK
        # self.wriggle(self)  

        # 클래스의 새로운 속성 선언
        self.weight = 50   # unit : gram (LG)
        pass

    pass # end class

# A 회사의 전자계산기
calc1 = Calculator('black','rectangle','plastic') # class에서 객체를 생성
print('-\t+ calc1:',calc1)
print('\t\t++ calc1.color:',calc1.color)
print('\t\t++ calc1.shape:',calc1.shape)
print('\t\t++ calc1.material:',calc1.material)


result = calc1.wriggle() # 객체의 메소드 호출
print('- result:', result)

calc1.say_hello()
calc1.size - 4

print('\t\t++ calc1.weight:',calc1.weight)
print('\t\t++ calc1.size:',calc1.weight)
# # B 회사의 전자계산기
# calc2 = Calculator()
# print('-\t+ calc2:',calc2)

# print(type(calc1))
# print(id(calc1))
# print(type(calc2))
# print(id(calc2))