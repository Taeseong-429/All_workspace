# sample43.py

# 변수의 유효범위

globalVar = 1   # 전역변수: Global variable

def vartest(localVar): # 지역변수 : Local variable
    localVar = localVar +1

    localVar2 = 'Yoseph'

    pass

vartest(globalVar)
print(globalVar)
# print(localVar)     # X :실행은 되지만, 오류가 발생(NameError)

for v in [1,2,3]:
    v2 = v
    pass

print("- v:", v)
print("- v2:", v2)

if False:
    v3 = 3
    pass
else:
    v5 = 5
    pass

# print("- v3:", v3)
print("- v5:", v5)

while 1:
    v4 = True
    
    if(v4):
        break;
        pass

    pass

print("- v4:", v4)


a = 1   # 전역변수: Global variable

def vartest(b): # 지역변수 : Local variable
    global a
    a = a +1

    pass

vartest(a)
print("-a", a)