# 자판기.py

def showmenu():
    print()
    print('MENU')
    for i in range(0, len(menu)) :
        print(i+1,'.', menu[i], price[i], '원')
        pass # for 
    print()
    pass # def

def buy(num) :
    if (money < price[num]):
        print('금액이 모자랍니다. 잔액 %d원' % money)
        return money
        
    else :
        print(menu[num], '구입완료')
        chargee = money - price[num]
        print('잔액 : ', chargee, '\n','='*50)
        Coin500 = chargee // 500
        chargee = chargee % 500 
        Coin100 = chargee // 100
        chargee = chargee % 100
        Coin50 = chargee // 50
        chargee = chargee % 50
        Coin10 = chargee // 10
        chargee = chargee % 10
        print('500원 %d개, 100원 %d개, 50원 %d개, 10원 %d개 반환됩니다.' %(Coin500,Coin100,Coin50,Coin10))
        return chargee


menu = ('아메리카노', '카페라떼', '카페모카', '아이스티')
price = (1500, 2000, 2500, 1000)


while 1 : 
    money = int(input('돈을 입력하세요 : '))
    if money < 1000 :
                
    showmenu()
    pushNum = int(input('주문 번호를 입력하세요 (종료 : 0) : '))
    if pushNum == 0 :
        break
        pass
    elif 1<= pushNum and 4 >= pushNum :
        money = buy(pushNum-1)
        pass # elif
    else :
        print('잘못된 입력입니다.')
        print('----------------')
        pass # else

    
    