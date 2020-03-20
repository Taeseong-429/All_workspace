# # sample48.py

# f = open('data.txt', 'r', encoding='utf8')

# # 파일의 내용전체를 읽어서, 문자열로 반환
# f.seek(0)
# file = f.read()    
# print("1:", file)

# # 두번째 읽기 ---  실패: 왜? 원인은, EOF(End-Of-File)
# f.seek(0)
# file = f.read()    
# print("2:", file)

# f.close()


# ------------------------------------------- #

# f = open("data.txt", 'w')

# for i in range(1, 11):
#     data = "%d번째 줄입니다.\n" % i
#     f.write(data)
#     pass

# f.close()

# ------------------------------------------- #


# 파일의 내용전체를 읽어서, 문자열로 반환
# line = f.readline()
# line = f.readline()
# line = f.readline()
# line = f.readline()
# line = f.readline() # 5행을 읽어라!!!!

# print(type(line))
# print(len(line))

# f = open('data.txt', 'r', encoding='utf8')

# while True:
#     line = f.readline()
#     # if (line == ""):        # EOF
#     if not line:              # EOF
#         break
#         pass

#     print(line)
#     pass

# print('Done.')

# f.close()

# ------------------------------------------- #

# f = open('data.txt', 'r', encoding='utf8')

# while True:
#     inputData = input('입력하세요:')
#     print(type(inputData))

#     if not inputData:
#         break
#         pass    # if

#     pass    # while

# f.close()   # 자원반납


# ------------------------------------------- #
# f = open('data.txt', 'a', encoding='utf8')
# 적극권장: 열려진(사용한) 자원을 파이썬 인터프리터가
#           책임지고 닫아주기 때문에(블록내에서 오류가
#           발생하든/안하든), 적극적으로 사용해야 함!!!!
with open('data.txt', 'a', encoding='utf8') as f:
    f.write('\n')
    f.write("Append-7")
    f.write('\n')
    f.write("Append-8")

    pass






# f.close()

# lines = f.readlines()

# print(type(lines))
# # print(lines)

# for line in lines:
#     print(   line.replace('\n', '')  )
#     pass
