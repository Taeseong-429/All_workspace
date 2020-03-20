# sample6.py

import pandas as pd


df_gapminder = pd.read_csv('doit_pandas\data\gapminder.tsv', sep='\t')

if df_gapminder is not None:
    df_gapminder.info()

    # print(dir(df_gapminder))
    pass


#########################################################################
# 4. 데이터프레임에서 기초 통계량 구하기
#########################################################################

#-----------------------------------------------------------------------#
# 4-4. 데이터프레임에서 그룹 데이터(Grouped Data)에 대한 평균 구하기
#-----------------------------------------------------------------------#
# DataFrame.groupby('column') or
# DataFrame.groupby( ['column1', 'column2', ...] )
#-----------------------------------------------------------------------#

# (1) 연도별(year), 평균 
#       - 기대수명(life expectancy, lifeExp)
#       - 인구수(Populator, pop)
#       - 1인당 국내총생산(Per Capita GDP)
#     구하기

df_groupby = df_gapminder.groupby('year')                   # 연도별
# df_groupby = df_gapminder.groupby(['year', 'country'])      # 연도별/국가별
# df_groupby = df_gapminder.groupby(['year', 'continent', 'country'])      # 연도별/대륙별/국가별

# print(dir(df_groupby))


# print('*1*' * 20)

# <class 'pandas.core.groupby.generic.DataFrameGroupBy'>
# print(type(df_groupby))

# pandas.core.groupby.generic.DataFrameGroupBy object at 0x000000000D6D4AC8>
# print(df_groupby)

# <class 'pandas.core.groupby.generic.SeriesGroupBy'>
# print(type(df_groupby.country), df_groupby.country, df_groupby['country'])
# print(type(df_groupby.continent), df_groupby.continent, df_groupby['continent'])
# print(type(df_groupby.year), df_groupby.year, df_groupby['year'])
# print(type(df_groupby.lifeExp), df_groupby.lifeExp, df_groupby['lifeExp'])
# print(type(df_groupby.pop), df_groupby.pop, df_groupby['pop'])
# print(type(df_groupby.gdpPercap), df_groupby.gdpPercap, df_groupby['gdpPercap'])


print('*2*' * 20)

groupby_mean = df_groupby['lifeExp'].mean()
# groupby_mean = df_groupby['pop'].mean()
# groupby_mean = df_groupby['gdpPercap'].mean()

print(type(groupby_mean))       # <class 'pandas.core.series.Series'>

print(groupby_mean)


print('*3*' * 20)

# groupby_mean = df_groupby[ ['lifeExp', 'gdpPercap'] ].mean()
groupby_mean = df_groupby[ ['lifeExp', 'gdpPercap', 'pop'] ].mean()

# print(type(groupby_mean))       # <class 'pandas.core.frame.DataFrame'>
groupby_mean.info()

print(groupby_mean)



#-----------------------------------------------------------------------#
# 4-5. 데이터프레임에서 그룹 데이터(Grouped Data)의 기초 통계량 구하기
#-----------------------------------------------------------------------#
# df_groupby = df_gapminder.groupby('year')                   # 연도별
# df_groupby = df_gapminder.groupby('continent')              # 대륙별
# df_groupby = df_gapminder.groupby('country')                # 국가별
df_groupby = df_gapminder.groupby(['year', 'continent'])  # 연도별/대륙별
# df_groupby = df_gapminder.groupby(['year', 'country'])    # 연도별/국가별
# df_groupby = df_gapminder.groupby(['year', 'continent', 'country'])   # 연도별/대륙별/국가별

print('*4*' * 20)
# print(df_groupby['year'].nunique())
# print(df_groupby['continent'].nunique())
# print(df_groupby['country'].nunique())
print(df_groupby['pop'].nunique())
# print(df_groupby['lifeExp'].nunique())
# print(df_groupby['gdpPercap'].nunique())


print('*5*' * 20)
print(df_groupby['year', 'continent', 'country', 'pop', 'lifeExp', 'gdpPercap'].nunique())


print('*6*' * 20)

# print(df_groupby['pop'].min())
# print(df_groupby.pop.min())

# print(df_groupby['pop'].max())
# print(df_groupby.pop.max())

# print(df_groupby['pop'].sum())
# print(df_groupby.pop.sum())

# print(df_groupby['pop'].mean())
print(df_groupby.pop.mean())

# print(df_groupby['pop'].median())
# print(df_groupby.pop.median())

# print(df_groupby['pop'].std())
# print(df_groupby.pop.std())

# print(df_groupby['pop'].var())
# print(df_groupby.pop.var())

# print(df_groupby['pop'].nunique())
# print(df_groupby.pop.nunique())

# print(df_groupby['pop'].quantile())
# print(df_groupby.pop.quantile())


# AttributeError: Cannot access callable attribute 'kurtosis' of 'SeriesGroupBy' objects, 
#                   try using the 'apply' method
# print(df_groupby['pop'].kurtosis())     # XXX
# print(df_groupby.pop.kurtosis())        # XXX

# print(df_groupby['pop'].skew())
# print(df_groupby.pop.skew())

# print(df_groupby['pop'].rank())
# print(df_groupby.pop.rank())
