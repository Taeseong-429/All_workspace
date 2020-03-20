# sample34.py

scores = { 99, 100, 89, 100, 77, 88, 89 }

# 전체요소의 값을 하나씩
# 가져다 사용하는 행위 ---> 순회(Traverse)

for (index, score) in enumerate(scores):
    # index += 1
    print(index, ':', score)
    pass

print('Done.')