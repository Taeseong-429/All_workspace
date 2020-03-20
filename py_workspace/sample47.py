# sample47.py

# File open test

# open('오픈할 파일의 경로','파일열기모드값')
# f = open( 'C:\Temp\sample1.py' , 'w')   # Write (쓰기)
# f = open( 'C:\\Temp\\sample1.py' , 'w') # Write (쓰기)
# f = open( 'C:/Temp/sample100.py' , 'a')   # Append (추가)

# print(type(f))
# print(id(f))
# print(f)

# f.close()   # 자원반납코드 (Resource Releasing Code)

f = open("C:/temp/sample100.py", 'w')

for i in range(1, 11):
    data = "%d번째 줄입니다.\n" % i
    f.write(data)
    pass

f.close()




