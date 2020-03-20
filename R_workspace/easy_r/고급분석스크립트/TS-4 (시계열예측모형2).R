# -------------------------------------------
# 시계열 예측모형 - 이중/삼중 지수예측모델
# Holt / Holt-winters 지수평활법
# -------------------------------------------
# (1) Holt 지수평활법
#     가. Time-Level + 추세(기울기) + 불규칙성분의 시계열 
#     나. 예측모형 : 
#
#       Yt = 시간수준 + 추세(기울기)*T + 불규칙*(오차)
#
# (2) Holt-winters 지수평활법
#     가. Time-Level + 추세(기울기) + 계절성분 + 불규칙성분
#     나. 예측모형 :
#
#       Yt = 시간수준 + 추세(기울기)*T + St + 불규칙(오차)
#
# (3) 예측모형을 만들기 위한 파라미터들 :
#     가. alpha : 가중치 통제 계수 (0 <= alpha <= 1)
#     나. beta  : 추세성분의 계수
#     다. gamma : 계절성분의 계수
#
# (4) 사례 데이터셋 : AirPassngers

AirPassengers

attributes(AirPassengers) # tsp와 class 나옴. 파이썬의 dict 객체와 비슷.
tsp(AirPassengers) # 1949년에서 1960년까지 월간으로 나옴.
start(AirPassengers)
end(AirPassengers)
frequency(AirPassengers)
cycle(AirPassengers)

plot(AirPassengers)

# (1) 시계열 데이터의 탐색결과
#     Yt = 시간수준 + 불규칙성분 + 추세성분 + 계절성분 (Airpassengers 데이터)

# (2) 적절한 지수예측모델을 선정 : Holt-Winters 지수평활법 적용용

# (3) 예측모델(fitting)
library(forecast)

(fit <- ets(AirPassengers, model = 'AAA')) # (승법모델) # 파라미터 3개 나옴. alpha, beta, gamma(계절성분)
# 주의할점 :
#   가. 지수예측모형에서는, 추세는 영원히 지속된다라고 가정
#   나. beta 계수가 0에 근접할 수록, 기울기가 없다라는 뜻이 아니라, 
#       이전 시계열 관측치의 기울기를 그대로 사용하겠다 라는 의미미

# (4) 예측 정확도 판단
accuracy(fit)
summary(fit)

# (5) 5-step ahead frecasting
(pred <- forecast(fit, h = 5)) # freq가 월간이니까, 5개 예측값 나옴. 신뢰구간은 아까와 동일.
(pred2 <- forecast(fit, h = 12)) # freq가 월간이니까, 12개(1년치) 예측값 나옴. 신뢰구간은 아까와 동일.
plot(pred) # 5개월치 나옴,.
plot(pred2)
