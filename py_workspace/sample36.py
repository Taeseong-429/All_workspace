# sample36.py
# List comprehension - 리스트 내포

# 1. 리스트 내포를 사용하지 않았을 경우에,
#    하나의 리스트 요소를, 다른 비어있는 리스트에 넣는 코드

a = [1,2,3,4,5]
b = []      # b = list()

# for element in range(1, 100001):
#     b.append(element)
#     pass

# 2. 위 코드를 리스트 내포를 사용하는 경우로 바꾸면....
# b = [  element for element in range(2, 100001, 2) ]

# b = {  
#         element

#         for element in range(2, 100001) 

#         if ((element %2) == 0 ) 
#     }

# print(b)

# 리스트 내포를 이용한 구구단 생성 코드
# for x in range(2,10):
#     for y in range(1,10):
#         x*y

result = [
            x*y
            for x in range(2,10)
                for y in range(1,10) if (y % 2 == 0)
                    
        ]   

print(result)        




