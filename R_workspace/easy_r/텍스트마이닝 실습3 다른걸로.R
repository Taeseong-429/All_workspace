# 텍스트마이닝 실습2 

# 참고 https://blog.naver.com/yyj940/221462460980
library(rJava)
library(wordcloud2)
library(RColorBrewer)
library(KoNLP)
library(tm)
library(wordcloud2)
library(tidyverse)

kakao <- readLines('Data/kakao.txt', encoding = 'UTF-8')

str(kakao)
View(kakao)

useNIADic()

kakao <- str_replace_all(kakao, pattern = '\\[.+\\]', "")
kakao <- str_replace_all(kakao, pattern = '[ㄱ-ㅎ]', '')
kakao <- str_replace_all(kakao, pattern = '이모티콘|삭제된메시지입니다', '')
kakao <- str_replace_all(kakao, pattern = '(2020년).+(:)', '')
kakao <- str_replace_all(kakao, pattern = '(2019년).+(:)', '')
kakao <- str_replace_all(kakao, pattern = '(ㅜ|ㅠ)+', '')
kakao <- str_replace_all(kakao, pattern = '\\W','')
kakao <- na.omit(kakao)
View(kakao)

nouns <- extractNoun(kakao)
nouns

wordcount <- table(unlist(nouns))
wordcount <- na.omit(wordcount)
View(wordcount)

df_word <- as.data.frame(wordcount, stringsAsFactors = F)
View(df_word)
df_word <- rename(df_word,
                  word = Var1,
                  freq = Freq)
df_word
df_word <- filter(df_word, nchar(word) >= 2)
df_word

top_20 <- df_word %>% 
  arrange(desc(freq)) %>% 
  head(20)
top_20


pal <- brewer.pal(8, 'Dark2') # Dark2 색상 목록에서 8개 색상 추출
pal #  컴퓨터에서 색상을 지정하는 RGB 값


library(wordcloud)
library(RColorBrewer)

set.seed(1234) # 난수 고정. 난수 만들기 위한 ...
wordcloud(words = df_word$word, # 단어
          freq = df_word$freq, # 빈도
          min.freq = 2, # 최소 단어 빈도
          max.words = 200, # 표현 단어 수
          random.order = F, # 고빈도 단어 중앙 배치 # 난수 생성으로
          rot.per = .1, # 회전 단어 비율 # 10% 정도만 회전시켜라
          scale = c(4, 0.3), # 단어 크기 범위 # 이 값을 조절하면 단어 크기 변동..
          colors = pal) # 색깔 목록록
# -------------------------------------------------
kakao1 <- gsub('(2020년).+(:)', '', kakao)
kakao1 <- gsub('(2019년).+(:)', '', kakao)

kakao2 <- gsub('[ㄱ-ㅎ]', '', kakao1)
kakao3 <- gsub('(ㅜ|ㅠ)+','', kakao2)
kakao3 <- gsub('이모티콘', '', kakao3)
kakao3 <- gsub('메시지', '', kakao3)

kakao4 <- gsub('\\(이모티콘)\\)', '', kakao3)

kakao5 <- gsub('저장한 날짜 : \\d{,2}','',kakao4)
kakao6 <- gsub('[~!@#$%^&*()_+=?]<>','',kakao5)


library(dplyr)
kakao7 <- na.omit(kakao6)

kakao8 <- gsub("\\[.+\\]", "", kakao7)

ko.words <- function(doc) {
  d <- as.character(doc)
  pos <- paste(SimplePos09(d))
  extracted <- str_match(pos,'([가-힣]+)/[NP]')
  keyword <- extracted[,2]
  keyword[!is.na(keyword)]
}

cps <- VCorpus(VectorSource(kakao8))


tdm <- TermDocumentMatrix(cps,
                          control = list(tokenize=ko.words,
                                         removePunctuation = T,
                                         removeNumbers = T,
                                         stopwords = c('네','넹','넴','으',
                                                       '음','움','오','헐','앜')))

tdm <- as.matrix(tdm)


v <- sort(slam::row_sums(tdm), decreasing = T)

v

data <- data.frame(X=names(v),freq=v)

View(data)
library(wordcloud)

pal <- brewer.pal(8, 'Dark2')
# View(data)

wordcloud(words = data$X,
          freq = data$freq,
          min.freq = 2,
          max.words = 200,
          random.order = F,
          rot.per = .1,
          scale = c(4, 0.3),
          colors = pal)

wordcloud2(data)

