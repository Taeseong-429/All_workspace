# ---------------------------------------------------
# Time-series object 의 통합: aggregate() function
# ---------------------------------------------------
# (1) 데이터가 data.frame or Time-series object 일 때,
#     aggregate() function 을 이용하여, 자료 통합
#
# (2) Syntax:
#     aggregate(x, nfrequency = 1, ndeltat = 1, FUN=sum, ts.eps = ) -> default
#
#     where,
#           x = data.frame or time-series object
#           nfrequency = frequency
#           ndeltat = deltat
#           FUN = 통계량 산출함수
#           ts.eps = 허용오차
#


# ---------------------------------------------------
# (1) Time-series object creation
# ---------------------------------------------------
zz1 <- ts(matrix(1:24, 8, 3), start = c(2001, 1), frequency = 4, names = c('A','B','C'))
zz1


# ---------------------------------------------------
# (2) Time-series object 통합
# ---------------------------------------------------
#     분기별 자료 --> 연도별 자료로 통합
# ---------------------------------------------------
( result <- aggregate(zz1) )   # nfrequency = 1: 분기 -> 연간 자료로 통합
class(result)


# ---------------------------------------------------
# (3) Time-series object 통합
# ---------------------------------------------------
#     분기별 자료 --> 반기별 평균으로 통합
# ---------------------------------------------------
( result <- aggregate(zz1, nfrequency = 2, FUN = mean) )
class(result)


