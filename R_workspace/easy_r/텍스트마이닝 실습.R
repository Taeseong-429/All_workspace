# 텍스트 마이닝 실습

library(KoNLP)
library(wordcloud)
library(dplyr)
library(stringr)
library(wordcloud)
library(RColorBrewer)

useNIADic()

news <- readLines('Data/newspaper(health).txt', encoding = 'UTF-8')
news

# 특수문자 제거
# news <- str_replace_all(news, "\\W", " ")
# news

# 명사 추출
nouns_news <- extractNoun(news)
nouns_news

# 명사 list를 문자열 벡터로 변환, 단어별 빈도표 생성
wordcount_news <- table(unlist(nouns_news))
wordcount_news

# 자주 사용된 단어 빈도표 만들기
df_word <- as.data.frame(wordcount_news, stringsAsFactors = F)
df_word

# 변수명 수정
df_word <- rename(df_word, 
                  word = Var1,
                  freq = Freq)
df_word

# 두 글자 이상 단어 추출
df_word <- filter(df_word, nchar(word) >= 2)
df_word

top_20 <- df_word %>% 
  arrange(desc(freq)) %>% 
  head(20)

top_20

# 단어 색상 목록 만들기
pal <- brewer.pal(8, 'Dark2')
pal

#  워드 클라우드 생성
set.seed(1234)
wordcloud(words = df_word$word,
          freq = df_word$freq,
          min.freq = 2,
          max.words = 200,
          random.order = F,
          rot.per = .1,
          scale = c(4, 0.3),
          colors = pal)
