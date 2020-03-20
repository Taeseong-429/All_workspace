# -------------------------------
# 계절분해(Seasonal Decomposition)
# -------------------------------
AirPassengers

attributes(AirPassengers)
plot(AirPassengers)

attributes(JohnsonJohnson)
plot(JohnsonJohnson)

attributes(nhtemp)
plot(nhtemp)

attributes(Nile)
plot(JohnsonJohnson)

attributes(sunspots)
plot(sunspots)

plot(tsales)

dev.off()
# ---------------------------
# 1. 가법/승법 모델 확인

plot(AirPassengers) # 승법 모델 적용 필요

# 2. 로그변환을 통해 승법 -> 가법모델로 변환
logaAirPassengers <- log(AirPassengers)
plot(logaAirPassengers)

# 3. 계절분해 수행 통해, model fitting
#    through stl{stats}
fit <- stl(logaAirPassengers, s.window = 'periodic') # 계절효과를 매년마다 주기적으로 나타내도록 만들기.(있다면)
fit
plot(fit)

# fitted model의 내부속성 확인인
names(fit)

# 이 속성에 3개 성분으로 분해된 시계열값이 존재
fit$time.series 

# 4. log값인, 시계열성분값을 다시 원래 데이터로 환원
#    original value -> log -> exp -> original value
exp(fit$time.series)

# 5. 시각화 - 1 (default)
plot(fit) # 불규칙 성분이 작은 곳에서 다른 성분 영향이 더 크다는 의미 ??

# 6. 시각화 - 2 (Enhanced Visualization)

library(forecast)

dev.off()
par(mfrow = c(2,1))

monthplot(AirPassengers, xlab= 'time', ylab = 'count') # fit 한 모델이 아닌, 원 데이터를 넣어도 볼 수 있음. # 시간에 따라 대표값 변화 볼수 있음.
seasonplot(AirPassengers, year.labels = T, main = 'seasonal') # 연도별 월별 승객수가 어떻게 변화했는지 확인 가능.(월 데이터를 사용해야함) # 매 월마다 일정한 패턴으로 어느 시점에 y(t) 값이 얼마나 되는지 시각적으로 알 수 있음.
