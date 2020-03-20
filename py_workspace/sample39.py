# sample39.py

# To make switch statement using function features

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


while 1:    # Infinite loop
    number = int( input(prompt) )

    if(number == 99):   # 무한루프 탈출조건
        print('Quitting....') 
        break
    elif (number == 1):
        # print('menu1')
        func1()
    elif (number == 2):
        # print('menu2')
        func2()
    elif (number == 3):
        # print('menu3')
        func3()
    elif (number == 4):
        # print('menu4')
        func4()
    elif (number == 5):
        # print('menu5')
        func5()
    elif (number == 6):
        # print('menu6')
        func6()
    elif (number == 7):
        # print('menu7')
        func7()
    else:
        print('Wrong number') 

    pass # while

print('Done.')