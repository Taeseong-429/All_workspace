# sample35.py


# result = 0

# for number in range(1, 101):
#     result = result + number    
#     pass

# print(result)

# result = 0 + 1 + 2 + 3 + 4 + .... + 100

# The feature of range() function.
# a = range(0, 10, 2)
# a = range(10, 2)
# a = range(0, 1, .1)

# print(type(a))
# print(id(a))
# print(a)

# b = True

# c = list(a)


# 구구단 (홀수단만으로 구구단을 만들어 보자!!!)
for dansu in range(2,10):        # ①번 for문
    if (dansu % 2 == 0):    # 단수가 짝수이면....
        continue
        pass

    for number in range(1, 10):   # ②번 for문
        print(dansu * number, end=" ") 
        pass # inner

    print('') 
    pass # outer