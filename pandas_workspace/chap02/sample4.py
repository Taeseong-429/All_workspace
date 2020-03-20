# sample4.py

import pandas as pd


df_gapminder = pd.read_csv('doit_pandas\data\gapminder.tsv', sep='\t')
df_gapminder.info()


#########################################################################
# 3. 데이터프레임에서 행과 열 함께 지정하여, 원하는 부분범위의 데이터 추출하기
#########################################################################
#   가. 문법 2가지:
#       (1) df.loc[ [rows], [cols] ]
#       (2) df.iloc[ [rows], [cols] ]
#
#   나. 위 문법에서, 각 행과 열의 값을 지정하는 방식
#       (1) 슬라이싱(slicing) 방식
#       (2) range 메소드 방식
#
#   다. 위 문법에서, 열의 값을 지정시, 어떤 속성을 이용하는 냐에 따라 주의할 사항
#       (1) if df.loc 속성 이용: df.loc[ [rows], [** str ** type values]]
#       (2) if df.iloc 속성 이용: df.iloc[ [rows], [** int ** type values] ]
#########################################################################


#-----------------------------------------------------------------------#
# 3-1. 1st. method: df.loc[ [rows], [cols: *str* type] ]
#-----------------------------------------------------------------------#

#------------------------------------#
# 3-1-1. 슬라이싱(slicing) 방식
#------------------------------------#
# df_subset = df_gapminder.loc[:, :]                  # OK - all rows, all cols
# df_subset = df_gapminder.loc[:, ['year', 'pop']]    # OK - all rows, 2 cols

# KeyError: "None of [Int64Index([0, 1, 2, 3], dtype='int64')] are in the [columns]"
# df_subset = df_gapminder.loc[ :, [0,1,2,3] ]        # XXX

# TypeError: cannot do slice indexing on <class 'pandas.core.indexes.base.Index'> with these indexers [0] of <class 'int'>
# df_subset = df_gapminder.loc[ :, 0:4 ]              # XXX

# df_subset = df_gapminder.loc[ 0:4, 'year']          # OK - Series ( only 1 column specified )
# df_subset = df_gapminder.loc[ 0:4, ['year', 'pop'] ]    # OK
# df_subset = df_gapminder.loc[0:6:2, ['year', 'pop']]    # OK
df_subset = df_gapminder.loc[[0, 9, 99], ['country', 'lifeExp', 'gdpPercap']]   # OK


if isinstance(df_subset, pd.core.frame.DataFrame):
    print('*1*' * 20)
    df_subset.info()
    pass

print('*2*' * 20)
print(df_subset.head())


#------------------------------------#
# 3-1-2. range() 메소드 방식
#------------------------------------#
print('*3*' * 20)

print(type(range(5)))       # <class 'range'>

print(range(5))
print(range(0, 5))
print(range(0, 5, 1))

print(list(range(5)))       # convert from range to list

#------------------------------------#

print('*4*' * 20)

# column_list = range(0)          # OK - Empty DataFrame
# column_list = 'country'         # OK - only 1 column specified

# KeyError: "None of [Int64Index([0, 1, 2], dtype='int64')] are in the [columns]"
# column_list = range(3)          # XXX

# KeyError: "None of [Int64Index([0, 1, 2], dtype='int64')] are in the [columns]"
# column_list = list(range(3))    # XXX

# KeyError: "None of [Int64Index([0, 2, 4], dtype='int64')] are in the [columns]"
# column_list = range(0, 6, 2)    # XXX

# KeyError: "None of [Int64Index([1, 3, 5], dtype='int64')] are in the [columns]"
# column_list = range(1, 6, 2)    # XXX

column_list = ['country', 'continent', 'year']  # OK

if isinstance(column_list, range):
    print('- column_list:', list(column_list))
    pass
else:
    print('- column_list:', column_list)
    pass


df_subset = df_gapminder.loc[ :, column_list]

print(df_subset.head())


#-----------------------------------------------------------------------#
# 3-2. 2st. method: df.iloc[ [rows], [cols: *int* type] ]
#-----------------------------------------------------------------------#

#------------------------------------#
# 3-2-1. 슬라이싱(slicing) 방식
#------------------------------------#
# df_subset = df_gapminder.iloc[:, :]                  # OK - all rows, all cols

# IndexError: .iloc requires numeric indexers, got ['year' 'pop']
# df_subset = df_gapminder.iloc[:, ['year', 'pop']]    # XXX

# df_subset = df_gapminder.iloc[ :, [0,1,2,3] ]        # OK - all rows, 0th. to 3nd. columns
# df_subset = df_gapminder.iloc[ :, 0:4 ]              # OK - all rows, 0th. to 3nd. columns
# df_subset = df_gapminder.iloc[0:6:2, 1:10:2]        # OK - only even rows, odd columns
df_subset = df_gapminder.iloc[[0, 9, 99], [0, 3, 5]]    # OK

# ValueError: Location based indexing can only have [integer, integer slice (START point is INCLUDED, END point is EXCLUDED), 
# listlike of integers, boolean array] types
# df_subset = df_gapminder.iloc[ 0:4, 'year']             # XXX

# IndexError: .iloc requires numeric indexers, got ['year' 'pop']
# df_subset = df_gapminder.iloc[ 0:4, ['year', 'pop'] ]   # XXX


if isinstance(df_subset, pd.core.frame.DataFrame):
    print('*5*' * 20)
    df_subset.info()
    pass

print('*6*' * 20)
print(df_subset.head())


#------------------------------------#
# 3-2-2. range() 메소드 방식
#------------------------------------#
print('*7*' * 20)

print(type(range(5)))       # <class 'range'>

print(range(5))
print(range(0, 5))
print(range(0, 5, 1))

print(list(range(5)))       # convert from range to list

#------------------------------------#

print('*8*' * 20)

# column_list = range(0)          # OK - Empty DataFrame
# column_list = range(3)          # OK
# column_list = list(range(3))    # OK
# column_list = range(0, 6, 2)    # OK - only even columns
column_list = range(1, 6, 2)    # OK - only odd columns

# IndexError: .iloc requires numeric indexers, got ['country' 'continent' 'year']
# column_list = ['country', 'continent', 'year']  # XXX

if isinstance(column_list, range):
    print('- column_list:', list(column_list))
    pass
else:
    print('- column_list:', column_list)
    pass


df_subset = df_gapminder.iloc[ :, column_list]

print(df_subset.head())


#-----------------------------------------------------------------------#
# 3-3. Case by using DataFrame.iloc/loc attribute
#-----------------------------------------------------------------------#
print('*9*' * 20)

df_gapminder.info()

# df_subset = df_gapminder.loc[10:13, ['country', 'lifeExp', 'gdpPercap']]    # OK

# IndexError: .iloc requires numeric indexers, got ['country' 'lifeExp' 'gdpPercap']
# df_subset = df_gapminder.iloc[10:13, ['country', 'lifeExp', 'gdpPercap']]   # XXX
df_subset = df_gapminder.iloc[10:14, [1, 3, 5]]                   # OK

print(df_subset)
