# -------------------------------
# 시계열 예측모형 두번째 - ARIMA model fitting
# -------------------------------
# ARIMA(p,d,q) 자동결정 -> Auto Arima

# auto.arima{forecast}

# -------------------------------
# (1) 시계열 데이터 기본탐색
# -------------------------------
sunspots
tsp(sunspots)
cycle(sunspots)

dev.off()
par(mfrow = c(2,1))

# -------------------------------
# (2) 차분횟수를 결정하기 위한 테스트
# -------------------------------
plot(sunspots)   # 차분수행전

library(forecast)
Acf(sunspots)
Pacf(sunspots)


( d <- ndiffs(sunspots) )
( dsunspots <- diff(sunspots) )

plot(dsunspots)   # 차분수행후


# -------------------------------
# (3) 자동 ARIMA 모형적합
# -------------------------------
( fit <- auto.arima(sunspots) )
names(fit)

library(forecast)
Acf(fit$residuals)
Pacf(fit$residuals)

# -------------------------------
# (4) 시계열 예측수행
# -------------------------------
library(forecast)
forecast(fit, h = 3)   # 3-step ahead forecasting

# -------------------------------
# (5) 시계열 예측결과 시각화
# -------------------------------
dev.off()
plot(forecast(fit, h = 10))

# -------------------------------
# (6) 시계열 ARIMA 모형 적합성 판단
# -------------------------------
# 6-1. 정규성 검정 ------------> OK by CLT
shapiro.test(fit$residuals)

qqnorm(fit$residuals)
qqline(fit$residuals)

# 6-2. 독립성 검정(No 자기상관) --> OK
Box.test(fit$residuals) # H0: No AC (자기상관없음) ->독립성

# 6-3. 시각적인 자기상관성 판단 --> OK
Acf(fit$residuals)
Pacf(fit$residuals)

# 6-4. 시계열 정태성 검정       --> OK
# adf.test{stats}
adf.test(fit$fitted)

# -------------------------------
# (7) 여러 시계열 ARIMA 모형의 정확도 판단하여
#     최적의 모델 선정
# -------------------------------
accuracy(fit)
summary(fit)
