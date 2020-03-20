# sample5.py

import pandas as pd


df_gapminder = pd.read_csv('doit_pandas\data\gapminder.tsv', sep='\t')

if df_gapminder is not None:
    df_gapminder.info()
    pass


#########################################################################
# 4. 데이터프레임에서 기초 통계량 구하기 - 기본적인 통계량, 기초 통계량 구하기
#########################################################################

print('*1*' * 20)

# print(df_gapminder.head(10))

# df_subset = df_gapminder.loc[0:9, ]       # Ok
# df_subset = df_gapminder.loc[0:9, :]      # Ok
# df_subset = df_gapminder.loc[0:9, 0:]       # XXX

# df_subset = df_gapminder.iloc[0:10, 0:]     # OK
df_subset = df_gapminder.iloc[0:10, :6]     # OK

print(df_subset)


print('*2*' * 20)

pop = df_subset['pop']

print(type(pop))                # <class 'pandas.core.series.Series'>
print(pop)

# print(dir(pop))


#-----------------------------------------------------------------------#
# 4-1. 데이터프레임의 각 열(시리즈)에 대한 기초통계량 구하기
#-----------------------------------------------------------------------#
print('*3*' * 20)
print('- min:', pop.min())                  # 최소값
print('- max:', pop.max())                  # 최대값
print('- mean:', pop.mean())                # mean (평균)
print('- median:', pop.median())            # 중위수
print('- std:', pop.std())                  # 표준편차
print('- var:', pop.var())                  # 분산
print('- sum:', pop.sum())                  # 합계
print('- nunique:', pop.nunique())          # 고유한 값의 개수
print('- quantile:', pop.quantile())        # 분위수(0 ~ 1): default .5 (50%)
print('- quantile:', pop.quantile(.8))      # 분위수(0 ~ 1): .8(80%)
print('- kurtosis:', pop.kurtosis())        # 첨도
print('- skew:', pop.skew())                # 왜도
print('- rank:')                            # 값의 순위(ranking)
print(pop.rank())

- df.min() : 사전순으로 끄집어냄. 각 컬럼의 타입별로 최소값 !
- df.max() : 각 구성별로 가장 높은 값을 끄집어냄. 문자열 데이터는 사전 순서로 !
- df.mean() : 각 컬럼의 평균을 끄집어냄. 문자열 컬럼은 안뽑아냄.
- df.median() # 정렬 이후에 중간값 뽑아냄. 여기도 문자열은 없음.
- df.std() : 숫자가 아닌값은 제외하고 표준편차
- df.var() : 숫자가 아닌 값은 제외하고 분산
- df.sum() : 총합. 문자열도 인덱스 갯수만큼 1704 번 더함.
- df.nunique() :
- df.quantile() : 기본 분위수는 50% (.5)
- df.kurtosis() : 값이 클수록 뾰족해지고 작을수록 밋밋해짐.
- df.skew() :  왼쪽으로 치우쳤느냐, 왼쪽으로 치우쳤느냐
- df.rank()
- df.describe() : 숫자 타입의 컬럼별로 기초통계량 보여줌.

#-----------------------------------------------------------------------#
# 4-2. 데이터프레임의 각 열(시리즈)에 대한 탐색
#-----------------------------------------------------------------------#
print('*4*' * 20)

print('- mode:')                            # 해당 열의 타입출력
print(pop.mode())

print('- head:')                            # head
print(pop.head())

print('- tail:')                            # tail
print(pop.tail())


#-----------------------------------------------------------------------#
# 4-3. 데이터프레임의 각 열(시리즈)에 대한 변환
#-----------------------------------------------------------------------#
print('*5*' * 20)

pop_json = pop.to_json()                    # from Series to JSON
print('- pop_json:', pop_json)

pop_list = pop.to_list()                    # from Series to list
print('- pop_list:', pop_list)

pop_dict = pop.to_dict()                    # from Series to dict
print('- pop_dict:', pop_dict)

pop_frame = pop.to_frame()                  # from Series to DataFrame
print('- pop_frame:')
print(pop_frame)

pop_string = pop.to_string()                # from Series to str
print('- pop_string:')
print(pop_string)