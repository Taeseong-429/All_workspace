install.packages('prettyR', dependencies = T)
library(Hmisc)
library(prettyR)

# R 정규성 검정
library(dplyr)
install.packages('ggpubr', dependencies = T)
library(ggpubr)

test <- read.csv(file.choose()) # 이거 test 파일 불러옴.

# 큰 사이즈 샘플(30개이상)의 경우에는 데이터 분포를 무시하고 바로 모수 검정을 수행한다. 
# 하지만, ㅅ각적조사(정규플랏, 히스토그램, QQ플랏)을 통한 정규성 검사와 유의성 검정을 통해서 정규성 검정은 할 수 있다

# 시각적 방법론

# 1. 밀도 플랏
ggdensity(test$age)
ggecdf(test$score)

# 2. QQ 플랏
ggqqplot(test$age)
ggqqplot(test$score)


# 정규성 검정

# shapiro.test
shapiro.test(test$age)
# 피 밸류 0.05보다 크니까 통계적으로 유의하게 다르다고 할 수 없다.
# 정규성을 가정할 수 있다.