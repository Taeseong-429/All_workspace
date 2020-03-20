# # -----------------------------------------------
# Time-series object 의 Box-Cox 특수변환
# -----------------------------------------------

# (1) 시계열 자료의 특수변환방식

dd.ts
plot(dd.ts)

Box.test(dd.ts) # 통계적 유의해서 변환 필요 없다.

# 랜덤워크 실행 
(fit.ts <- rwf(dd.ts, h = 10, drift = F, level = c(80, 95))) # 예측 스텝, 신뢰수준, drift 없다 함.

# (3) Box-Cox 변환 유의성 검정

library(forecast)
Box.test(dd.ts, lag = 1, type = c('Ljung-Box'))


# (1) Time-series object 의 Box-Cox 변환지수 (lambda) 산출
( lambda <- BoxCox.lambda(dd.ts) )

( new.ts <- BoxCox(AirPassengers, lambda = lambda) )

