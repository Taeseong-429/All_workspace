#-----------------------------------
# 비계층적(비위계적)군집분석 => 분할군집화(Partioning Clustering)
#-----------------------------------
library(rattle.data)
data(wine, package = 'rattle.data')
head(wine)

table(wine$Type)

library(prettyR)
freq(wine$Type)

#Frequencies for wine$Type 
#        2    1    3   NA
#       71   59   48    0
#%    39.9 33.1   27    0 
#%!NA 39.9 33.1   27 

# (1) Type 변수제거
wine <- wine[-1]

# (2) 변수의 척도화 수행
zWine <- scale(wine)

# (3) 최적의 군집개수 결정
library(NbClust)

# set.seed(1234)   # 재현성이 필요시, 삽입


( nc <- NbClust(zWine, method = 'kmeans') )
nc$Best.nc[1, ]

table( nc$Best.nc[1, ] )  # 최종적으로 k=3 로 결정

( fit.kmeans <- kmeans(zWine, centers = 3) )
names(fit.kmeans)
fit.kmeans

# (4) 군집결과 시각화 -> 하세요!!!
# plot(fit.kmeans) # XXX


# (5) 기존의 알려진 분류와 군집분석의 결과를 비교

# Type변수로 만든, 일원분할표(빈도표)
#Frequencies for wine$Type 
#        2    1    3   NA
#       71   59   48    0
#%    39.9 33.1   27    0 
#%!NA 39.9 33.1   27

# 군집결과로 만든 교차분할표
#           Predict
#           1  2  3
# Actual 1  0  0 59
#        2  3 65  3
#        3 48  0  0

fit.kmeans$size
names(fit.kmeans)
fit.kmeans$cluster

data(wine, package = 'rattle.data')

crosstbl <-  table(
  wine$Type, 
  fit.kmeans$cluster, 
  dnn = c('Actual','Predict')
)

aggregate(wine, by = list(cluster = fit.kmeans$cluster), mean)

library(flexclust)
randIndex(crosstbl)

library(cluster)

clusplot(wine[-1], fit.kmeans$cluster, color =T, shade = T, labels = 2, lines = 0)

library(cluster)

args(pam)

library(cluster)
fit.pam <- pam(wine[-1], k = 3, stand = T)
fit.pam

names(fit.pam)

library(cluster)
clusplot(fit.pam, main = '- PAM clustering with k=3 -')

crosstbl <-  table(
  wine$Type, 
  fit.pam$clustering, 
  dnn = c('Actual','Predict')
)
randIndex(crosstbl)


install.packages('fMultivar', dependencies = T)
library(fMultivar)

set.seed(1234)

df <- rnorm2d(1000, rho = .5)
class(df)

df <- as.data.frame(df)
class(df)

df

plot(df, col = c('red','blue'))

library(NbClust)

nc <- NbClust(df, method = 'kmeans')
nc

names(nc)

nc$Best.nc[1,]
table(nc$Best.nc[1,])

dev.off()

barplot(table(nc$Best.nc[1,]))


library(cluster)

fit.pam2 <- pam(df, k = 3)

clusplot(fit.pam2, color = T)

 #ccc 지표 : 허위군집을 막을 수 잇는 지표. : 급격히 떨어지는 변곡점 지점의 직전에 있는 값이  CCC 가 제안하는 군집으 ㅣ개수 즉 0개. 


# ----------------------

install.packages('rpart', dependencies = T)
 install.packages('rpart.plot', dependencies = T)
install.packages('party', dependencies = T)
install.packages('randomForest', dependencies = T)
install.packages('e1071', dependencies = T)


# -----------------------------

colnames(breast_cancer_wisconsin) <- c('표본번호', '종양두께', '세포크기균일성', '세포모양균일성', '주변접착력', '단일상피세포크기', '세포핵', '염색질', '정상세포핵여부', '유사분열', 'Class')



library(prettyR)
freq(breast_cancer_wisconsin)

df_wbc <- breast_cancer_wisconsin
save(df_wbc, file = 'df_wbc.rda')

df_wbc <- as.data.frame(df_wbc)

class(df_wbc)
describe(df_wbc)

# ------------------------

df_wbc <- df_wbc[-1]
df_wbc$Class <- factor(df_wbc$Class, levels = c(2,4), labels = c('양성','악성'))
str(df_wbc)


fit.logit <- glm(formula = Class ~ . , data = df_wbc, family =  binomial())

fit.logit
summary(fit.logit)

# ------------------------

prob <- predict(fit.logit, newdata = df_wbc, type = 'response')

# pred <- ifelse(prob > .5, '악성', '양성')
# 
# pred <- as.factor(pred)
# class(pred)
# pred

pred <- factor(prob > .5, levels = c(TRUE, FALSE), labels = c('악성', '양성'))
pred

# ----------------------------------------


