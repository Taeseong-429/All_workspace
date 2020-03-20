# 중위수.

data = [ 1, 23, 8, 11, 56, 77, 18, 29, 33, 44, 44, 77, 100, 98, 55, 20, 7, 2 ]

list.sort(data)

if len(data) % 2 != 0 : 
    b = data[int((len(data)/2))]
else :
    b = (data[int((len(data)/2) -1)] + data[int(len(data)/2)]) / 2 

print(b)