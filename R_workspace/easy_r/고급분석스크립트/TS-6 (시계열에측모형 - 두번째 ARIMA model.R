# -----------------------------------------
# 시계열 예측모형 두번째 - ARIMA model
# -----------------------------------------

# (1) 시계열의 시차 적용 사례
Nile  # 연간데이터임
tsp(Nile)

lagNile <- lag(Nile, k=1) # 1시차만큼 과거로 이동
tsp(lagNile) # 시계열 데이터 전체가 1년 뒤로 미뤄짐.

# (2) 시계열의 자기상관성 시각화
library(forecast)

dev.off()
Acf(Nile) # 자기상관 plot. x축이 시차, y축은 자기상관성.

# (3) 시계열의 부분자기상관성 시각화
Pacf(Nile) # 0.2에서 0.2사이에 다 들어가있어야 부분자기상관성이 없다는 말. # 시차 1에서 높은 자기상관성을 가지지만, 점점 갈수록 낮아짐.

# (4) 시계열의 차분(오로지 추세만제거) - 추세 제거 -> 정태성(정상성) 확보
plot(AirPassengers)

ndiffs(AirPassengers) # 최적의 차분횟수 1번. 1번만 하라고 알려줌.

# 차분수행
dAirPassengers <- diff(AirPassengers, lag = 1, differences = 1)  # 차분해서 변수에 저장
plot(dAirPassengers) # 오로지 추세만 제거(우상향)해서 보여줌줌


# 또 다른 시각화 함수
tsdisplay(dAirPassengers)
