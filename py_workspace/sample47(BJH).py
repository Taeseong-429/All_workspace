# sample47.py

# file open test

# open('오픈할 파일의 경로', '파일열기') 

# f = open('C:/app/py_workspace/sample25.py', 'w' ) # 윈도우 운영체제에서는 경로에 \를 씀

f = open('C:/Temp/sample1.py', 'w')
for i in range(1, 11):
    data = "%d번째 줄입니다. \n" % i
    f.write(data)
f.close()       # 자원 반납 코드