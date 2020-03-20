# sample54.py

# To test inheritance of class.

class Parent :          # 부모 클래스    
    
    def __init__(self):         # 생성자(Constructor)
        print('- Parent::__init__ invoked.')

        # super().__init__()
        self.field1 = 0

        pass

    def method1(self):          # 메소드(Method)
        print('- Parent::method1 invoked.')

        pass

    pass # end class

class Child(Parent):    # 자식 클래스

    def __init__(self):                     # 생성자
        print('- Child::__init__ invoked.')

        # 부모자식 상속관계를 가지고 있는 자식클래스의
        # 생성자 내부에서는, 반드시 지정된 부모 클래스로부터
        # 부모객체를 생성하고(1), 부모객의 생성자를 호출(2)
        # 함으로써, 완전한 부모객체가 생성되도록, 명시적으로
        # 아래와 같이 코드를 넣어야 함!!!
        # 그래야, "부모없는 자식이 안생깁니다!!!"
        # super().__init__()
    

        pass # constructor

    def method2(self):
        print('- Child::method2 invoked.')

        pass # method2

    pass # end class

#----------------------------------------#
child = Child()
child.method2()

# print(type(child))
# print(id(child))
# print(dir(child))
# print(child)

# print(child.field1)
# child.method1()