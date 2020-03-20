# sample26.py
# copy 모듈을 이용한 Deep Copy 수행

# 1. Import 단계 : 이미 작성되어 있는, 파이썬 스크립트 파일을
#                  현재의 코드 내에서 사용가능하도록 하는 기능\

# import <파이썬 모듈의 이름, 확장자는 제외하고>
# import 한 파이썬 모듈의 사용법:
#    <import한 파이썬 모듈명>.<내가 사용하고자 하는 멤버>

import copy

a = [1,2,3]
# b = copy.copy(a)
b = copy.deepcopy(a)

print(id(a))
print(id(b))
print('='*30)

print(type(copy))
print(id(copy))
print(copy)

print( a is b )


