# sample16.py
# 리스트의 인덱싱과 슬라이싱 기법을 배우자!!!!

# 1. 인덱싱 : 이전의 문자열의 인덱싱과 동일하다
#
#    즉, 리스트변수명[인덱스번호] --> 인덱스번호에 해당하는
#                      리스트의 요소를 참조(reference = 사용)

# l = [ 1, 2, 3, [4,5,6] ]

# inner_list = l[-1]      # l[3]
# inner_list2 = l[-1][1]  # 5

# element1 = l[0]
# element2 = l[-1]

# result = element1 + element2


# list1 = [ 
#     1, 2, 3, 

#     [ 
#         4, 5, 6, 

#         [
#             7, 8, 9
#         ] 
#     ] 
# ]

# IWantThisElement = list1[3][3][2]

a = [
        1, 2, 3, 

        ['a', 'b', 'c'], 

        4, 5
    ]

# ['c'] 을 뽑아내세요!!!! (단, 슬라이싱 만으로...)
# result = a[3:4][0][2:]
result = a[3:4][0]
print(result)