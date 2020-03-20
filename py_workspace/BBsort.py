# BBsort.py

data = [ 1, 23, 8, 11, 56, 77, 18, 29, 33, 44, 44, 77, 100, 98, 55, 20, 7, 2]
sorted_data =[]


while data :
    bigger = data[0]
    for i in range(len(data)-1) :
        if data[i] > data[i+1]:
            bigger = data[i]
            data[i] = data[i+1]
            data[i+1] = bigger
        else :
            bigger = data[i+1]
    sorted_data.append(bigger)   
    data.remove(bigger)
    pass

print(sorted_data)
'''
while data :
    smaller = data[int(len(data))-1]
    for i in range(len(data)-1) :
        if data[i] < data[i+1]:
            smaller = data[i+1]
            data[i+1] = data[i]
            data[i] = smaller
        else :
            smaller = data[i]
    sorted_data.append(smaller)
    data.remove(smaller)
    pass

print(sorted_data)
'''
'''
while data :
    small = data[0]
    for i in range(len(data)-1) :
        if data[i] > data[i+1]:
            small = data[i+1]
            data[i+1] = data[i]
            data[i] = small
        else :
            small = data[i]
    sorted_data.append(small)   
    data.remove(small)
    pass

print(sorted_data)
'''