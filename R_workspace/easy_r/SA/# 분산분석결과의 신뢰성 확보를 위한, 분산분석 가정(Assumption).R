# 분산분석결과의 신뢰성 확보를 위한, 분산분석 가정(Assumption)
# 분산분석의 가정을 보면, 
#   (1) 종속변수(y)는 정규성을 가져야 함. (정규분포를 따라야함)
#   (2) 요인이 만들어내는, 모든 집단의 분산은 동일해야 함(등분산성)

# -------------------------------
# (1) 종속변수(y)의 정규성 검정
# -------------------------------
# 정규성검정대상 변수의 표본크기가 대표본이상이라면, 
# clt(central limit theorem. 중심극한의 정리)와 대수의 법칙에 따라, 정규성을
# 가정할 수 있다.(명심!!)
# -------------------------------
# Q-Q plot을 통해, 시각적으로 검정할 수 있다.
# qqnorm{stats}, qqline{stats}
qqnorm(cholesterol$response)
qqline(cholesterol$response)

#
# qqplot{car} function 이용
library(car)

qqPlot(
  lm(response ~ trt, data = cholesterol),
  main = 'Q-Q Plot', labels = F,
  simulate = T
)

# 검정통계량으로 정규성 검정
shapiro.test(cholesterol$response)

# -------------------------------
# (2) 요인(factor)의 수준별, 집단의 등분산성 검정
# -------------------------------
# 등분산성 검정 기법은 대표적으로 3가지 있음 :

bartlett.test(response ~ trt, data = cholesterol) # 이거 결과인 homogeneity 이게 등분산성 

#.
#.
#.
#.
#.
#.
#.


# 사후분석 : 평균의 다중비교
library(multcomp)

contrasts <- rbind("비투약그룹 대 투약그룹" = c(3, -1 -1 -1))
contrasts

fit.glht <- glht(fit.aov, linfct = mcp(dose = contrasts))
                 
# 분석가가 원하는 가설대

# ..

# 위의 분석결과를 과연 신뢰할 수 있는가 ????
# 담보물 : 분산분석의 가정(Assumtions) 충족여부
# (1) 정규성, (2) 등분산성을 충족해야함
#
# 문제는, 공변량이 포함된 ANCOVA의 경우에는, 가정이
# 한개가 더 추가됨
# 즉, 회귀방정식의 기울기(slpoe)가 각 집단별로 동일해야함.

library(multcomp)

# 회귀방정식의 기울기의 동등성을 검정하기 위해서는,
# 요인이 만들어내는 각 집단에 대해, 상호작용효과(gesttime * dose)를
# ANCOVA 모델에 추가해야 함 !!! (*주의*)
#
# 이것이 의미하는 바는 결국, 상호작용이 통계적으로 유의미하다면,
# 투여시간(gesttime)과 출산시체중(weight)과의 관계가, 약물투여량(dose)에
# 따라, 다르게 나타남을 의미함 !!! 

# formula = weight ~ gesttime + dose + gesttime:dose

# formula = weight ~ gesttime + dose + gesttime:dose
fit2.aov <- aov(formula = weight ~ gesttime * dose, data = litter) # 투여시간(공변량이)유의미하게 미치고 있다라고 가정 훚 ㅣㄴ행
summary(fit2.aov) # 교호작용은 통계적으로 유의미하지 않다. 

dev.off()
library(HH)
ancova(weight ~ gesttime + dose, data = litter)
# dose라고하는 약물투여량과 투여시간 간에 실제 상호작용 효과는 통계적으로 인정되지 않는다.
# 안되어야만 약물투여분과 비약물투여분과 두 그룹간에 대조결과를 신뢰할 수 있는 조건중에 하나가 성립된다는 의미.


