# ---------------------------------------------------
# 0. 시계열 객체 생성을 위한, 행렬(Matrix) 생성
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


# ---------------------------------------------------
# 1. Time-series object 객체 생성
# ---------------------------------------------------
# 20x1 차원을 가지는 matrix(행렬) -> Univariate time-series
# 만일, MxN 차원을 가지는 행렬(matrix) 이나 Dataframe을 
# 넣으면, ---> Multivariate time-series object
( dd.ts <- ts(data = dd, frequency = 4, start = c(2006, 1)) )


# ---------------------------------------------------
# 2. 생성한 Time-series object 속성 탐색
# ---------------------------------------------------
attributes(dd.ts)

dim(dd.ts)
dimnames(dd.ts)
dimnames(dd.ts)[[1]]
dimnames(dd.ts)[[2]]

tsp(dd.ts)             # TS 의 start, end, frequency
class(dd.ts)

start(dd.ts)           # TS 의 시작시간
end(dd.ts)             # TS 의 종료시간
frequency(dd.ts)       # TS 의 frequency
cycle(dd.ts)           # TS 의 period(주기)


# ---------------------------------------------------
# 3. Time-series 의 subset 추출
# ---------------------------------------------------
# TS (분기)에서, 2007년 2분기 ~ 2008년 3분기까지 자료(window) 추출

window(x=dd.ts, start = c(2007, 2), end = c(2008, 3))
