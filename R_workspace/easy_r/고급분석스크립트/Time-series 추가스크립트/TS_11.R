# ---------------------------------------------------
# Time-series object 의 차분 및 Box-Cox 변환 사례
# ---------------------------------------------------
# (1) 차분 수행 --> 추세제거 --> 정태성(Stationarity) 확보
# (2) Box-Cox 변환 --> 시간t에 따라 증폭(승법model) -> 일정하게(가법model)
#

data("AirPassengers", package = 'datasets')
( dd.ts <- AirPassengers )


# ---------------------------------------------------
# (1) Time-series object 기본 속성 탐색
# ---------------------------------------------------
attributes(dd.ts)

dim(dd.ts)
dimnames(dd.ts)

tsp(dd.ts)
start(dd.ts)
end(dd.ts)
frequency(dd.ts)
cycle(dd.ts)

dev.off()

plot(
  dd.ts, 
  main = '- dd.ts without differences and Box-Cox transformation -', 
  ylab='AirPassengers')

ts.plot(
  dd.ts, 
  main = '- dd.ts without differences and Box-Cox transformation -', 
  ylab='AirPassengers')


# ---------------------------------------------------
# (2) Time-series object의 Box-Cox 변환 유의성 검정
# ---------------------------------------------------
Box.test(dd.ts)   # H1: Transformation needed


# ---------------------------------------------------
# (3) Time-series object의 Box-Cox 변환 지수 산출 및 수행
# ---------------------------------------------------
( lambda <- BoxCox.lambda(dd.ts) )

( new.ts <- BoxCox(dd.ts, lambda = lambda) )

ts.plot(
  x = new.ts,
  main = '- new.ts with Box-Cox transformation for Additive Model -',
  ylab = 'AirPassengers'
)

ts.plot(
  x = new.ts,
  main = '- new.ts with Box-Cox transformation for Additive Model -',
  ylab = 'AirPassengers')


# ---------------------------------------------------
# (4) Time-series object 차분을 통한 정태성(정상성, Stationarity) 확보
# ---------------------------------------------------
# 차분(Differences) 수행 -> 추세제거 -> 정태성 확보
# ---------------------------------------------------

new.ts <- diff(new.ts)  # with lag = 1 and differences = 1

ts.plot(
  new.ts,
  ylab = 'AirPassengers',
  main = '- new.ts with 1th. differences and Box-Cox transformation -'
)






