# sample64.py
#   1) 0 <= X < 1
#      (0 x 6) <= X < (1 x 6)
#       0 <= X < 6
#      (0 + 1) <= X < (6 + 1)
#       int( 1 <= X < 7 )
#       1 <= X <= 6
# 
import random as r

def randomIntRange(start, end):
    result = int(r.random() * (end - start + 1)) + start

    return result
    pass

for index in range(10000000):
    start = 3
    end = 5

    X = randomIntRange(start, end)
    if (X < start) or (X > end):
        print("{}. X < {} or X > {}: {}".format(index,start,end,index))
        pass
    elif (X== start) or (X==end) :
        pass
    else :
        print('.',end='')