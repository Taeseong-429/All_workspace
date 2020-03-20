# sample33.py

# continue keyword test

number = 0

while (number < 10):
    number += 1
    
    if(number % 2) == 0: 
        continue
        pass

    else:
        print(number)
        pass

    pass

print('='* 10)

# 1st. method for infinite loop
# while True:
#     print('.', end='')
#     pass

# 2st. method 
# while 100000:   # 0이 아닌 모든 숫자는 True, 0 : False
#     print('+', end='')
#     pass

# 3rd. method
name = "Yoseph"
char = 'Y'

while not None:  # 요소가 비어있지 않은, 자료구조는 True, 비어있으면 False    
    # 탈출조건과 코드를 가장 먼저 작성한다!!!!! (**주의사항**)
    if (char in name):
        break
        pass

    pass

print('Done.')