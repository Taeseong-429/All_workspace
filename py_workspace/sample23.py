# sample23.py
# Set Type

# 1. 새로운 집합 자료형(set)의 객체 만들기

s = {} # 'dict'
s = set()

s = { 1,2,3, 3}

print(type(s))
print(len(s))
print(s)


l = [ 1,2,3,4,5,'a','a','a' ]

temp_set = set(l)
print(temp_set)

l = list(temp_set)
print(l)

print('-' * 30)

A = { 1,2,3,4,5,6 }
B = { 4,5,6,7,8,9 }

# A & B : 교집합(intersection)
C = A & B
C = A.intersection(B)

# C = A | B
C = A.union(B)

C = A - B
C = B - A
C = B.difference(A)

print(C)

print('='*30)

A = { 1,2,3,4,5,6 }
A.add(7)
A.add(7)

A.update()   # OK

A.update([1,100,99]) # list: OK
A.update((1000,2000)) # tuple: OK
A.update({3000,4000}) # set: OK
A.update({10000:'v1', 20000:'v2'}.keys())

A.remove(1)

print(A)