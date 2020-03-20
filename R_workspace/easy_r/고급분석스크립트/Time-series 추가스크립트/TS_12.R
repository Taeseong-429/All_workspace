# ---------------------------------------------------
# 시계열 예측 
# ---------------------------------------------------
# (1) Random Walk with Drift model 예측모형 생성
# (2) 생성한 예측모형에 따라, 미래값 예측


# ---------------------------------------------------
# (1) 시계열 객체 생성 및 기본특성 탐색
# ---------------------------------------------------

dd <- matrix(
        c(
          c(1342, 1442, 1252, 1343),
          c(1425, 1362, 1456, 1272),
          c(1243, 1359, 1412, 1253),
          c(1201, 1478, 1322, 1406),
          c(1254, 1289, 1497, 1208)
        )
)

dd
dim(dd)

( dd.ts <- ts(data = dd, start = c(2006, 1), frequency = 4) )

attributes(dd.ts)
dimnames(dd.ts)
dimnames(dd.ts)[[2]]

tsp(dd.ts)
start(dd.ts)
end(dd.ts)
frequency(dd.ts)
cycle(dd.ts)


plot(dd.ts, main = ' - dd.ts -', ylab = 'Yt')


# ---------------------------------------------------
# (2) Time-series object의 Box-Cox 변환 유의성 검정
# ---------------------------------------------------
Box.test(dd.ts)   # H0: No transformation needed


# ---------------------------------------------------
# (3) Random Walk with Drift model 예측모형 생성 - rwf{forecast}
# ---------------------------------------------------
library(forecast)

# Random Walk with Drift forecast model creation & forecasting with h=10
( fit.ts <- rwf(dd.ts, h = 10, drift = F, level = c(80, 95)) )

class(fit.ts)

names(fit.ts)

fit.ts$method
fit.ts$model
fit.ts$fitted
fit.ts$residuals
fit.ts$series

summary(fit.ts)

plot(fit.ts, xlab = 'Time', ylab = 'E(Yt)')

