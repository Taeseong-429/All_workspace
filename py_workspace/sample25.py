# sample25.py

a = [1,2,3]
b = a

a.pop()


print(type(a))

print(id(a))
print(id(b))

print(a)
print(b)

print('=' * 30)

a = [1,2,3]
b = a[ : ]

print(id(a))
print(id(b))