# 회귀분석 실습(다중회귀)

# 다항 회귀분석(Polynomial Regression)

fit2 <- lm(weight ~ height + I(height^2), data = women)
fit2
coef

# 회귀모형과 회귀계수에 대한 유의성 검정 수행
summary(fit2)

# 시각화를 통해서, 좀 더 튜닝된 회귀모형(즉, 추정회귀)
# 얼마나 더 좋아졌는지를 확인해보자 !!!
plot(height, weight)
abline(fit2) # XXX : 곡선을 그리지 못함. 직선만 가능.
lines(height, fitted(fit2), col = 'red')

fitted(fit2) # 이게 weight 값 들고있으니까.

# 추정회귀방정식
#weight = 261.87818358 + 
#  (-7.34831933 x height) + 
#  (0.08306399) x height^2

fit3 <- lm(
  weight ~ height + I(height^2) + I(height^3),
  data = women)
fit3
summary(fit3)


# 다차원이니까 line으로 안됨
# 회귀분석 전에라도, 두 변수간에 가장 적합한
# 회귀선의 모양이 어떤 것이 가장 적합한지,
# 힌트를 제공하는 용도
dev.off()
library(car)
scatterplot(
  weight ~ height,
  data = women,
  smoother.args = list(lty=2),
  pch = 19
)

