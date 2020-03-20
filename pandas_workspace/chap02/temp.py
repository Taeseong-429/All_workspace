# temp.py
import pandas as pd
import os 


df = pd.read_csv('doit_pandas\data\gapminder.tsv', sep = '\t')



if df is not None :
    # print(df.head())
    # print(df.tail())
    # # print()
    # # print()
    # # print()
    # print(df.index)
    print(type(df.head()))
    print(type(df.tail()))
    print(type(df.head()['pop']))
    # # 1.
    # for column in df_gapminder.columns:
    #     print('\t- column:', column)
    #     pass
    
    # # 2. 리스트로 형변환
    # l_columns = list(df.gapminder.columns)
    # pass