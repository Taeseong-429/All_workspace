# sample60.py

# To create our own error (User-defined Error)

class IdentityError(Exception) :
    # object (최상위 조상클래스가 물려준 메소드)
    # 클래스의 __str__ 메소드를 재정의(overriding)
    # ---> 다형성 (부모것을 가려주고 자식 것 표출)
    def __str__(self): # 최상이 조상 클래스 object에서 물려받은 걸 오버라이딩한것.

        print('- IdentityError::__str__ invoked.')
        return "**본인인증실패**" 

    pass

def transfer(name):
    # 1) 본인인증 수행
    if(name != 'Taeseong') : # 인증실패
        # return -999          # code 999 : 본인인증실패  
        raise IdentityError() #
        pass
    pass # end transfer

# 계좌이체 수행
try:
    transfer('Koseph')
except (IdentityError) as e :
    # print('- 계좌이체 실패: 본인인증 실패')
    print('-'*50)
    print(e)
    print('='*50)
    print(dir(e))
    # print(e.__cause__)  # None
    print(dir(e.__traceback__))
    print(e.__str__()) # 우리가 재정의했음.
    pass
finally:
    pass