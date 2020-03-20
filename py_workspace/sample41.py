# sample41.py

def add(num1, num2):
    print('- add(num1:{}, num2:{})'.format(num1, num2))

    return num1 + num2
    pass

# result = add(num1=1, num2=2)
result = add(num2=2, num1=1)
print(result)

# ----------------------------------------
# 가변인자(*)를 가진 함수선언
# ----------------------------------------

def summation(*scores):
    print('- summation() invoked.')

    print('\t+ type(scores):', type(scores))
    print('\t+ scores:', scores)

    total = 0
    for score in scores:
        total += score
        pass # for

    return total
    pass # end summation

# summation()
result = summation(1,2,3,4,5,6,7,8,9,10)
print(result)

# ----------------------------------------
# 키워드인자(**)를 가진 함수선언
# ----------------------------------------
def userProfile(**userinfo):
    print('- userProfile() invoked.')
    
    print('\t+ type(userinfo):', type(userinfo))
    print('\t+ userinfo:', userinfo)

    pass

print('='*30)

# userProfile()
userProfile(
    name1='Yoseph', age1=24, tel1='010-2762-6623',
    name2='Yoseph', age2=24, tel2='010-2762-6623'
)

#---------------------------------------------#
# 3가지 종류의 매개변수를 섞어서, 함수매개변수 선언
#---------------------------------------------#
def func1(pos1, pos2):
    pass

def func2(pos1, pos2, *vargs):
    pass

def func3(pos1, pos2, *vargs, **kwargs):
    pass

# def func4(pos1, *vargs, pos2):      # X
# def func4(pos1, **kwargs, pos2):    # X
# def func4(pos1, pos2, **kwargs):      # OK
# def func4(pos1, pos2, *vargs):          # OK
def func4(pos1, pos2, *vargs, **kwargs):
    print('- func4 invoked.')
    print('\t+ pos1:', pos1)
    print('\t+ pos2:', pos2)
    print('\t+ vargs:', vargs)
    print('\t+ kwargs:', kwargs)
    pass

func4(1, 2, 3,4,5, name='Yoseph')





