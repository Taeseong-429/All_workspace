# -------------------------------
# 시계열 예측모형 - 이중/삼중 지수예측모델
#  Holt / Holt-winters 지수평활법
# -------------------------------
# (1) Holt 지수평활법
#     가. Time-Level + 추세(기울기) + 불규칙성분의 시계열에 적합
#     나. 예측모형:
#   
#          Yt = 시간수준 + 추세(기울기)*T + 불규칙(오차)
#
# (2) Holt-winters 지수평활법
#     까> Time-Level + 추세(기울기) + 계절성분 + 뿔뀨칚썽뿐
#     나. 예측모형:
#
#          Yt = 시간수준 + 추세(끼울끼)*T + St + 불규칙(오차)
#
# (3) 예측모형을 만들기 위한 파라미터들:
#      가. alpha : 가중치 통제 계수( 0 <= alpha <= 1 )
#      나. beta  : 추세성분의 계수 (~Inf < beta < +iNF )
#      다. gamma : 계절성분의 계수 ( 0<= gamma <=1)

# (4) 사례 데이터셋: AirPassengers

AirPassengers

attributes(AirPassengers)
tsp(AirPassengers)
start(AirPassengers)
end(AirPassengers)
frequency(AirPassengers)
cycle(AirPassengers)

plot(AirPassengers)

# (1) 시계열 데이터의 탐색결과
#     Yt = 시간수준 + 불규칙성분 + 추세성분 + 계절성분

# (2) 적절한 지수예측모델을 선정: Holt-Winters 지수평활법 적용

# (3) 예측모형 적합(fitting)
library(forecast)

( fit <- ets(log(AirPassengers), model = 'AAA') )
names(fit)
# 주의할점:
#   가. 지수예측모형에서는, 추세는 영원히 지속된다라고 가정
#   나. beta 계수가 0에 근접할 수록, 기울기가 없다라는 뜻이
#       아니라, 이전 시계열 관측치의 기울기를 그대로 사용하
#       겠다 라는 의미.

# (4) 예측 정확도 판단
accuracy(fit)
summary(fit)

# (5) 5-step ahead forecasting
( pred <- forecast(fit, h = 12) )


# 시계열 예측결과 시각화
plot(pred)
