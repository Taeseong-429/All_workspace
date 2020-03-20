# 3.11 회귀분석 실습
# women{datasets} : 30대 여성 15명의 키와 몸무게

# 분석목적 :
# (1) 키와 몸무게의 연관성 분석
# (2) 키로부터 몸무게 예측

# 1. 독립과 종속변수의 선정
#   (1) 독립변수 : 키(height)
#   (2) 종속변수 : 몸무게(weight)

attach(women)

table(height)

plot(height, weight)

# lm(stats) 함수 이용
fit <- lm(formula = weight ~ height, data = women)
fit

names(fit) # 모형 안에 얼마나 많은 속성이 포함된건지

# 얻어진 회귀계수가 적용된 추정회귀방정식을 통해
# 추정된 예측값을 fitee
itted(fit)
fitted.values(fit) # 예측된 값이 이 fitted value 라는 것임.
fit$fitted.values
fit$residuals
# 추정(예측)값은, 항상 오차를 포함할 수 있기 때문에,
# 이 오차를 "잔차(residual values)"라 한다.
# 이를 얻는 함수는 아래와 같음
residuals(fit)
fit$residuals

# 회귀계수를 얻어내는 방법
coef(fit)
coefficients(fit)
fit$coefficients

summary(fit)

# 표본에서 얻는, 추정회귀 방정식은 아래와 같습니다.
# weight = -87.51667 + 3.45000 * height 
# 종속변수인 y의 값은 오차를 포함하는 확률변수.

# 시각화를 통해, 분석 데이터를 얼마나 잘 설명
# 하고 있는지를 비교해보자 !!!
plot(height, weight)
abline(fit) # abline만 넣으면, 위에 넣었던 값을 추정하고 직선으로 그려줌줌

detach(women)