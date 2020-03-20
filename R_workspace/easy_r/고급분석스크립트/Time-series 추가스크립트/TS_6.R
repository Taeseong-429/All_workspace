# ---------------------------------------------------
# Time-series object 의 Box-Cox 특수변환
# ---------------------------------------------------
# (1) 시계열 자료의 특수변환방식
# (2) Box-Cox 변환 공식:
#     
#     f(x:lambda) = f(x:Box-Cox변환지수) = (x^lambda - 1) / lambda (if lambda != 0)
#     f(x:lambda) = f(x:Box-Cox변환지수) = log(x)                  (if lambda == 0)
#
# (3) Box-Cox 변환 유의성 검정
#
#     Box.test{forecast} function
#
#     H0: Model is GOOD! (No transformation needed)
#     H1: Model is BAD!  (Transformation needed)
#

dd.ts

library(forecast)


# ---------------------------------------------------
# (0) Time-series object 의 Box-Cox 변환 필요여부 유의성 검정
# ---------------------------------------------------
# 
#     Statistical Hypothesis:
#       H0: No transformation needed
#       H1: NOT H0
#

Box.test(dd.ts, lag = 1, type = c('Ljung-Box'))  # H0
# Box.test(dd.ts, lag = 1, type = c('Box-Pierce')) # H0


# ---------------------------------------------------
# (1) Time-series object 의 Box-Cox 변환지수(lambda) 산출
# ---------------------------------------------------
( lambda <- BoxCox.lambda(dd.ts) )


# ---------------------------------------------------
# (2) Time-series object 의 Box-Cox 변환
# ---------------------------------------------------
( new.ts <- BoxCox(dd.ts, lambda = lambda))


# ---------------------------------------------------
# (3) Box-Cox 변환된 Time-series object 의 환원
# ---------------------------------------------------
( old.ts <- InvBoxCox(new, lambda = lambda))

dd.ts
old.ts
