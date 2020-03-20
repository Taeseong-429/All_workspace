# sample61.py

# To test command-line options

import sys

print("- sys.argv:", sys.argv)

if True:
    # sys.exit(0)     # Normal exit.
    # sys.exit(-1)    # Abnormal exit.

    print('--------')
    pass


#-------------------------------#
# pickle
#-------------------------------#
import pickle as pk

# w: write mode, b: binary file indicator
# f = open('obj.dat', 'wb')

# pk.dump(object, file)
# object = [ 1,2,3,4,5 ]

# pk.dump(object, f)

# f.close()

with open('obj.dat', 'rb') as f:

    # 지정된 파일에 저장되어있는, 파이썬 객체를
    # 현재의 실행 메모리로 다시 불러들이는(loading)
    # load() 함수 실행
    l = pk.load(f)
    print(l)

    pass


# Pseudo Code (의사코드로 표현)
# data = [ 1,2,3 ....... 1억 ]
# for value in data:  # 1억번 반복
#     f.write(value+',')  # CSV 파일
#     pass

