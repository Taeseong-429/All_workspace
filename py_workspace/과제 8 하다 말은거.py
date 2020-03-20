# 과제8.py

# 함수 

#  1. oct(number) : 정수 형태의 숫자를 8진수 문자열로 바꾸어 돌려주는 함수.
#  oct(number) number가 파이썬 int 객체가 아니면, 정수를 돌려주는 __index__()메소드를 정의해야함.

print(oct(42)) #---> '0o52'
# 다시 숫자로 변환 : 
print(int('0o52',8)) #---> 42


# 2. open(filename,[mode]) : 파일이름과 읽기 방법을 입력받아 파일 객체를 돌려주는 함수.
# 읽기 방법(mode)을 생략하면 기본값인 읽기 전용모드 r로 설정.
f = open('C:/app/py_workspace/새파일.txt','w')
for i in range(1,11) :
    data = f'{i}번째 줄입니다.\n'
    f.write(data)
f.close()

# w, r, a(쓰기), b 모드 중 b 는 바이너리 모드로 파일을 연다.

# 3. ord(c) : 하나의 유니코드 문자를 나타내는 문자열이 주어지면 문자의 아스키 코드 값을 돌려주는 함수.
print(ord('a'))
# 파이썬은 UTF-8 을 지원하기 때문에 한글도 가능.

# 4. pow(base,exp[,mod]) : base의 exp 거듭제곱을 돌려준다.
# 인자는 숫자형이어야함.
'''
print(pow(10,2))
print(pow(10,-2))
print(10**2)
'''
# 5. print()
print

# 6. property()

# 7. set([iterable]) 새 집합 생성. 문자열 가능. 중복허용 X, 순서 없음.
s1 = set([1,2,3,4])
s2 = set('Hello')
'''
print(s1&s2) # 교집합
print(s1.interection(s2)) # 교집합
print(s1.union(s2)) # 합집합
print(s1 - s2) # 차집합
print(s1.add(4)) # 값 추가
'''

# 8. setattr()