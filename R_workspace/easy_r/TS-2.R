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

# -------------------------------
# 1. 가법/승법모델 확인

plot(AirPassengers) # 승법모델적용 필요

# 2. 로그변환을 통해, 승법->가법모델로 변환
logAirPassengers <- log(AirPassengers)
plot(logAirPassengers)

# 3. 계절분해 수행통해, model fitting 
#    through stl{stats}
fit <- stl(logAirPassengers, s.window = 'periodic')
fit

# fitted model의 내부속성 확인
names(fit)

# 이 속성에 3개 성분으로 분해된 시계열값이 존재
fit$time.series 

# 4. log값인, 시계열성분값을 다시 원래 데이터로 환원
#    original value -> log -> exp -> original value
exp(fit$time.series)

# 5. 시각화 - 1 (default)
plot(fit)

# 6. 시각화 - 2 (Enhanced Visualization)
library(forecast)

dev.off()
par(mfrow=c(2, 1))

monthplot(AirPassengers, xlab="", ylab="")
seasonplot(AirPassengers, year.labels = T, main = '')




