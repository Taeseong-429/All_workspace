# ---------------------------------------------------
# 시계열 자료의 기본연산( R 행렬연산과 유사 )
# ---------------------------------------------------


# ---------------------------------------------------
# 1. 다변량 시계열 객체(Multivariate time-series) 생성
# ---------------------------------------------------
zz <- ts(
    data = matrix(1:24, nrow = 8, ncol = 3, byrow = F),   # (8x3) matrix
    # data = matrix(1:24, nrow = 2, ncol = 4, byrow = F),   # (8x3) matrix
    frequency = 4,
    start = c(2001, 1),
    names = c('A', 'B', 'C')
    # names = c('A', 'B', 'C', 'D')
)

zz


# ---------------------------------------------------
# 2. 다변량 시계열 객체(Multivariate time-series)의 속성 탐색
# ---------------------------------------------------
attributes(zz)

dim(zz)
dimnames(zz)
dimnames(zz)[[1]]
dimnames(zz)[[2]]
tsp(zz)
class(zz)

start(zz)
end(zz)
frequency(zz)
cycle(zz)


# ---------------------------------------------------
# 3. 다변량 시계열(Multivariate time-series)에서
#    특정 Time-Series 추출 방법
# ---------------------------------------------------
( TS_A <- zz[, 'A'] )        # A time-series 만 추출
( TS_A <- zz[, 1] )          # 상동

( TS_B <- zz[, 'B'])         # B time-series 만 추출
( TS_B <- zz[, 2])           # 상동


# ---------------------------------------------------
# 4. 두 시계열 객체의 산술연산
# ---------------------------------------------------
TS_A + TS_B                  # 두 행렬의 덧셈 연산
TS_A - TS_B                  # 두 행렬의 뺄셈 연산
TS_A * TS_B                  # 두 행렬의 곱셈 연산
TS_A / TS_B                  # 두 행렬의 나눗셈 연산


# ---------------------------------------------------
# 5. 시계열 객체(Multivariate time-series) 시각화 - 1
# ---------------------------------------------------
par(las = 0)  # the style of axis labels - 
              #  0: always parallel to the axis [default]
              #  1: always horizontal
              #  2: always perpendicular to the axis
              #  3: always vertical

# Multivariate time-series virtualization
plot(zz, main = '- Multivariate time-series -')


# Single time-series virutalization
plot(TS_A, main = '- A time-series -', ylab = 'A')
plot(TS_B, main = '- B time-series -', ylab = 'B')


# ---------------------------------------------------
# 5. 시계열 객체(Multivariate time-series) 시각화 - 2
# ---------------------------------------------------
ts.plot(zz, main = '- Multivariate time-series -', xlab = 'Time', ylab = 'zz')
ts.plot(TS_A, main = '- A time-series -', ylab = 'A')
ts.plot(TS_B, main = '- B time-series -', ylab = 'B')

ts.plot(zz, gpars=list(
                    main='- Multivariate time-series -', 
                    xlab = 'Time', 
                    ylab = 'zz', 
                    lty=c(1:3),
                    lwd=c(1:3),
                    col=c('red', 'green', 'blue')
                  )
        )

legend(
  'bottomright', 
  c('A', 'B', 'C'), 
  lty = 1:3, 
  col=c('red', 'green', 'blue')
)


ts.plot(TS_A, gpars = list(main = '- A time-series -', ylab = 'A', lty=2, col='red', lwd=2))
ts.plot(TS_B, gpars = list(main = '- B time-series -', ylab = 'B', lty=1, col='blue', lwd=1))
