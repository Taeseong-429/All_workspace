import pandas as pd
import os


#----------------------------------------------------------------#
# 1. 현재 작업 디렉토리 : 좌측 Explorer 에서,
#   Workspace 에 추가된 폴더가 / (root) 가 됨.
#----------------------------------------------------------------#
print('0. Current working dir:', os.getcwd())


#----------------------------------------------------------------#
# 2. CSV 데이터셋 파일을, 판다스의 데이터프레임(DataFrame)으로 불러옴
#----------------------------------------------------------------#
print('-' * 80)

df = pd.read_csv('doit_pandas\data\gapminder.tsv', sep = '\t')

print('1. df:', type(df))             # <class 'pandas.core.frame.DataFrame'>
print("2. df['country']:", type(df['country']))  # <class 'pandas.core.series.Series'>


#----------------------------------------------------------------#
# 3. 데이터프레임 탐색하기
#----------------------------------------------------------------#
print('-' * 80)

#----------------------------------------------------------------#
# 3-1. 데이터프레임의 앞에서, 기본 5개 행 또는 지정된 행수만큼 출력
#----------------------------------------------------------------#
print(df.head())            # by default, 5 rows displayed

print('-' * 80)

print(df.head(n=10))
# print(df.head(10))

print('-' * 80)

#----------------------------------------------------------------#
# 3-2. 데이터프레임의 뒤에서, 기본 5개 행 또는 지정된 행수만큼 출력
#----------------------------------------------------------------#
print(df.tail())            # by default, 5 rows displayed

print('-' * 80)

print(df.tail(n=10))
# print(df.tail(10))

#----------------------------------------------------------------#
# 3-3. head(), tail() method 의 반환값 : 데이터프레임
#----------------------------------------------------------------#
print('-' * 80)

print('3. df.head():', type(df.head()))  # <class 'pandas.core.frame.DataFrame'>
print('4. df.tail():', type(df.tail()))  # <class 'pandas.core.frame.DataFrame'>

#----------------------------------------------------------------#
# 3-4. head(), tail() method 의 반환값이 데이터프레임이므로, 
#       다시 하나의 컬럼(열)을 지정하면 시리즈가 됨
#----------------------------------------------------------------#
# <class 'pandas.core.series.Series'>
print("5. df.head()['pop']:", type(df.head()['pop']))
print("6. df.tail()['country']:", type(df.tail()['country']))

print('-' * 80)
print(df.head()['pop'])         # 하나의 시리즈(Series) 출력

print('-' * 80)
print(df.tail()['country'])     # 하나의 시리즈(Series) 출력

#----------------------------------------------------------------#
# 3-5. 데이터프레임의 shape 속성
#----------------------------------------------------------------#
#   - 데이터프레임의 차원(dimension, 즉, 행열의 크기) 정보 저장
#   - tuple type
#----------------------------------------------------------------#
print('-' * 80)

print('7. df.shape:', type(df.shape))

print(df.shape)             # 데이터프레임의 차원(dimension) 출력
print(df.shape[0])          # 데이터프레임의 행의 개수 출력
print(df.shape[1])          # 데이터프레임의 열의 개수 출력

#----------------------------------------------------------------#
# 3-6. 데이터프레임의 columns 속성
#----------------------------------------------------------------#
#   - 데이터프레임의 열(들)의 정보 저장
#   - 판다스의 Index type (Iterable Object)
#   - 파이썬의 리스트 타입으로 변환가능
#----------------------------------------------------------------#
print('-' * 80)

# <class 'pandas.core.indexes.base.Index'>
print('8. df.columns:', type(df.columns))

print(df.columns)
print(len(df.columns))      # df.shape[1] 과 같음(열의 개수)
print(list(df.columns))     # 파이썬의 리스트 타입으로 변환

for column in df.columns:
    print('\t- column:', column)
    pass

#----------------------------------------------------------------#
# 3-7. 데이터프레임의 dtypes 속성
#----------------------------------------------------------------#
#   - 데이터프레임의 각 열의 자료형 정보 저장
#   - 판다스의 시리즈(Series) type (데이터프레임의 각 열의 타입과 동일)
#   - 데이터프레임의 각 열의 자료형 정보를 시리즈 형태로 관리
#   - 시리즈의 인덱스 = 데이터프레임의 각 열의 이름
#   - 시리즈의 값 = 데이터프레임의 각 열의 자료형(타입)
#----------------------------------------------------------------#
print('-' * 80)

# <class 'pandas.core.series.Series'>
print('9. df.dtypes:', type(df.dtypes))

print(df.dtypes)

print('-' * 80)

# country 열의 자료형 출력
print('- country column:\t', df.dtypes['country'], '=', df.dtypes[0])

# continent 열의 자료형 출력
print('- continent column:\t', df.dtypes['continent'], '=', df.dtypes[1])

#----------------------------------------------------------------#
# 3-8. 데이터프레임의 index 속성
#----------------------------------------------------------------#
#   - 데이터프레임의 각 행의 인덱스 번호 정보 저장
#   - 데이터프레임의 행들의 시작 인덱스 번호는 0부터 시작
#   - 데이터프레임의 행들의 끝 인덱스 번호는 n-1 (n: 총 행의 개수)
#   - <class 'pandas.core.indexes.range.RangeIndex'>
#   - Iterable Object
#----------------------------------------------------------------#
print('-' * 80)

print('10. df.index:', type(df.index))

print(df.index)

# for index in df.index:
#     print('\t index:', index)
#     pass

#----------------------------------------------------------------#
# 3-9. 데이터프레임의 info() method
#----------------------------------------------------------------#
#   - 데이터프레임의 모든 정보를 출력(Print a concise summary of a DataFrame)
#   - This method prints information about a DataFrame including
#     the 
#       (1) index
#       (2) dtype
#       (3) column
#       (4) dtypes
#       (5) non-null values
#       (6) memory usage
#----------------------------------------------------------------#
print('-' * 80)

df.info()


#----------------------------------------------------------------#
# 4. 판다스의 시리즈(Series) 속성
#----------------------------------------------------------------#
print('-' * 80)

series = df.dtypes  # 데이터프레임의 열 정보 저장, dtypes 속성(시리즈)

print(series)

#----------------------------------------------------------------#
# 4-1. shape 속성
#----------------------------------------------------------------#
#   - 데이터프레임의 shape(차원, 행열의 크기)와 동일(열의 크기는 제외)
#   - tuple 타입: ( rows,  )
#----------------------------------------------------------------#
print('-' * 80)

print('10. Series.shape:', type(series.shape), ', ', len(series.shape))

print(series.shape)         # tuple type : (rows, )
print(series.shape[0])      # n of rows
# print(series.shape[1])      # X : IndexError: tuple index out of range

#----------------------------------------------------------------#
# 4-2. index 속성
#----------------------------------------------------------------#
#   - 기능상, 데이터프레임의 index와 동일(각 행의 이름 또는 인덱스 번호 저장)
#   - 시리즈에서는, 결국, 데이터프레임의 각 열의 이름 정보 저장
#   - <class 'pandas.core.indexes.base.Index'>
#   - Iterable object
#----------------------------------------------------------------#
print('-' * 80)

print('11. Series.index:', type(series.index))  # <class 'pandas.core.indexes.base.Index'>

print(series.index)

for index in series.index:
    print('\t- index:', index)
    pass

#----------------------------------------------------------------#
# 4-3. columns 속성
#----------------------------------------------------------------#
#   - 지원하지 않음
#   - AttributeError: 'Series' object has no attribute 'columns'
#----------------------------------------------------------------#
# print('-' * 80)

# print(series.columns)      # X: not supported attribute

#----------------------------------------------------------------#
# 4-4. dtypes 속성
#----------------------------------------------------------------#
#   - 기능상, 데이터프레임의 dtypes 와 동일(각 열의 이름 또는 인덱스 번호 저장)
#   - 시리즈에서는, 항상, object(str 타입과 동일명) 임
#----------------------------------------------------------------#
print('-' * 80)

print(series.dtypes)

#----------------------------------------------------------------#
# 4-5. info() method
#----------------------------------------------------------------#
#   - 지원하지 않음
#   - AttributeError: 'Series' object has no attribute 'info'
#----------------------------------------------------------------#
# print('-' * 80)

# series.info()    # XX : not supported

#----------------------------------------------------------------#
# 4-6. head(), tail() method 의 반환값이 시리즈!!
#----------------------------------------------------------------#
print('-' * 80)

print(series.head())


print('-' * 80)

print(series.tail())


print('-' * 80)

print("12. series.head():", type(series.head()))
print("13. series.tail():", type(series.tail()))


