# sample7.py

import pandas as pd


df_gapminder = pd.read_csv('doit_pandas\data\gapminder.tsv', sep='\t')

if df_gapminder is not None:
    df_gapminder.info()

    # print(dir(df_gapminder))
    pass


#########################################################################
# 5. 시리즈와 데이터프레임 객체 만들기
#########################################################################

