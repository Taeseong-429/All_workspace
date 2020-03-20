# 단순선형회귀
#
# (1) 독립(예측/설명)변수가 1개 일 때
# (2) 독립변수와 종속변수간의 관계가 선형적일 때

# women{datasets} : 30대 여성 15명의 키와 몸무게 조사

# 분석목적: 
# (1) 키와 몸무꼐의 연관성 분석
# (2) 키로부터 몸무게 예측

# 1. 독립과 종속변수의 선정
#   (1) 독립변수: 키(height)
#   (2) 종속변수: 몸무게(weight)

View(women)

attach(women)

table(height)

#lm{stats} 함수이용
fit <- lm(formula = weight ~ height, data = women)
fit

names(fit)

# 얻어진 회귀계수가 적용된 추정회귀방정식을 통해
# 추정된 예측값을 fitted value라 하고, 아래함수를 통해
# 예측값을 획득
fitted(fit)
fitted.values(fit)
fit$fitted.values

# 추정(예측)값은, 항상 오차를 포함할 수 있기 때문에,
# 이 오차를 "잔차(residual values)"라 한다.
# 이를 얻는 함수는 아래아 같음
residuals(fit)
fit$residuals

# 회귀계수를 얻어내는 방법
coef(fit)
coefficients(fit)
fit$coefficients

summary(fit)

# 표본에서 얻는, 추정회귀방정식은 아래와 같습니다.
# weight = -87.51667 + 3.45000 x height


# 시각화를 통해, 분석 데이터를 얼마나 잘 설명
# 하고 있는지를 비교해보자!!!
dev.off()
plot(height, weight)
abline(fit, col = 'red')



detach(women)

