#--- 최적의 회귀모델 선택 방법 ---
#
# 시도하여 만들어낸, 많은 회귀모형 중에, 선택을 해야 하는
# 상황에 직면하게 됨.
#
# 최소한의 선택기준:
#  가. 예측정확성 - 예측의 정확도를 높일 수 있는 모델
#  나. 검약성     - 단순하고 반복가능한 모델
#  다. 최종적인 결정은 바로, 분석가의 결정임!!!


# *********************
# (1) 회귀모형의 비교방법 - 1 (ANOVA)
# *********************
# 회귀분석의 가정을 충족시키고, 회귀모형의 통계적 유의성까
# 충족된 여러 모형이 있을 때, 이들 모형을 비교.
# 
# 두 개의 모델을 비교: 분산분석(ANOVA)
# 비교시 제약(조건):
#   가. 비교할 두 회귀모델이 소위 "Nested" 되어 있어야 함
#   나. 비교할 두 모델이, Nested되어있지 않으면 --> AIC비교를
#       수행해야 함
#

df_states

fit1 <- lm(
      Murder ~ Population + Illiteracy + Income + Frost,
      data = df_states
    )

fit2 <- lm(Murder ~ Population + Illiteracy, data = df_states)

fit3 <- lm(Murder ~ Illiteracy, data = df_states)

# 회구분석 가정 충족, 다중공선성고려, 이상치 관리 등은 모두
# 만족시켰다고 가정.

# Multiple R-squared:  0.567,	Adjusted R-squared:  0.5285 
summary(fit1)

# Multiple R-squared:  0.5668,	Adjusted R-squared:  0.5484
summary(fit2)

# Multiple R-squared:  0.4942,	Adjusted R-squared:  0.4836
summary(fit3)

# 두 fitted model 비교 수행 by ANOVA
# 두 회귀모델의 차이가 없는 경우 ---> 두번째 기준인 검약성으로
#  선택 -> 즉, 예측변수가 적은 2번째 모델을 선택
anova(fit1, fit2)       # OK

anova(fit1, fit2, fit3)  # OK

# *********************
# (1) 회귀모형의 비교방법 - 2 
# (AIC: Akaike Information Criterion)
# *********************
# AIC 값이 작을 수록 --> 
#   **보다 적은 개수의 모회귀계수**가 적합하다 란 의미
#
# AIC{stats} 함수를 사용하여, AIC값 추출

AIC(fit1, fit2)        # OK

AIC(fit1, fit2, fit3)  # OK ****

# Income, Frost 예측변수를 뺀 모델이 더 좋은 모델임을
# 알려줍니다.






