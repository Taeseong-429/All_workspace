# ---------------------------------------------------
# Time-series object 의 시차(time lag)지정
# ---------------------------------------------------
# (1) 현재시점의 관측치: Yt
# (2) K차 시차(timelag)의 관측치 : Y(t-k)
# (3) 1차 시차(timelag)의 관측치: Y(t-k) = Yt-1
# (4) 2차 시차(timelag)의 관측치: Y(t-k) = Yt-2

dd.ts   # Yt : 현재시점의 time-series

dd2.ts <- lag(dd.ts, k = 2)   # k=2  : Y(t-k) = Yt-1 => 2차 시차(timelag) time-series
dd2.ts

dd3.ts <- lag(dd.ts, k = -3)  # k=-3 : Y(t-k) = Yt+3 => -3차 시차(timelag) time-series
dd3.ts


