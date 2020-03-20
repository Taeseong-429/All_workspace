# ---------------------------------------------------
# Time-series object 의 합병(합집합) by ts.union() function
# ---------------------------------------------------
# (1) frequency 가 동일한 복수의 time-series object를 합병
#    할 경우, ts.union() 함수 사용
#
# (2) ts.union(ts1, ts2) 함수: 복수의 시계열 객체 합병(UNION)
#    합병시, 대응되는 관측치가 없을 경우, 결측치(NA)로 합병처리(*주의*)
#
# (3) 일반적인 집합개념의 합집합 수행: union() 함수 사용
#    이 함수는, 위 (2)의 ts.union() 함수와 틀린, 집합의 합집합 연산임(*주의*)
#


# ---------------------------------------------------
# (1) Multivariate time-series object creation - 1
# ---------------------------------------------------
zz1 = ts(
        data = matrix(data = 1:24, nrow = 8, ncol = 3),
        frequency = 4,
        start = c(2001, 1),          # 2001년, 1분기
        names = c('A', 'B', 'C')     # 각 time-series 의 이름부여
      )
zz1


# ---------------------------------------------------
# (2) Multivariate time-series object creation - 2
# ---------------------------------------------------
zz2 = ts(
        data = matrix(data = 11:22, nrow = 4, ncol = 3),
        frequency = 4,
        start = c(2002, 1),          # 2002년, 1분기
        names = c('A', 'B', 'C')
)
zz2


# ---------------------------------------------------
# (3) The UNION of two time-series objects by union() function
#     The ordinary union operation of SET
# ---------------------------------------------------
( result <- union(zz1, zz2) )
class(result)


# ---------------------------------------------------
# (4) The UNION of two time-series objects by ts.union() function
#     The special union operation of multiple time-series objects
# ---------------------------------------------------
( result <- ts.union(zz1, zz2))
class(result)

( result <- ts.union(zz2, zz1))
class(result)

( result <- ts.union(zz2, zz2))
zz2
