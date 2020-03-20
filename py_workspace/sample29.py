# sample29.py

# Check multiple conditions using elif syntax.

pocket = [ 'paper', 'cellphone', 'IDcard' ]
card = True

if ('money' in pocket) and (card):   # 돈이 있다면...
    # 코드1
    # 코드2
    pass
elif ( card ):              # 카드가 있다면 ...   
    # 코드1
    # 코드2
    pass
elif ( 'IDcard' in pocket ):
    # 코드1
    # 코드2
    pass
else:                   # 돈도 없고 카드도 없으면 ...    
    # 코드1
    # 코드2
    pass

print('-'*30)

# 조건부 표현식(Conditional Expressionb)
# 변수명 = <참일 때 값> if <조건식> else <거짓일때 값>

score = 78
result = 'SUCCESS' if (score > 80) else 'FAIL'
print(result)