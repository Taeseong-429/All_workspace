# sample44.py

# The use of global keyword

a = 1   # 전역변수: Global variable

def vartest(b): # 지역변수 : Local variable
    # global a
    a = b
    a = a + 1
    pass

# vartest(a)
vartest(777)

print("- a:", a)