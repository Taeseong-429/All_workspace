# sample58.py
# To test exception handling using try ~ except keyword.


import os
print('- cwd:', os.getcwd())

try:
    f = open('c:/app/py_workspace/sample9.py', 'r')
                    # FileNotFoundError

    a = [1,2,3]
    a[4]            # IndexError
    
    4/0             # ZeroDivisionError
    pass

except ( FileNotFoundError, IndexError ) as e:
    print('Multi-except block invoked.')
    print(type(e))
    print(e)

    # To prevent known side effect.
    if isinstance(e, FileNotFoundError):
        print('isinstance: True')

        f = None    ## Our Idea
        pass
    else:
        print('isinstance: False')
        pass

    pass

except ZeroDivisionError as e:
    print('ZeroDivisionError except block invoked.')
    print(e)

    # f = None    # Garbage code
    pass

finally:
    print('- finally block invoked.')
    
    # f.close()     # f변수가 제대로 생성되지 못할 경우도 고려

    # f 변수의 생성여부를 고려해서 작성한 코드
    if f:
        print('Closing the file.')
        print('- f:', f)
        f.close()
        pass
    else:
        print('Nothing to do.')
        pass

    pass    # end except
