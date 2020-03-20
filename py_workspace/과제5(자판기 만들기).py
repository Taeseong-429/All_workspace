
Charge500 = 0
Charge100 = 0
Charge50 = 0
Charge10 = 0

menu = '''
    --------------------------------------------
                        MENU
    --------------------------------------------
        1. 블랙커피 (200원)
        2. 믹스커피 (250원)
        3. 율무차 (300원)
        4. 아이스티 (400원)
        5. 레모네이드 (500원)
        99. 거스름돈

        Select a number: '''

#------------------------------------------------------#
# To define the required functions
#------------------------------------------------------#

def func1():
    print('- func1() invoked.')
    money = input_money

    if money >= 200:
        print("블랙커피 1잔을 줍니다.")
        money -= 200
        pass

    else:
        print("금액이 부족합니다.")

    return money
    pass

def func2():
    print('- func2() invoked.')
    money = input_money

    if money >= 250:
        print("믹스커피 1잔을 줍니다.")
        money -= 250
        pass

    else:
        print("금액이 부족합니다.")

    return money
    pass

def func3():
    print('- func3() invoked.')
    money = input_money

    if money >= 300:
        print("율무차 1잔을 줍니다.")
        money -= 300
        pass

    else:
        print("금액이 부족합니다.")

    return money
    pass

def func4():
    print('- func4() invoked.')
    money = input_money

    if money >= 400:
        print("아이스티 1잔을 줍니다.")
        money -= 400
        pass

    else:
        print("금액이 부족합니다.")

    return money
    pass

def func5():
    print('- func5() invoked.')
    money = input_money

    if money >= 500:
        print("레모네이드 1잔을 줍니다.")
        money -= 500
        pass

    else:
        print("금액이 부족합니다.")

    return money
    pass

def func99():
    print('- func99() invoked.')

    money = input_money
    Charge500 = 0
    Charge100 = 0
    Charge50 = 0
    Charge10 = 0

    while money >= 500:
        money -= 500
        Charge500 += 1
        pass
        
    while money >= 100:
        money -= 100
        Charge100 += 1
        pass
        
    while money >= 50:
        money -= 50
        Charge50 += 1

    while money >= 10:
        money -= 10
        Charge10 += 1
        pass
    
    print("잔돈이 반환됩니다.")
    print(f'거스름돈 500원 {Charge500}개, 100원 {Charge100}개, 50원 {Charge50}개 10원 {Charge10}개를 줍니다.')
    return money
    pass

#------------------------------------------------------#
switch = {
    1 : func1,
    2 : func2,
    3 : func3,
    4 : func4,
    5 : func5,
    99 : func99
} # Dictionary ( Key : value )

while 1:
    input_money = int(input("돈을 넣어주세요 : "))

    while input_money != 0:        
        number = int(input(menu))

        if number not in [1, 2, 3, 4 ,5, 99]:
            print ('잘못 선택하셨습니다.')
            continue
            pass

        input_money = switch[number]()

        print(f"{input_money}원 남았습니다.")

        if input_money < 200:
            print("금액이 부족합니다.")
            input_money = switch[99]()
            pass

        pass    #while
pass    # while
