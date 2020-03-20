# 과제 8 랜덤 모듈.py

import random

# 1. random() 함수 : 0부터 1사이의 랜덤 실수를 리턴.
print('random :',random.random())

# 2. uniform() 함수 : 2개의 숫자 사이의 랜덤 실수를 리턴.
print('uniform :',random.uniform(1,10))

# 3. randint() 함수 : 2개 숫자 사이의 랜덤 정수 리턴 (2번째 인자 정수도 범위에 포함)
print('randint :',random.randint(0,100))

# 4. randrange() 함수 : range(start,stop,step) 함수로 만들어지는 정수 중 하나를
#                      랜덤하게 리턴
print('randrange :',random.randrange(0,101,2)) 

# 5. choice() 함수 : 랜덤하게 하나의 원소를 선택. 인자는 리스트 같은 시퀀스 자료형
print('choice :',random.choice('abcdefghij'))

# 6. sample() 함수 : 랜덤하게 여러 개의 원소를 선택.# 여기선 3개 선택
#                    리스트 형태로 변환.(중복없음, 로또 번호)
print('sample :',random.sample([1,2,3,4,5], 3))


# 7. shuffle() 함수 : 리스트 변수 내용 자체를 랜덤하게 섞음.
data = [1, 2, 3, 4, 5, 6, 7]
random.shuffle(data)
print(data)