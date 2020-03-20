wdbc <- read_csv(file.choose(),col_names = F)
colnames(wdbc) <- c('ID number','Diagnosis','radius_Mean','texture_Mean','perimeter_Mean','area_Mean','smoothness_Mean','compactness_Mean','concavity_Mean','concave points_Mean','symmetry_Mean','fractal dimension_Mean','radius_SE','texture_SE','perimeter_SE','area_SE','smoothness_SE','compactness_SE','concavity_SE','concave points_SE','symmetry_SE','fractal dimension_SE','radius_worst','texture_worst','perimeter_worst','area_worst','smoothness_worst','compactness_worst','concavity_worst','concave points_worst','symmetry_worst','fractal dimension_worst')
  
View(wdbc)

wdbc.data <- wdbc

View(wdbc.data)

# (2) 종속(반응/분류)변수는 0, 1 값만 허용
#     따라서, 다음 범주값으로 되어있는 분류변수를
#     factor타입으로 형변환하여 (0, 1) 값을 가지도록
#     함
wdbc.data$Diagnosis <- as.factor(wdbc.data$Diagnosis)

str(wdbc.data)

wdbc.data <- wdbc.data[-1]

wdbc.data_1 <- wdbc.data[1:11]

install.packages('fmsb', dependencies = T)
library(fmsb)



# training set과 validation set 7:3비율로 분리

set.seed(123)
train <- sample(1:nrow(wdbc.data), size=0.7*nrow(wdbc.data), replace=F)
train
test <- (-train)


train_set <- wdbc.data_1[train,]
test_set <- wdbc.data_1[test,]

View(train_set)

# (3) 로지스틱 회귀모형 적합(Model fitting)
#     if X, Y = 1 될 확률(p) ---> logit 변환 : ln(p / 1-p)
#
# > return(확률) = predict( ....)
#   return = P( Y = 1 | X)
#   즉, X가 주어졌을 때, Y가 1이 될 확률이다 !! 
# library(RWeka)
# (wdbc.weka <- Logistic(formula = Diagnosis ~ ., data = train_set))
# summary(wdbc.weka)

wdbc.logit <- glm(
  formula = Diagnosis ~ .,
  data = train_set,
  family = binomial(link = 'logit')
)


# (4) 회귀계수에 대한 검정
summary(wdbc.logit)
wdbc.logit

# (5) 분류회귀모형(로지스틱 회귀모형)의 유의성 검정
#   1) residual deviance 의 값과
#   2) 자유도 (degree of freedom) 값을 이용
#   3) 카이제곱 확률분포를 검정확률분포로 사용
#
#     검정값이 유의확률(p-value) 계산 :
#     1 - pchisq(residual deviance), 
#
#     통계적 가설 :
#       H0 : 모형이 적합하다
#       H1 : NOT 
# 통계 결과 이 모형 쓸 수있다 ! 

( p.value = 1 - pchisq(107.26, 387) ) # 통계적 가설을 검정할 수 있는 유의수준 모형이 적합하다. 

options(scipen = 99)
# (6) 분류예측수행
#     유의성이 검증된, 로지스틱 회귀모형으로 새로운 데이터셋에 대한 분류예측 수행
wdbc.pred <- predict(wdbc.logit, newdata = wdbc.data, type = 'response')
wdbc.pred <- predict(wdbc.logit, newdata = wdbc.data, type = 'term') # response가 y가 1이 될 확률 뽑아주는거라 이거 씀.


wdbc.pred # Y = 1 이 될 확률 반환(type = 'response') # 여기서 나오는건 y가 1이 될 확률. # 즉, 기존과 다르다..
pred <-ifelse(wdbc.pred > .5, 'YES','NO')

(pred <- as.factor(pred))

# (7) 혼동행렬을 산출하여, 정확도 및 오차율 계산

# confustion Matrix (혼동행렬표)
wdbc.cm <- table(wdbc.data$Diagnosis, pred)
diag(wdbc.cm) # 혼동행렬의 대각선 값만 벡터로 추출출
length(wdbc.data$Diagnosis)
length(pred)
View(pred)

# 오차율 = 정분류된 표본개수 / 전체표본개수
err.rate <- 1 - sum (diag(wdbc.cm) / sum(wdbc.cm))
err.rate


# (8) ARI (Adjusted Random Index) : 모형의 비교 지수 ( 값이 클수록 좋음 )
#     산출할려면, 교차분할표가 반드시 필요
library(flexclust)

randIndex(wdbc.cm) # ARI 지수 산출(클수록 좋다!!)
