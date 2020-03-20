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


