#

import random

randNum = random.randint(1,45)
inputNum = int(input('숫자를 입력하세요.(1~45) : ' ))
TryNum = 5
MaxNum = 45
MinNum = 1

while (inputNum != randNum) :
    if (inputNum > randNum) :
        TryNum -= 1
        print('입력값이 큽니다')
        MaxNum = inputNum -1
    else :
        print('입력값이 작습니다')
        MinNum = inputNum +1
    inputNum = int(input('숫자를 입력하세요(%d~%d) : ' %(MinNum, MaxNum)))

print('맞았습니다')
