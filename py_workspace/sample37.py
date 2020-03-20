# sample37.py

a = [1,2,3,4,5]

# ----------------------------
# 1. List comprehension
# ----------------------------
listComprehension = [ v for v in a ]
print("1. listComprehension:", listComprehension)


# ----------------------------
# 2. Tuple comprehension
# ----------------------------
# tuple comprehension의 결과는 Tuple 객체가 아니라,
# "generator"라는 타입의 객체가 생성됨
# 이 "generator"는 1회용 값 생성기 임!(재사용안됨!!!)
tupleComprehension = ( v for v in a )
print("2. tupleComprehension:", tupleComprehension)
print("\t- type(tupleComprehension):", type(tupleComprehension))


# generator 객체의 사용 - tuple() 형변환함수에 적용
# 하여, 진짜 tuple 타입의 객체로 형변환 수행

# 2-1. tuple로 재변환(첫번째)
realTuple1 = tuple(tupleComprehension)
print("\t- realTuple1:", realTuple1)

# 2-2. tuple로 재변환(두번째)
realTuple2 = tuple(tupleComprehension) 
print("\t- realTuple2:", realTuple2)

# ----------------------------
# 3. Set comprehension
# ----------------------------
setComprehension = { v for v in a }
print("3. setComprehension:", setComprehension)