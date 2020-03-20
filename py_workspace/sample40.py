# sample40.py

prompt = '''
    -----------------------------
                MENU
    -----------------------------
    1. Menu1 -> func1()
    2. Menu2 -> func2()
    3. Menu3 -> func3()
    4. Menu4 -> func4()
    5. Menu5 -> func5()
    6. Menu6 -> func6()
    7. Menu7 -> func7()
    99. Quit

    Select a number: '''

#------------------------------------------#
# To define the required functions
#------------------------------------------#
def func1():
    print('- func1() invoked.')
    pass    

def func2():
    print('- func2() invoked.')
    pass

def func3():
    print('- func3() invoked.')
    pass

def func4():
    print('- func4() invoked.')
    pass

def func5():
    print('- func5() invoked.')
    pass

def func6():
    print('- func6() invoked.')
    pass

def func7():
    print('- func7() invoked.')
    pass

#--------------------------------------------#
# 파이썬에서, 함수객체는 1급객체(First-Class Object)
#--------------------------------------------#
switch = {
    1: func1,
    2: func2,
    3: func3,
    4: func4,
    5: func5,
    6: func6,
    7: func7
} # Dictionary (key:value)

while 1:
    number = int( input(prompt) )
    if(number == 99):
        print('Quitting ....')
        break
        pass # if

    # print("\t- switch[%d]:"%(number), switch[number])

    switch[number]()  # 딕셔너리에 저장된 해당번호의 함수호출

    pass # while

print('Done.')