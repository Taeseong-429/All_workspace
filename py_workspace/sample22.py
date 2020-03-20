# sample22.py
# Dictionary type

dic = { 'name': 'Yoseph', 'age': 24}
dic['tel'] = '01027626623'
dic[1] = 99
# dic['innerDic'] = {}
dic['innerDic'] = dict()
dic['age'] = 18
# dic[ [1,2,3] ] = str([1,2,3])
del dic[1]
del dic['innerDic']
# del dic


print(type(dic))
print(id(dic))
print(len(dic))

print( dic['name'] )

dic2 = { 1: 'value1', 1: 'value2'}
print(len(dic2))

dic3 = { 1: 'v1', 2: 'v2' }
# print( dic3[0] ) # KeyError
print( dic3[1] )

dic4 = {'name': 'pey', 'phone': '0119993323', 'birth': '1118'}
keys = dic4.keys()

print(type(keys))
print(keys)
print(len(keys))

print('-'*10)

# for key in keys   :
#     print(key)
#     pass

list_of_keys = list(keys)

allItems = dic4.items()
print(type(allItems))
print(len(allItems))
print(allItems)

# for <하나의 요소를 저장할 변수명> in <자료구조> :
#     수행시킬 코드1
#     수행시킬 코드2
#     ....
print('-'*50)

t = (1, 2)
( v1, v2 ) = t
print(v1)
print(v2)


for (key, val) in allItems:
    print(key, val)
    pass

#-----------------------#
print('-'* 50)

a = {'name':None, 'phone':'0119993323', 'birth': '1118'}

# value = a['nokey']
value = a.get('nokey')
print(value)

value = None
print(value)
print(type(value))
print(dir(value))

sno = a.get('sno', '000000-0000000')


a = {'name':None, 1:'0119993323', 'birth': '1118'}
#  key in dictionary
print( 'name' in a )
print( 1 in a )
print( 'nokey' in a )