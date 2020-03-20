# ---------------------------------------------------
# Time-series object 의 교집합 by ts.intersect() function
# ---------------------------------------------------
# (1) frequency 가 동일한 복수의 time-series object를 합병
#    할 경우, ts.intersect() 함수 사용
#
# (2) ts.intersect(ts1, ts2) 함수: 복수의 시계열 객체 교집합(INTERSECT)
#    수행시, 대응되는 관측치가 없을 경우, 공집합이 아닌 NULL로 반환(*주의*)
#
# (3) 일반적인 집합개념의 합집합 수행: intersect() 함수 사용
#    이 함수는, 위 (2)의 ts.intersect() 함수와 틀린, 집합의 교집합 연산임(*주의*)
#


# ---------------------------------------------------
# (1) Multivariate time-series object creation - 1
# ---------------------------------------------------
zz1 <- ts(
      data = matrix(data = 1:24, nrow = 8, ncol = 3),
      frequency = 4,
      start = c(2001, 1),                        # 2001년 1분기
      names = c('A', 'B', 'C')
)
zz1


# ---------------------------------------------------
# (2) Multivariate time-series object creation - 2
# ---------------------------------------------------
zz2 = ts(
  data = matrix(data = 11:22, nrow = 4, ncol = 3),
  frequency = 4,
  start = c(2002, 1),                           # 2002년, 1분기
  names = c('A', 'B', 'C')
)
zz2


# ---------------------------------------------------
# (3) The INTERSECT of two time-series objects by intersect() function
#     The ordinary intersect operation of SET
# ---------------------------------------------------
( result <- intersect(zz1, zz2) )
class(result)


# ---------------------------------------------------
# (4) The INTERSECT of two time-series objects by ts.intersect() function
#     The special intersect operation of multiple time-series objects
# ---------------------------------------------------
( result <- ts.intersect(zz1, zz2))
class(result)

( result <- ts.intersect(zz2, zz1))
class(result)

( result <- ts.intersect(zz2, zz2))
zz2


# ---------------------------------------------------
# (5) Multivariate time-series object creation - 3
# ---------------------------------------------------
zz3 <- ts(
        data = matrix(21:32, nrow = 4, ncol = 3),
        start = c(2003, 1),                        # 2003년 1분기
        frequency = 4,
        names = c('A', 'B', 'C')
)
zz3


# ---------------------------------------------------
# (6) The intersect of zz2, zz3 time-series objects by ts.intersect()
# ---------------------------------------------------
zz2
zz3

( result = ts.intersect(zz2, zz3))
class(result)

( result = ts.intersect(zz3, zz2))
class(result)
