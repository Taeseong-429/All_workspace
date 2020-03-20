# sample31.py

# To make menus using while loop & multi-line string

menu = '''
    ===================================
                   MENU
    ===================================
    1. Add
    2. Del
    3. List
    4. Quit

    Enter a number: '''

inputNumber = 0

while (inputNumber != 4):
    # print(menu, end='')   # default: end='\n'  --> end = ''

    inputNumber = int( input(menu) )
    print('\t- Input number:', inputNumber)
    pass

#--------------------------------------------#

while True:     # Outer infinite loop

    while True: # Inner infinite loop

        if(condition):
            break
            pass    # if 

        pass    # while - inner

    pass    # while - outer







