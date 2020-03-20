# sample3.py

import pandas as pd


df_gapminder = pd.read_csv('doit_pandas\data\gapminder.tsv', sep='\t')
df_gapminder.info()


#########################################################################
# 2. 데이터프레임에서 행 단위 추출
#########################################################################


#-----------------------------------------------------------------------#
# 2-1. 1st. method: index slicing
#-----------------------------------------------------------------------#
print('-' * 80)

#------------------------------------#
# print(df_gapminder[0])          # XX - KeyError: 0
# print(df_gapminder[, ])         # XX - SyntaxError: invalid syntax
# print(df_gapminder[0, ])        # XX - KeyError: (0,)
# print(df_gapminder[0, 0])       # XX - KeyError: (0, 0)
#------------------------------------#

#------------------------------------#
print(df_gapminder[0:5])        # OK - range index from 0 to 4 (total 5 rows)
# print(df_gapminder[0:0])        # OK - **Empty** DataFrame
# print(df_gapminder[[0, 3, 5]])      # XX - KeyError: "None of [Int64Index([0, 3, 5], dtype='int64')] are in the [columns]"
#------------------------------------#

#------------------------------------#
# print(df_gapminder[0:3, ])      # XX - TypeError: '(slice(0, 3, None),)' is an invalid key
# print(df_gapminder[0:3, 0:1])   # XX - TypeError: '(slice(0, 3, None), slice(0, 1, None))' is an invalid key
# print(df_gapminder[0:3, 'country'])     # XX - TypeError: '(slice(0, 3, None), 'country')' is an invalid key
# print(df_gapminder[0:3, ['country']])   # XX - TypeError: '(slice(0, 3, None), ['country'])' is an invalid key
#------------------------------------#


#-----------------------------------------------------------------------#
# 2-2. 2st. method: DataFrame.loc 속성
#-----------------------------------------------------------------------#
#   - "인덱스"를 기준으로, 행 데이터 추출
#   - "인덱스" : 데이터프레임의 출력결과 나타나는 각 행의 번호 또는 문자열 의미
#   - 여기서, "인덱스"의 의미는, 파이썬 자료구조의 인덱스와는 다른 의미(즉, 행번호/행이름)
#   - <class 'pandas.core.indexing._LocIndexer'>
#-----------------------------------------------------------------------#
print('-' * 80)

print(type(df_gapminder.loc))       # <class 'pandas.core.indexing._LocIndexer'>
print(df_gapminder.loc)


#------------------------------------#
print('-' * 80)

print(type(df_gapminder.index))     # <class 'pandas.core.indexes.range.RangeIndex'>
print(df_gapminder.index)           # RangeIndex(start=0, stop=1704, step=1)


#------------------------------------#
print('-' * 80)

# 지정된 인덱스에 해당하는 한 개의 행 데이터를,
# 시리즈 타입과 형태로 반환
print(type(df_gapminder.loc[0]))        # <class 'pandas.core.series.Series'>
print(df_gapminder.loc[0])
print(df_gapminder.loc[10])
# print(df_gapminder.loc[-1])             # XX: KeyError: -1


#------------------------------------#
print('-' * 80)

# 지정된 인덱스 슬라이싱에 해당하는 1개 이상의 행 데이터를,
# 데이터프레임 타입과 형태로 반환
print(type(df_gapminder.loc[0:0]))      # <class 'pandas.core.frame.DataFrame'>

print('-' * 80)
print(df_gapminder.loc[0:0])            # index 0, row extracted

print('-' * 80)
print(df_gapminder.loc[:])              # all index, all rows extracted

print('-' * 80)
print(df_gapminder.loc[0:3])            # range index from 0 to 3, all the specified rows extracted

print('-' * 80)
print(df_gapminder.loc[4:])             # range index from 4 to end, all the specified rows extracted

print('-' * 80)
print(df_gapminder.loc[:3])             # range index from 0 to 3, all the specified rows extracted


print('-' * 80)

# 지정된 인덱스의 행들만 추출하기
# print(df_gapminder.loc[0, 3, 5])              # XX
# print(df_gapminder.loc[(0, 3, 5)])            # XX - if tuple

# print(df_gapminder.loc[ [0, 3, 5] ])            # OK - if list
# print(df_gapminder.loc[ {0, 3, 5} ])            # OK - if set
print(df_gapminder.loc[ {0:1, 3:2, 5:3} ])      # OK - if dict


#------------------------------------#
print('-' * 80)

# To extract the last row of a dataframe - 1
#   - 시리즈로 마지막 행 데이터 추출
last_index = df_gapminder.shape[0] - 1      # 1st. method
# last_index = len(df_gapminder) - 1          # 2st. method
# last_index = len(df_gapminder.index) - 1    # 3st. method

print(type(df_gapminder.loc[last_index]))   # <class 'pandas.core.series.Series'>
print(df_gapminder.loc[last_index])


#------------------------------------#
print('-' * 80)

# To extract the last row of a dataframe - 2
#   - 데이터프레임으로 마지막 행 데이터 추출
print(type(df_gapminder.tail(1)))
print(df_gapminder.tail(1))


#-----------------------------------------------------------------------#
# 2-3. 3st. method: DataFrame.iloc 속성
#-----------------------------------------------------------------------#
#   - "행번호"를 기준으로, 행 데이터 추출
#   - "행번호" : 데이터프레임의 행 데이터의 순서를 의미(인덱스와 다름)
#   - 여기서, "행번호"의 의미는, 판다스 자료구조의 인덱스와는 다른 의미(즉, 행의 순서)
#   - <class 'pandas.core.indexing._iLocIndexer'>
#-----------------------------------------------------------------------#
print('-' * 80)

print(type(df_gapminder.iloc))                  # <class 'pandas.core.indexing._iLocIndexer'>
print(df_gapminder.iloc)                        # <pandas.core.indexing._iLocIndexer object at 0x000000000E8509F8>

print('-' * 80)
print(type(df_gapminder.iloc[0]))               # <class 'pandas.core.series.Series'>
print(df_gapminder.iloc[0])                     # only 1 row, first row by Series
# print(df_gapminder.iloc[-1])                    # only 1 row, last row by Series
# print(df_gapminder.iloc[9999])                  # XX - IndexError: single positional indexer is out-of-bounds

print('-' * 80)
print(type(df_gapminder.iloc[0:3]))             # <class 'pandas.core.frame.DataFrame'>
print(df_gapminder.iloc[0:3])                   # rows from 0st. to 2nd. (excluding 3rd row)
# print(df_gapminder.iloc[-2:-1])                 # excluding -1 row number
# print(df_gapminder.iloc[-3:])                   # from 1701 to 1703

print('-' * 80)
print(type(df_gapminder.iloc[ [0, 1, 2, 3] ]))  # <class 'pandas.core.frame.DataFrame'>
print(df_gapminder.iloc[ [0, 1, 2, 3] ])        # including 0, 1, 2, 3 th. rows
# print(df_gapminder.iloc[ (0,1,2,3) ])           # XX - pandas.core.indexing.IndexingError: Too many indexers
# print(df_gapminder.iloc[ {0,1,2,3} ])           # XX - TypeError: int() argument must be a string, a bytes-like object or a number, not 'set'
# print(df_gapminder.iloc[ {0:1, 1:2, 2:3} ])     # XX - TypeError: int() argument must be a string, a bytes-like object or a number, not 'dict'

print('-' * 80)
print(type(df_gapminder.iloc[0:3, 0:3]))        # <class 'pandas.core.frame.DataFrame'>
print(df_gapminder.iloc[0:3, 0:3])              # rows: 0, 1, 2 th, columns: 0, 1, 2 th. (excluding 3th.)

print('-' * 80)
print(df_gapminder.iloc[0:3, [0, 1, 2, 3]])     # rows: 0, 1, 2 th, columns: 0, 1, 2, 3 th. (including 4th.)

print('-' * 80)
print(df_gapminder.iloc[0, 0])                  # 데이터프레임에서, 특정 셀(cell) 하나만 지정하는 경우
print(type(df_gapminder.iloc[0, 0]))            # <class 'str'>

# ** Caution ** : IndexError: .iloc requires numeric indexers, got ['country' 'continent' 'year']
# print(df_gapminder.iloc[0:3, ['country', 'continent', 'year']])