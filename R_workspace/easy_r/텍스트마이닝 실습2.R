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

useSejongDic()

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

