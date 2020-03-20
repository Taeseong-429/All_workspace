#---------------------------------------------------
# **** Logistic Regression *** (로직스틱 회귀분석)
#---------------------------------------------------

# (1) 데이터 먼징:
#     가. 표본식별번호 변수는 제거
#     나. 정답에 해당되는 Class 변수의 타입을 factor으로 형변환
df_wbc <- df_wbc[-1]
df_wbc$Class <- 
  factor(df_wbc$Class, levels = c(2, 4), labels = c('양성','악성'))

str(df_wbc)

# (1) 분류예측모형 적합화 수행
( fit.logit <- glm(
      formula = Class ~ . , 
      data = df_wbc, 
      # 이항분류 목적으로 종속변수를 변환하겠다!!!!! 를 알려줌
      family = binomial()) # 두가지 지정: (1) 확률분포  (2) 연결함수
)

# (2) summary() or anova() 함수로, 각 회귀계수의 유의성검정과
#     회귀모형의 유의성 검정을 확인
summary(fit.logit)


# (3) (1)에서 적합시킨 분류회귀모형으로, 분류예측을 수행
( prob <- predict(fit.logit, newdata=df_wbc, type='response') )

# ( pred <- ifelse(prob > .5, '악성','양성') )
# 
# pred <- factor(pred, levels = c('악성','양성'), labels=c('악성','양성'))
# pred <- as.factor(pred)
# pred


( prob > .5 )

pred <- factor(prob > .5, levels = c(TRUE, FALSE), labels = c('악성','양성'))
pred


# (4) 분류예측의 오차율(<-> 정확도)를 계산
#     교차분할표 생성 - 실제분류결과(정답)과 예측값과의 분할표 생성
( logit.perf <- table(df_wbc$Class, pred, dnn = c('실제', '예측')) )

# 예측 오차율 계산
# Error rate =  ( 오류분류표본개수(m)  / 전표본의개수(n) )
# Precision rate = 1 - Error rate

sum( logit.perf ) # 전체표본의 개수 = 683
sum( diag( logit.perf ) ) # 총 오분류개수 = 21

( err.rate <- sum( diag( logit.perf ) ) / sum( logit.perf ) )
( precision.rate = 1 - err.rate )


