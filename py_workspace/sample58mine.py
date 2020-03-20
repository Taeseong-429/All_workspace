# sample58.py
# To test exception handling using try ~ except keyword.

num1 = 4
num2 = 1
try:
    result = num1 / num2

    f = open('c:/app/py_workspace/sample50.py','r')
                    # FileNotFoundError 
    a = [1,2,3]
    a[4]            # indexError

    4/0             # ZeroDivisionError
    
    pass        # end try

except (FileNotFoundError, IndexError) as e:
    print('Multi except block invoked.')
    print(type(e))
    print(e)

    # To prevent known side effect.
    if isinstance(e, FileNotFoundError):
        print('isintance:True')

        f = None    ## Our idea
        pass
    else :
        print('isintance: False')
    f = None ## Our Idea
    pass

except ZeroDivisionError as e:
    print('ZeroDivisionError except block invoked.')
    print(e)

    f = None # Garbage Error
    pass

finally :
    print('- finally block invoked.')

    # f.close()       # f변수가 제대로 생성되지 못할 경우도 고려
    
    # f 변수의 생성여부를 고려해서 작성한 코드

    if f:
        print('Closing the file')
        print('- f:', f)
        f.close()
        pass
    else :
        print('Nothing to do.')
        pass

#     # print('예외처리로직을 수행합니다')
#     # print(type(e))
#     # print(id(e))
#     # print(dir(e))
#     # print(e)
#     # print(e.__str__) # 이걸로 함수인걸 알았으니 아래 문장으로 함수 실행.
#     # print(e.__str__())  
#     pass        # end except
