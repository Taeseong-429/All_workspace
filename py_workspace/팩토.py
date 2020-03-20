# 팩토


def fac(n) :
    if (n == 1):
        return n
        pass
    elif (n==0):
        return 1
    elif (n<0) :
        print('음수를 입력할 수 없습니다.')
    else :
        return n * fac(n-1)
        pass

n = int(input('숫자를 입력해주세요'))




print(fac(n))



