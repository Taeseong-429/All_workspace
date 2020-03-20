# sample2.py

import pandas as pd


df_gapminder = pd.read_csv('doit_pandas\data\gapminder.tsv', sep='\t')
df_gapminder.info()


#########################################################################
# 1. 데이터프레임에서 열 단위 추출
#########################################################################

#-----------------------------------------------------------------------#
# 1-1. 데이터프레임에서 1개의 열 데이터만 추출하는 경우
#-----------------------------------------------------------------------#
#   type: <class 'pandas.core.series.Series'>
#-----------------------------------------------------------------------#

country = df_gapminder['country']       # country 열 데이터 추출
continent = df_gapminder['continent']   # continent 열 데이터 추출
year = df_gapminder['year']             # year 열 데이터 추출
lifeExp = df_gapminder['lifeExp']       # lifeExp 열 데이터 추출
pop = df_gapminder['pop']               # pop 열 데이터 추출
gdpPercap = df_gapminder['gdpPercap']   # gdpPercap 열 데이터 추출

#-----------------------------------------------------------------------#

print('-' * 80)

print(type(country))                    # country 열 데이터 타입 출력

print(country)                          # country 열 데이터 전체 출력

#-----------------------------------------------------------------------#

print('-' * 80)

print(country.head())                   # country 열의 기본 5개 행 데이터 출력(앞)
# print(country.head(10))               # country 열의 지정 행 크기만큼 데이터 출력

#-----------------------------------------------------------------------#

print('-' * 80)

print(country.tail())                   # country 열의 기본 5개 행 데이터 출력(뒤)
# print(country.tail(10))               # country 열의 지정 행 크기만큼 데이터 출력


#-----------------------------------------------------------------------#
# 1-2. 데이터프레임에서 1개 이상의 열 데이터를 추출하는 경우
#-----------------------------------------------------------------------#
#   type: <class 'pandas.core.frame.DataFrame'>
#-----------------------------------------------------------------------#

# 데이터프레임에서 추출할 열 목록 준비

# (*주의1*) 데이터프레임에서, 단지 1개의 열 데이터만 추출하더라도, 그 방식이
# df['column_name'] 일때는, 타입이 시리즈이지만,
# 아래와 같이 리스트에 넣어서 추출하는 경우는, 데이터프레임이 됨(1개 열로 구성)

# (*주의2*) 아래와 같이, 추출할 열 목록을 작성 시, 목록에 나온 열의 이름 순서대로,
#  데이터프레임에서, 열 데이터가 추출됨

#------------------------------------#
# 1st. method: using list object
#------------------------------------#
# column_list = ['country']             # *주의*
# column_list = ['country', 'continent']
# column_list = ['country', 'continent', 'year']
# column_list = ['country', 'continent', 'year', 'lifeExp']
# column_list = ['country', 'continent', 'year', 'lifeExp', 'pop']
# column_list = ['country', 'continent', 'year', 'lifeExp', 'pop', 'gdpPercap']

# 추출할 열의 순서를 다르게 지정
# column_list = ['year', 'pop', 'continent', 'lifeExp', 'gdpPercap', 'country']


#------------------------------------#
# 2st. method: using set object
#------------------------------------#
# column_list = {'country'}           # *주의*
# column_list = {'country', 'continent'}
# column_list = {'country', 'continent', 'year'}
# column_list = {'country', 'continent', 'year', 'lifeExp'}
# column_list = {'country', 'continent', 'year', 'lifeExp', 'pop'}
# column_list = {'country', 'continent', 'year', 'lifeExp', 'pop', 'gdpPercap'}

# 추출할 열의 순서를 다르게 지정
# column_list = {'year', 'pop', 'continent', 'lifeExp', 'gdpPercap', 'country'}


#------------------------------------#
# 3st. method: using dict object
#------------------------------------#
# column_list = {'country': 1}           # *주의*
# column_list = {'country': 1, 'continent': 2}
# column_list = {'country': 1, 'continent': 2, 'year': 3}
# column_list = {'country': 1, 'continent': 2, 'year': 3, 'lifeExp': 4}
# column_list = {'country': 1, 'continent': 2, 'year': 3, 'lifeExp': 4, 'pop': 5}
# column_list = {'country': 1, 'continent': 2, 'year': 3, 'lifeExp': 4, 'pop': 5, 'gdpPercap': 6}

# 추출할 열의 순서를 다르게 지정
column_list = {'year': 1, 'pop': 2, 'continent': 3, 'lifeExp': 4, 'gdpPercap': 5, 'country': 6}


#------------------------------------#
# 4st. method: using tuple object   
#------------------------------------#

# XX: 오류발생: KeyError: ('country',)
# column_list = ('country', )           # *주의* : tuple 타입을 위해, ',' 필요

#-----------------------------------------------------------------------#

df = df_gapminder[column_list]      # 데이터프레임에서 지정한 열 데이터 추출

#-----------------------------------------------------------------------#

print('-' * 80)
print('1. type(df):', type(df))


print('-' * 80)
print('2. df.info():')
df.info()


print('-' * 80)
print('3. df.head():\n', df.head())

print('-' * 80)
print('4. df.tail():\n', df.tail())

#-----------------------------------------------------------------------#

print('-' * 80)
print('5. df.shape:', df.shape)

print('-' * 80)
print('6. df.columns:', df.columns)

print('-' * 80)
print('7. df.index:', df.index)

print('-' * 80)
print('8. df.dtypes:')
print(df.dtypes)

print('-' * 80)
print('9. df_info():')
df.info()

print('-' * 80)
print(df)





