# ---------------------------------------------------
# Time-series object 의 부분춫출(subset) 및 수정
# ---------------------------------------------------
# (1) matrix or time-series object 의 일부분(subset) 추출
#     및 수정 by window() function
#
# (2) window() function 으로, Time-series object 의 부분추출도
#     가능하고, 동시에 수정도 가능함
#

zz1

tsp(zz1)
cycle(zz1)


# ---------------------------------------------------
# (1) Time-series object에서, 매년 3분기 자료만 추출
# ---------------------------------------------------
zz1
( result <- window(x = zz1, start = c(2001, 3), end = c(2002, 2)))
class(result)

zz1
( result <- window(x = zz1, start = c(2001, 3), delta = 1) )
class(result)

zz1
( result <- window(x = zz1, start = c(2001, 3), frequency = 1))
class(result)

zz1
( result <- window(x = zz1, start = c(2001, 3), frequency = 2))
class(result)

zz1
( result <- window(x = zz1, start = c(2001, 3), delta = 2))
class(result)


# ---------------------------------------------------
# (2) Time-series object에서, 2001년 1분기와 2분기 자료 수정
# ---------------------------------------------------
zz1
window(x = zz1, start = c(2001, 1), end = c(2001, 2)) <- c(11, 12)

zz2
window(x = zz2, start = c(2002, 1), end = c(2002, 3)) <- 1
zz2

zz3
window(x = zz3, start = c(2003, 2), end = c(2003, 3)) <- matrix(1:6, nrow = 2, ncol = 3)
zz3
