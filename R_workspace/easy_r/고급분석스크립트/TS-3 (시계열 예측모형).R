# -------------------------------------------------
# 시계열 예측모형 - 단순지수예측모델
# -------------------------------------------------
# 가. 해당 시계열 유형 : 시간의 균형수준(theta) + 불규칙 성분
# 나. 단기적인 미래 예측에 사용
# 다. 기존 시계열 자료의 가중평균을 사용
# 라. 가중치의 적용 방식은 아래와 같습니다.
#     시점(t)가 현재 --> 과거로 갈수록, 가중치가 지수적으로 감소
#     하도록 적용
# 마. 단순지수평활법에서, 시계열 자료의 모형은 아래와 같음 :
#
#     Yt = Level + 뷸규칙성분(Irregular)
#
# 바. Y(t+1)에서의 관측치는 아래와 같이 정리할 수 있음 :
#
#     Y(t+1) = c0*Yt + c1Yt-1 + c2*Yt-2 + ....
#
#     where, Ci(i번째 가중치) = alpha(1-alpha) (i = 0, 1, 2, 3 ...)
#             0 <= alpha <= 1 (모든 가중치C의 합 = 1)
#             alpha : 가중치의 감소율을 통제하는 파라미터
#                     (함수내에서, 자동으로 결정됩니다)

alpha <- 1:100
C <- alpha * (1-alpha)
plot(C)

# 사. 사례데이터셋 : nhtemp Time-series object

nhtemp # 미국 코네티컷 주의 New Haven 지역의 약 60년간의 영평균 기온 시계열 자료단위(화씨)
View(nhtemp)

# (1) 판단 : 계절성분(X), 추세성분(X), 불규칙성분(O)
#       ==> 단순지수평활법 적용하기에 합리적으로 판단됨
plot(nhtemp)      # 시계열 시각화 - 1
ts.plot(nhtemp)   # 시계열 시각화 - 2

# (2) 시계열 예측모형(단순지수에측모델) 제작
library(forecast)

(fit <- ets(nhtemp, model = 'ZNN')) # Z는 자동선택
names(fit) # fit의 속성 보기 이 중 fitted는 모형을 통해 나온 추정값.
fit$fitted
fit$residuals
fit$aic
fit$series

# (3) 1-step ahead forecast 수행(1 시간단위 선행예측)
forecast(fit, h = 1) # 80%, 95% 신뢰구간, 예측값 나옴 !!
forecast(fit, h = 3) # 1년치와 3년치 서로 값이 비슷해보이지만 약간 다름

# (4) 시각화 with 1-step ahead forecasting
plot(forecast(fit,1)) # 하나를 예측했음. 진한색 : 신뢰구간(95%), 연한건 : 신뢰구간(80%),  점 : 예측값,
plot(forecast(fit,3)) # 3년치 해보니까, 예측값은 비슷하게 나오는 것 같음. 

# (5) 시계열 예측의 정확도 판단  # accuracy보단 summary를 더 추천 ! 
accuracy(fit) # 지수예측모델의 정확도를 판단할 수 있는 7가지 값 보여줌.(오차율과 관련)
summary(fit) # Recommended - AIC와 예측오차율을 동시에 판단가능능

