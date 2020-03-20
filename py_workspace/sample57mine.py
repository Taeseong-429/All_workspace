# sample57.py

# To test relative path importing.

print('- __name__ :', __name__) # 이게 메인일때는 아래 패키지가 스크립트.
print('- __package__:', __package__) # 메인이 아니라면 패키지는 패키지 구조안에 있는 모듈이 됨.
                                     # (패키지 폴더 안으로 들어가는 순간) 모듈이 된다는 말.
                                     # 모듈을 실행시키고 싶을땐 -m을 써야됨.as a script... 
                                     # 우리가 만든 sample57.py은 모듈인데 직접 수행시키기 위해선 스크립트로 실행시켜야됨. 
                                     # 그래서 -m sample57
                                     # 1. -m 옵션을 주면 모듈 시행할 것, 이라고 생각.
                                     # 2. 모듈로서 모듈의 위치를 도트연산자로 제공하기 때문에 from 키워드 뒤의
                                     # 다양한 경로를 판단 가능.
                                     # 3. ?? 
                                    



import os 
print('- os.getcwd().:',os.getcwd())

from ..sound import echo # 사운드 패키지의 에코 모듈을 가져다 쓰겠다. 


print(render_test)
render_test()

