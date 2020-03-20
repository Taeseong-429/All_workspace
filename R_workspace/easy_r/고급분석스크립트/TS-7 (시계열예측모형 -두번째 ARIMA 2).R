# -----------------------------------------------
# 시계열 예측모형 두번쨰 ARIMA 2
# -----------------------------------------------
# ARIMA(p,d.q) 결정 및 가정판단

library(forecast)

# (1) p,d,q 모형차수 결정을 위한 시계열 탐색(ACF, PACF)
tsdisplay(Nile)
ts.plot(Nile)
plot(Nile) # 시계열 데이터에 대한 original plot

(d <- ndiffs(Nile)) # 차분 횟수 결정

# 차분 수행시에, 원 시계열의 주기(frequency)에 맞게
# 시차(lag)를 지정해서, 차분해야함
( dNile <- diff(Nile, lag = 1, differences = 1)) # lag와 differ는 default 값 1
tsp(dNile)
adf.test(fitted(fit))
# 차분으로 추세가 제거된 이후, 시계열의 균형수준이
# 확보되었는지 시각적으로 확인
plot(dNile) # 아깐 내려가는거였는데, 지금은 0을 중심으로 등락만 있음. 추세가 사라짐.

# (2) 가 결정한 p, d, q의 값으로 ARIMA 모형 적합(fitting)
(fit <- arima(Nile, order = c(0,1,1))) # 자기회귀계수 p는 모르겠다 --> 0, d는 1, q는 1
(fit2 <- arima(dNile, order = c(0,1,1)))
names(fit) # 만든 모형의 속성 판단!

fit$aic
fit$coef
fit$residuals

# (3) 적합시킨 모형의 정확도 판정
accuracy(fit) 
summary(fit)


# -----------------------------------------------------
# (4) 결정한 ARIMA 모형의 적합성 판단
# -----------------------------------------------------

# (4-1). at ~ NID(0, 분산) : Normality test
# by using Q-Q plot
qqnorm(fit$residuals)
qqline(fit$residuals)
# qqplot(fit$residuals)
# by using shapiro-wilk test
shapiro.test(fit2$residuals)

# (4-2). at ~ NID(0, 분산) : 독립성 검정
# 의미 : 자기상관이 없어야 한다 ---> 즉, 독립이다 ! 
# by using Box-Cox Test : Box.test{ststs}
#   통계적 가설 : H0 = No autocorrelation(=변환필요없다!) # 과거가 영향을 미치지 않는다 ?
Box.test(fit$residuals, type = 'Ljung-Box')

# (4-3). 자기상관성이 얼마나 독립인지, ACT/PACF로 확인인
library(forecast)

dev.off()
par(mfrow = c(2,1))

Acf(fit$residuals) # 잔차가지고 확인.
Pacf(fit$residuals) # 이렇게 만들어주는게 좋음. (삐져나가지 않음 ?)


# (4-4). 시계열의 균형수준이 달성되었는가! 검정 -> 정태성 검정정
# 단위근 검정(Augmented Dicky-fuller Test)
# adf.test
# 통계적 가설 : H0 = No stationary (정태성이 없다)
adf.test(dNile)
library(tseries)

names(fit)
fitted(fit)

adf.test(fitted(fit))

# -----------------------------------------------------
# (5) 예측 수행
# -----------------------------------------------------
# forecast{forecast}, predict{stats}

pred <- forecast(fit, h = 5) # 5-step ahead forecast # 긴 시간을 예측할수록 신뢰구간이 점점 넓어짐. (안좋아진다는뜻)
plot(pred) 
