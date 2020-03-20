# 분산분석결과의 신뢰성 확보를 위한, 분산분석 가정(Assumptions) 평가

# 분산분석의 가정을 보면,
#   (1) 종속변수(y)는 정규성을 가져야 함
#   (2) 요인이 만들어 내는, 모든 집단의 분산은 동일해야 함(등분산성)


#---------------------------------
# (1) 종속변수(y)의 정규성 검정
#---------------------------------
# 정규성검정대상 변수의 표본크기가 대표본이상이라면,
# CLT(Central Limit Theorem, 중심극한의 정리)와 대수의 법칙에 따라,
# 정규성을 가정할 수 있다!!! (명심)
#---------------------------------
# Q-Q plot을 통해, 시각적으로 검정할 수 있다
# qqnorm{stats}, qqline{stats}
qqnorm(cholesterol$response)
qqline(cholesterol$response)

dev.off()

#
# qqPlot{car} function 이용
library(car)

# lm() 함수는, 선형회귀분석 함수
qqPlot( 
  lm(response ~ trt, data = cholesterol),
  main = 'Q-Q Plot', labels = F,
  simulate = T
  )

# 검정통계량으로 정규성 검정
shapiro.test(cholesterol$response)


#---------------------------------
# (2) 요인(factor)의 수준별, 집단의 등분산성 검정
#---------------------------------
# 등분산성 검정 기법은 대표적으로 3가지 있음:
#   가. Bartlett test - Bartlett.test{stats}
#   나. Flinger test  - fligner.test{stats}
#   다. Brown Forshy test  - hov{HH}

# 통계적 가설:
#   H0 - 모든 집단은 등분산성을 가진다
#   H1 - not H0
bartlett.test(response ~ trt, data = cholesterol)


