import pandas as pd
import matplotlib.pyplot as plt

sido_list = {
'강원' : ['속초', '북춘천', '철원', '대관령', '춘천', '북강릉', '강릉', '동해', '원주', '영월', '인제', '홍천', '태백', '정선군'],
'경기' : ['동두천', '파주', '수원', '양평', '이천'],
'충북' : ['충주', '추풍령', '제천', '보은', '청주'],
'충남' : ['서산', '홍성', '보령', '부여', '금산', '천안'],
'대전' : ['대전'],
'경북' : ['울릉도', '울진', '안동', '상주', '포항', '봉화', '영주', '문경', '청송군', '영덕', '의성', '구미', '영천', '경주시'],
'경남': ['창원', '통영', '진주', '김해시', '북창원', '양산시', '의령군', '함양군', '밀양', '산청', '거제', '남해', '합천', '거창'],
'전북' : ['군산', '전주', '고창', '부안', '임실', '정읍', '남원', '장수', '고창군', '순창군', '장흥'],
'전남' : ['목포', '여수', '흑산도', '완도', '순천', '진도', '영광군', '보성군', '강진군', '해남', '고흥', '광양시', '진도군'],
'서울' : ['서울'],
'인천' : ['백령도', '인천', '강화'],
'대구' : ['대구'],
'울산' : ['울산'],
'광주' : ['광주'],
'부산' : ['부산'],
'제주' : ['제주', '고산', '성산', '서귀포']}

sido_code = {
     '42' : '강원',
     '41' : '경기',
     '43' : '충북',
     '44' : '충남',
     '30' : '대전',
     '47' : '경북',
     '48' : '경남',
     '45' : '전북',
     '46' : '전남', 
     '11' : '서울', 
     '28' : '인천',
     '27' : '대구',
     '31' : '울산',
     '29' : '광주', 
     '26' : '부산', 
     '49' : '제주',
     '36' : '세종'
}

def sido_func(vector):
    for i in sido_list:
        if vector in sido_list[i] :
            return i
            pass
        pass
    pass

def sido_code_func(vector2):
    for i in sido_code:
        if vector2 == sido_code[i]:
            return str(i)
            pass
        pass
    pass

for i in [2016,2017,2018]:
    df = pd.read_csv(f'C:/app/TeamProject/origin_weather_Data/종기상관측_ASOS_{i}.csv', encoding = 'cp949')
    df['시도'] = df['지점명'].apply(sido_func)
    
    df_mk_sejong = df[df['지점명'].str.contains('대전|청주|천안', regex=True)]
    df_mk_sejong['시도'] = df_mk_sejong['지점명'].apply(lambda x :'세종')
    df_concat = pd.concat([df,df_mk_sejong])
    df_concat['시도코드'] = df_concat['시도'].apply(sido_code_func)
    df_group = df_concat.drop(['지점','강수 계속시간(hr)', '일강수량(mm)', '일 최심신적설(cm)'], axis=1).groupby(['시도코드','일시']).mean()
    
    
    df_group.to_csv(f'C:/app/TeamProject/mod_weather_Data/기상관측_{i}_Fixed.csv', encoding = 'cp949')
    pass