# -------------------------------
# 시계열 예측모형 두번째 - ARIMA model fitting
# -------------------------------
# ARIMA(p,d,q) 결정 및 가정판단

library(forecast)

# -------------------------------
# (1) p,d,q 모형차수 결정을 위한 시계열 탐색(ACF, PACF)
# -------------------------------
tsdisplay(Nile)
ts.plot(Nile)
plot(Nile)

tsp(Nile)

( d <- ndiffs(Nile) )

# 차분수행시에, 원 시계열의 주기(frequency)에 맞게
# 시차(lag)를 지정해서, 차분해야 함
( dNile <- diff(Nile, lag = 1, differences = 1))
tsp(dNile)

# 차분으로 추세가 제거된 이후, 시계열의 균형수준이
# 확보되었는지 시각적으로 확인
plot(dNile)

# 시계열의 균형수준이 달성되었는가! 검정 -> 정태성 검정
# 단위근 검정(Augmented Dicky-fuller Test)
# adf.test{tseries}
# 통계적 가설: H0 - No stationary (정태성이 없다)
library(tseries)
adf.test(dNile)


# -------------------------------
# (2) 가 결정한 p, q, q의 값으로 ARIMA모형적합(fitting)
# -------------------------------
( fit <- arima(Nile, order = c(0,1,1)) )

names(fit)
fit$coef
fit$aic
fit$residuals
fit$series
fit$model

# -------------------------------
# (3) 적합시킨 모형의 정확도 판정
# -------------------------------
accuracy(fit)
summary(fit)

# -------------------------------
# (4) 결정한 ARIMA 모형의 적합성 판단
# -------------------------------

# (4-1). at ~ NID(0,분산) : Normality test
# by using Q-Q Plot
qqnorm(fit$residuals)
qqline(fit$residuals)
# by using shapiro-wilk test
shapiro.test(fit$residuals)

# (4-2). at ~ NID(0,분산) : 독립성 검정
# 의미: 자기상관이 없어야 된다 ---> 즉, 독립이다!
# by using Box-Cox Test : Box.test{stats}
#    통계적 가설: H0 - No autocorrelation(=변환필요없다!)
Box.test(fit$residuals, type = "Ljung-Box")

# (4-3). 자기상관성이 얼마나 독립인지, ACT/PACF로 확인
library(forecast)

dev.off()
par(mfrow=c(2, 1))

Acf(fit$residuals)
Pacf(fit$residuals)

adf.test(fitted(fit)) # ???


# -------------------------------
# (5) 예측 수행
# -------------------------------
# forecast{forecast}, predict{stats}

dev.off()

pred <- forecast(fit, h = 5) # 5-step ahead forecast
plot(pred)



