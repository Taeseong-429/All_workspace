### 10장 텍스트 마이닝
# 자바 설치 후 진행하기 ! 
# ps. 우분투에서 자바 설치하려면 apt search default-jdk (이거 한 다음 뭐 버전 따로 지정하고
# 한거 같은데 난 그냥 윈도우에다 함 )

install.packages('rJava', dependencies = T) # KoNLP를 하기 위한 설치치
install.packages('memoise', dependencies = T)

# install.packages('KoNLP')
install.packages('devtools',dependencies = T)
library(devtools)
install_github('haven-jeon/KoNLP',dependencies = T) # 치고 All 선택
library(KoNLP)

# 워드 클라우드 만들기
install.packages('wordcloud', dependencies = T)
library(wordcloud)
library(dplyr)


# 사전 설정하기
useNIADic() # 단어를 형태소로 잘 끊어낼 수 있도록 형태소 사전을 선정. 세종도 있고 많음.

# 데이터 준비
# 데이터 불러오기
txt <- readLines('Data/hiphop.txt', encoding = 'UTF-8')
txt

# 특수문자 제거
install.packages('stringr', dependencies = T)
library(stringr)

# 특수문자 제거
txt <- str_replace_all(txt, "\\W", " ") # 특수문자를 지정하는 정규식. (공백하나로바꿔라)
txt

## 가장 많이 사용된 단어 알아보기
extractNoun('대한민국의 영토는 한반도와 그 부속도서로 한다')
extractNoun('나는 한국인이다') # 동사를 떼어냄.
class(extractNoun('나는 한국인이다')) # 동사를 떼어냄.) # 타입은 캐릭터.


# 가사에서 명사 추출
nouns <- extractNoun(txt) # 이거 타입은 리스트 !! 
nouns
unlist(nouns)
# 추출한 명사 list를 문자열 벡터로 변환, 단어별 빈도표 생성
wordcount <- table(unlist(nouns))
wordcount
class(wordcount) # 그냥 테이블. 이걸 데이터 프레임으로 만들기.

# 자주 사용된 단어 빈도표 만들기
df_word <- as.data.frame(wordcount, stringsAsFactors = F) # Factor 타입을 범주형으로 만들지 마라 ! 
# 그럼 팩터타입 아니고 chr 타입으로 나옴.
df_word

# 변수명 수정
df_word <- rename(df_word,
                  word = Var1,
                  freq = Freq)
df_word

# 두 글자 이상 단어 추출
df_word <- filter(df_word, nchar(word) >= 2)
# df_word <- df_word %>% arrange(desc(freq)) %>%  head(20) # 위에 문장이랑 같은데 파이프 오퍼레이터 사용.

# nchar 실습
nchar('A B') # 문자의 갯수
nchar('ABCD')# 단어의 갯수가 아닌 문자의 갯수

top_20 <- df_word %>% 
  arrange(desc(freq)) %>% 
  head(20)
top_20

## 워드 클라우드 만들기
# 패키지 준비하기
# 패키지 설치
install.packages('wordcloud', dependencies = T)
library(wordcloud)
library(RColorBrewer)

## 워드 클라우드 만들기

# 단어 색상 목록 만들기
pal <- brewer.pal(8, 'Dark2') # Dark2 색상 목록에서 8개 색상 추출
pal #  컴퓨터에서 색상을 지정하는 RGB 값

# 워드 클라우드 생성
set.seed(1234) # 난수 고정. 난수 만들기 위한 ...
wordcloud(words = df_word$word, # 단어
          freq = df_word$freq, # 빈도
          min.freq = 2, # 최소 단어 빈도
          max.words = 200, # 표현 단어 수
          random.order = F, # 고빈도 단어 중앙 배치 # 난수 생성으로
          rot.per = .1, # 회전 단어 비율 # 10% 정도만 회전시켜라
          scale = c(4, 0.3), # 단어 크기 범위 # 이 값을 조절하면 단어 크기 변동..
          colors = pal) # 색깔 목록록

# ----------------------------------------------------
