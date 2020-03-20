# sample10.py
# 과제2를 해결하기 위해서, 추가적으로 알아야할 문법소개

# 1. 반복
#   1-1. while 문 : 지정된 조건식이 False가 될때까지 일련의 코드를 반복수행
#   1-2. for 문   : 지정된 횟수만큼, 일련의 코드를 반복수행

# 1-1. while <조건식>:
#      <들여쓰기>코드1
#      <들여쓰기>코드2
#      ...
#      <들여쓰기>코드N

number = 0
while number < 10:          # number 값이 10 이상이면, 반복을 빠져나감
    number = number + 1     # 1씩 number 변수값 증가
    # 수행시킬 코드
    print('number:', number)

# 1-2. for v in <interator>:
#      <들여쓰기>코드1
#      <들여쓰기>코드2
#      ...
#      <들여쓰기>코드N

# for number in range(1, 11):     # 1 ~ 10까지(11은 포함안됨) 숫자생성
#     print('number:', number)