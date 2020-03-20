# 정렬
data = [ 1, 23, 8, 11, 56, 77, 18, 29, 33, 44, 44, 77, 100, 98, 55, 20, 7, 2]

sorted_data = []

while data:
    sorted_data.append(min(data))
    data.remove(min(data))

print("정렬 : ", sorted_data)
print('-'*30)
"----------------------------------------"
# 평균

Ssum = 0

for i in sorted_data : 
    Ssum += i

Averagee = Ssum / len(sorted_data)

print("평균값 : ", Averagee)
print('-'*30)
"----------------------------------------"
# 중위수.

if len(sorted_data) % 2 != 0 : 
    averagee = sorted_data[int(len(sorted_data))]
else :
    averagee =( sorted_data[int(len(sorted_data)/2)-1] + sorted_data[int(len(sorted_data)/2)])/2 

print("중위수 : ", averagee)
print('-'*30)
"----------------------------------------"
# 최빈값.
