# sample.48py

# f = open('C:/app/py_workspace/data.txt', 'r', encoding='utf8')

# file = f.read()
# f.close()

# f = open('C:/app/py_workspace/data.txt', 'w', encoding='utf8')

# for i in range(1, 11):

#     data =  "%d번째 줄입니다.\n" % i

#     f.write(data) # .write 문자열만 입력 가능

# f.close()

# f = open('C:/app/py_workspace/data.txt', 'r', encoding='utf8')

# file = f.read()

# print("1:", file)

# file = f.read()

# print("2:", file)   # EOQ때문에 file 마지막에 위치 다시 돌리고 싶으면 .seek

# f.close()

# #-----------------------------------------------#

# f = open('C:/app/py_workspace/data.txt', 'r', encoding='utf8')

# # 파일의 내용 전체를 읽어서, 문자열로 반환

# # line = f.readline()
# # line = f.readline()
# # line = f.readline()
# # line = f.readline()
# # line = f.readline()

# # print(line)

# while True:

#     line = f.readline()

#     if not line :
#         break

#     print(line)

#     pass

# f.close()

# f = open('C:/app/py_workspace/data.txt', 'r', encoding='utf8')

# while True:
#     inputData = input(입력하세요 :)
    
#     print(type(inputData))

#     if not inputData:
#         break

# f.close()

#------------------------------------------------------------#

f = open('C:/app/py_workspace/data.txt', 'r', encoding='utf8')

lines = f.readlines()

print(type(lines))

print(lines)

for line in lines:
    print(line.replace('\n',''))
    pass

f.close()

#-----------------------------------------------#
# f = open('data.txt', 'a', encoding='utf8')
# 적극권장: 열려진(사용한) 자원을 파이썬 인터프리터가
#           책임지고 닫아주기 때문에(블록내에서 -)

with open('data.txt', 'a', encoding='utf8') as f:
    f.write('\n')
    f.write('append - 7')
    f.write('\n')
    f.write('append - 8')
    pass
