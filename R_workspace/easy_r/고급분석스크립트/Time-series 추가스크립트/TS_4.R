# ---------------------------------------------------
# Time-series object 의 차분(difference, 계차)
# ---------------------------------------------------
# (1) 시계열 자료에서, 특정시점의 관측치(Yt)에서, 그 앞의
#     관측치(Yt-1)와의 차이를 의미
#
# (2) 시계열 자료가 추세성분(Trend)을 가지고 있는 경우,
#     이 추세성분을 제거할 때 사용
#
# (3) diff{base} 함수 이용
#     where, 
#         lag = an integer indicating which lag to use (default = 1)
#         difference = lag time-lag 만큼 적용할 차분 횟수 (default = 1)
#                      an integer indicating the order of the difference
#                      If difference is larger than one this algorithm is applied recursively to x.
#                      Note that the returned value is a vector which is shorter than x.

dd.ts


# ---------------------------------------------------
# 1시차(timelag) 차분 : Delta Yt = Yt - Yt-1
# ---------------------------------------------------
diff(dd.ts, lag = 1)                    # 1 시차만큼, 1회 차분(difference)
diff(dd.ts, differences = 1)            # 상동
diff(dd.ts, lag = 1, differences = 1)   # 상동

diff(dd.ts, lag = 1, differences = 0)   # XXX: bad value for 'lag' or 'differences'

diff(dd.ts, lag = 1, differences = 2)   # 1 시차만큼, 2회 차분(difference)
diff(dd.ts, lag = 1, differences = 3)   # 1 시차만큼, 3회 차분(difference)


# ---------------------------------------------------
# 2시차(timelag) 차분 : Delta Yt = 1 시차 차분 - Yt-1
# ---------------------------------------------------
diff(dd.ts, lag = 1, differences = 2)   # 1 시차만큼, 2회 차분

diff(dd.ts, lag = 2, differences = 1)   # 2 시차만큼, 1회 차분 (위 결과와 틀림)

