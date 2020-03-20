# sample60.py

# To create our own error (User-defined Error)

class IdentityError(Exception):

    # object (최상위 조상클래스가 물려준 메소드)
    # 클래스의 __str__ 메소드를 재정의(overriding)
    # ---> 다형성
    def __str__(self): 
        print('- IdentityError::__str__ invoked.')
        
        return "** 본인인증실패 **"
    
    pass # end class


def transfer(name):
    # 1) 본인인증 수행
    if(name != 'Yoseph'): # 인증실패
        # return -999       # code 999: 본인인증실패
        raise IdentityError()
        pass

    pass # end transfer

# 계좌이체 수행
try:
    transfer('Koseph')
except (IdentityError) as e:
    # print('- 계좌이체 실패: 본인인증 실패.')
    print('-'*50)
    print(e)
    print('='*50)
    print(dir(e))
    # print(e.__cause__)    # None
    print(dir(e.__traceback__))
    print(e.__str__())

    pass
finally:
    pass    