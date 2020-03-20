# assignment7

# Factorial Function 만들기


#------------------------------------------#
# # method1 - for문으로 구하기

# n = int(input('미지수를 정하시오: '))
# fact = 1

# for i in range(1,n+1):
#     fact = fact * i
#     pass
    
# print(fact)

#------------------------------------------#
# # method2 - while문으로 구하기

n = int(input('미지수를 정하시오: '))
fact = 1
while n:
    fact = fact * n
    n = n - 1
    pass

print(fact)

#------------------------------------------#
# # method3 - math 모듈 -> factorial 메소드로 구하기

# n = int(input('미지수를 정하시오: '))
# import math
# math.factorial(n)

# print(math.factorial(n))

#------------------------------------------#