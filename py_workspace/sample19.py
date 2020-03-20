# sample19.py
# 리스트 조작

# 1. pop(x) 메소드

# a = [1,2,3,3,3,3]
# print( a.pop() )
# print( a.pop(1) )

# 2. count(x) 메소드
# print( a.count(3) )

# 3. extend(x) 메소드
# b = [4,5,6]
# a.extend( b )

# + 연산자의 효과
a = [1,2,3]
b = [4,5]

result = a + b

# a.extend(b) : a가 확장
a = a + b
a += b