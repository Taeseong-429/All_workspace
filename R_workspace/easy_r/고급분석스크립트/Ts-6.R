# -------------------------------
# 시계열 예측모형 두번째 - ARIMA model의 용어들
# -------------------------------

# (1) 시계열의 시차 적용 사례
Nile
tsp(Nile)

lag1Nile <- lag(Nile, k=1) # 1시차만큼 과거로 이동
tsp(lag1Nile)


# (2) 시계열의 자기상관성 시각화
library(forecast)

dev.off()
Acf(Nile)

# (3) 시계열의 부분자기상관성 시각화
Pacf(Nile)

# (4) 시계열의 차분 -> 추세제거 -> 정태성(정상성) 확보
plot(AirPassengers)

ndiffs(AirPassengers)  # 최적의 차분횟수 통지

# 차분수행
dAirPassengers <- diff(AirPassengers, lag = 1, differences = 1)

plot(dAirPassengers)

# 또 다른 시각화 함수: tsdisplay{forecast}
tsdisplay(AirPassengers)

tsdisplay(dAirPassengers)

