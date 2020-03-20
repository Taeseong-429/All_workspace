# sample42.py

def add_and_mul(a, b):
    return (a + b, a * b)
    return 1
    pass

result = add_and_mul(1, 2)
( addResult, mulResult ) = add_and_mul(1, 2)

print(addResult)
print(mulResult)

print('-'*30)

def say_myself(name, man=True, old=10): 
    print('- say_myself({}, {}, {})'.format(name, man, old))
    pass

say_myself('Yoseph', 24)
say_myself('Yoseph', 24, False)