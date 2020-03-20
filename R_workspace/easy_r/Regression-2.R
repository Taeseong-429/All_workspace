# 다항회귀(Polynomial Regression)
#
# (1) 독립(예측/설명)변수가 2개 이상일 때
# (2) 독립변수와 종속변수간의 관계가 비선형적일 때

fit2 <- lm(weight ~ height + I(height^2), data = women) 
fit2
coef(fit2)

# 회귀모형과 회귀계수에 대한 유의성 검정 수행
summary(fit2)

# 시각화를 통해서, 좀더 튜닝된 회귀모형(즉, 추정회귀방정식)이
# 얼마나 더 좋아졌는지를 확인해보자!!!
plot(height, weight)
# abline(fit2)  # XXX : 곡선을그리지 못함. 직선만 가능
lines(height, fitted(fit2), col='red')


# 추정회귀방정식
# weight = 261.87818358 + 
#          (-7.34831933) x height + 
#          (0.08306399) x height^2

fit3 <- lm(
  weight ~ height + I(height^2) + I(height^3), 
  data = women
)
fit3
summary(fit3)


library(car)

dev.off()

# 회귀분석 전에라도, 두 변수간에 가장 적합한
# 회귀선의 모양이 어떤 것이 가장 적합한지,
# 힌트를 제공하는 용도
scatterplot(
  weight ~ height, 
  data = women,
  smoother.args = list(lty=1),
  spread = F,
  pch = 19,
)

