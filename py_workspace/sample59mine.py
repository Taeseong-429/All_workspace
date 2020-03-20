# sample59.py

# To create a parent class and a child class.
# But the parent class force the child class to implement
# some inheritted methods.

class 새:
    # 상속받는 자식 클래스에서, 반드시 이 메소드를 재정의(Overriding)
    # 하도록 강제하고 싶을땐, 예외를 발생시켜서, 재정이를 유도.
    def 날다(self):
        raise NotImplementedError # 강제로 예외발생시킴
        pass


    pass    # end class

# bird = 새()
# bird.날다()     # NotImplementError

#--------------------------------------------#

class 참새(새):
    
    # 상속받은 '날다' 메소드를 재정의(override)
    def 날다(self):
        print('Flying .....') # 재정의 된게 호출됨~~

        pass

    pass # end class

bird = 참새()
# 다형성 : 부모클래스가 물려준 메소드를 자식클래스
#          에서 재정의하였을 때, 자식 클래스로부터 생성된
#          자식객체가 해당 메소드를 호출 했을때,
#           부모가 물려준 ㅁ소드를 호출하지 않고, 자식이
#          재정의(override)한 메소드가 호출됨으로서, 
#          다양한 기능을 수행할 수 있게 되었고,
#          이를 다형성(Polymorphism)
bird.날다()
