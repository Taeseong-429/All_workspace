# 마음속 숫자 맞추기
import random

randNumber = random.randint(1,45)

TryNum = 3



while True :
    if TryNum == 0 :
        print('기회를 모두 소진했습니다.')
        break
    inputNumber = int(input('숫자를 입력하세요. 기회 %d번 남음 :' %TryNum))
    if inputNumber > 45 or inputNumber <1 :
        print('입력가능한 숫자는 1 ~ 45 입니다.')
        break
    
    if randNumber == inputNumber : 
        print( 2-TryNum , '번 만에 성공!')
        break
    
    elif (46 > randNumber, inputNumber > 22) :
        print('땡 ~ 45 이하, 23 이상입니다.' )
        TryNum -= 1
    elif  23 > randNumber,inputNumber > 1 :
        print('땡 ~ 24 이하, 0 이상입니다.' )
        TryNum -= 1
    elif  10 >= randNumber > 5 :
        print('땡 ~ 10 이하, 6이상입니다.' )
        TryNum -= 1
    elif  randNumber <= 5 :
        print('땡 ~ 5 미만입니다..' )
        TryNum -= 1
            
