# sample30.py

# while loop

treeHit = 0
totalHits = 10

while treeHit < totalHits:
    # treeHit = treeHit +1
    treeHit += 1

    print("나무를 %d번 찍었습니다." % treeHit)

    if treeHit == 10:
        print("나무 넘어갑니다.")
        pass
    
    # 반복문의 조건식을 구성하는 변수 중에, 반복횟수를 결정짓는
    # 변수는 블록 안에서, 조작(변경)에서는 안됨!!!
    totalHits += 1
    pass        