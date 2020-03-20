test <- read.csv(file.choose())
View(test)

with(test, 
      cor.test(age, score, method = 'pearson',
               use = 'pairwise.complete.obs') # 선택가능한 옵션들은 ppt파일에 있음.
) # 유의수준 0.05로 판단하면 귀무가설 기각. 대립가설 : 상관계수 0이 아니다.
  #상관계수 -0.6212 이므로 음의 상관관계 있다 할 수 있음.

with(test, shapiro.test(age))
with(test, shapiro.test(score)) # 두 변수모두 정규성을 따르게 나옴.dㅣ 방법 말고도 2개 더 있는듯.

# 정규성을 따르지 않거나, 가정할 수 없다면 비모수 적인 통계 방법
# 표본이 30개 보다많지 않아도 비모수 적 통계 방법 사용.

cor(test) # 상관행렬을 그리기. (gender 변수는 수치형이 아니라 할 수 없음. 제외하는 방법은?)
cor(test[c('age','score')]) # 혹은
cor(test[c(1,3)]) # 이렇게.

# 정규성 있으면 피어슨
# 정규성 없으면 스피어만? 켄탈 ?

## --------- mpg 데이터의 정규성 검정과 상관행렬.

df_mpg <- ggplot2::mpg
df_mpg

with(df_mpg, shapiro.test(cty)) # 귀무가설 기각. 정규성 없음. 
with(df_mpg, shapiro.test(hwy)) # 귀무가설 기각. 정규성 없음.

cor(df_mpg[c('cty','hwy')], method = 'spearman') # 상관행렬. 정규성 없으니 스피어만. # 강사님도 이것보단 아래꺼 신뢰.
cor(df_mpg[c('cty','hwy')], method = 'pearson') # 상관행렬. 정규성 없지만, 표본의 갯수 많으니 중심극한정리(clt)때문에 
# 피어슨 사용 가능 !! 

### ----------- markdown 파일 진행 ~! 
# 파일명 : 5.-Correlation-Analyses.html

library(corrplot)
library(RColorBrewer)

M <- cor(mtcars) 
corrplot(M, type = 'upper', order = 'hclust', col = brewer.pal(n=8, name = 'RdYlBu')) # 색상 값을 지정된 갯수만큼 그리기.
corrplot(M, type = 'lower', order = 'hclust', col = brewer.pal(n=8, name = 'RdYlBu'))

# 조금 더 좋은 모양으로 다변량 데이터의 상관관계를 보기 위해 xtable
# 두번째 파일 진행.

### 5-1 파일 
# 파일명 5-1.-Correlation-Analyses.html
# xtable 설치
# 피어슨은 모수적인 검정방법 자주 사용됨

library(dplyr)
library(knitr)

my_data <- mtcars
# knitr 패키지에 있는 kable 함수수
kable(sample_n(tbl = my_data, size = 10, replace = FALSE), caption = 'A Test Data Set') # 캡션은 제목목

library('ggpubr')
#산점도로 대략적인 관계를 시각적으로 파악
ggscatter(my_data,
          x = 'mpg',
          y = 'wt',
          add = 'reg.line', # 회귀선을 추가
          conf.int = TRUE,
          cor.coef = TRUE,
          cor.method = 'pearson',
          xlab = 'Miles/(US) gallon',
          ylab = 'Weight (1000 lbs)') # 단순 산점도가 아닌 다양한
# 것을 추가해서 시각적으로 확인 쉽게 할 수있음.
# r은 상관계수.여기선 음의 상관관계가 있다고 할 수 있음.

# mpg 데이터에 대해 정규성 검정
shapiro.test(my_data$mpg) # 귀무 채택. 정규성 있음

# 두번째 변수 차의 중량에 대한 정규성 검정
shapiro.test(my_data$wt) # 귀무채택, 정규성 있음.

# 시각적으로도 정규성 검정 (qqplot 그리ㅣㄱ)

library('ggpubr')
ggqqplot(my_data$mpg, ylab = 'MPG') # 가장 이상적인 정규분포 값 그려줌
# 신뢰구간도 그려줌 !! 그림 결과 보니 신뢰구간 벗어난 거 1개 보임.

###Pearson correlation test
(res <- cor.test(my_data$wt, my_data$mpg, method = 'pearson')) #귀무가설 기각. 뚜렷한 부상관 관계가 있다.

###Kendall rank correlation test (변수 두개가 그리는 )
(res2 <- cor.test(my_data$wt, my_data$mpg, method = 'kendall'))

###Spearman rank correlation coefficient
(res2 <- cor.test(my_data$wt, my_data$mpg, method = 'spearman'))

### 5-2 파일
# 파일명 : 5-2.-Correlation-Matrix.html

# Import your data into R

data('mtcars')

my_data <- mtcars[, c(1,3,4,5,6,7)]

library(dplyr, quietly = TRUE)
rsd <- sample_n(tbl = my_data, size = 1, replace = FALSE)# 랜덤 샘플이라는 의미

# 두 변수간의 관계의 특징을 확인 가능 (상관계수를 보여줌)
(res <- cor(my_data)) # 두 변수간의 상관계수들을 보여줌.

# 두 변수간의 검정이 아니라 상관 행렬을 동시에 검정할 수 있음. 
# ********중요 *********

library('Hmisc')

(res2 <- rcorr(as.matrix(my_data), type = 'pearson')) 
# 위에는 각 변수간의 상관계수, 아래는 각 p value 값 보여줌.
# qsec와 wt 그리고 qsec와 drat 간의 상관관계는 없다고 볼 수 있음.
# 귀무가설 채택이기 때문에. 귀무 : 상관관계 0이다.(없다)
# 이거 하고 사용자 정의 함수로 보기 쉽게 만드는건 넘어감. 각자해보기

# 상관행렬을 시각화하는 다양한 방법

# ###Use symnum{stats} function: Symbolic number coding

symnum(
  x,
  cutpoints = c(0.3, 0.6, 0.8, 0.9, 0.95),
  symbols = c(' ', '.', ',', '+', '*', 'B'),
  abbr.colnames = TRUE
)

symnum(res, abbr.colnames = FALSE) # 보기 힘듦.

###Use corrplot{corrplot} function: Draw a correlogram
# 이건 아까 위에 배운거랑 똑같은 corrplot인데 뭔가 더추가된거임.
library(corrplot)
corrplot(res, type = 'upper', order = 'hclust', tl.col = 'black', tl.srt = 45) #  각 변수명의 타이틀 색상, 기울기 등 
 
# res2를 이용해서 corrplot를 확장하기 ! 
corrplot(res2$r, type = 'upper', order = 'hclust', p.mat = res2$p, sig.level = 0.01, insig = 'blank') # sig.level 은 99% 신뢰구간 만듬.
# 옆에 나오는 그림은 p-value 매트릭스이기 때문에 상관계쑤는 관계없음.
corrplot(res2$r, type = 'upper', order = 'hclust', p.mat = res2$P, sig.level = 0.01, insig = 'blank')

corrplot(res2$r, type='lower', order='hclust', p.mat = res2$p, sig.level = 0.05,insig = 'blank')

# Use chart.Correlation{PerformanceAnalytics} : Draw scatter plots
install.packages("PerformanceAnalytics", quiet = TRUE, dependencies = T)
library(PerformanceAnalytics, quietly= TRUE)

my_data <- mtcars[, c(1,3,4,5,6,7)]
chart.Correlation(my_data, histogram=TRUE, pch = 19)
# 나온 숫자는 상관계수, 별표시는 유의수준 의미.
# 대각선은 겹친 변수 간 확률 분포와 히스토그램을 함께 보여줌.
# 

####Use heatmap{stats}

col <- colorRampPalette(c('blue', 'white', 'red'))(20) # 20개의 색상을 뽑아라 다시 호출 ! 

heatmap(x = res, col = col, symm = TRUE)


##### 5-3 

( rs <- sample_n(tbl = mtcars, size = 10, replae = FALSE)) 
# 여기 바로 다음문장인 kable는 안함
(M <- cor (mtcars)) # 상관행렬 담기.

# Correlogram : Visualizing the correlation matrix
library(corrplot, quietly =  TRUE)

corrplot(M, method = 'circle') # 상관행렬을 M에 담아놨음.

corrplot(M, method = 'square')

corrplot(M, method = 'ellipse')

corrplot(M, method = 'shade')

corrplot(M, method ='color')

corrplot(M, method = 'pie') # 색상으로 구분하기보단, 이게 더 좋아보임. 양으로 이렇게 표현하는게 좋아보임.

corrplot(M, method = 'number') # 이것도 좋아보임.

###Types of correlogram layout

corrplot(M, type = 'upper')

###Reordering the correlation matrix
corrplot(M, type = 'upper', order = 'hclust')

# Change background color to lightblue
corrplot(M, type ='upper', order = 'hclust', col = c('black', 'white'), bg = 'lightblue')

###Combining correlogram with the significance test
#cor.mtest <- function ## 여기 해보기

#### 5-4 
# 파일명 : 5-4. Elegant correlation table using {xtable} package

(mcor <- round (cor(mtcars), 2)) # 변수간 상관계수

###Lower and upper triangular part of a correlation matrix
lower.tri(mcor) # TRUE, FALSE를 갖고 있는 행렬로 추출.
upper.tri(mcor)

# Hide upper triangle
upper <- mcor
upper[ upper.tri(mcor) ] <- (upper <- as.data.frame(upper) )

#Hide lower triangle
lower <- mcor
lower[ lower.tri(mcor, diag=TRUE) ] <- ""
( lower <- as.data.frame(lower) )

###Use xtable R package to display nice correlation table in html format
install.packages('xtable', dependencies = T)
library(xtable, quietly = TRUE)

print( xtable(upper), type = 'html')
