# sample62.py

# To test module 'os'

import os

print(type(os.environ))
print(os.environ)   # environment (환경)

# PATH 환경변수: 윈도우 운영체제에서 실행되는 모든
#               실행명령어를 찾으러 가는 폴더의 목록
#               을 저장하고 있는 변수
#               실행명령어가, 이 환경변수에 있는
#               폴더목록에서 찾지 못하면,
#               보통 "명령어를 찾을 수 없습니다"
#               라는 의미의 메시지를 출력하고 끝냄
key = 'PATH'
value = os.environ[key]

print(value)

#------------------------------------#
import os

targetDir = "C:/app"
returnValue = os.chdir( targetDir )
print('- returnValue:', returnValue)

cwd = os.getcwd()
print('- cwd:', cwd)

