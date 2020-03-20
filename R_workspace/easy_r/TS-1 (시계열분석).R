# 시계열 분석

# 가. 시간의 흐름에 따라 변화하는 변수를 분석하는 방법
# 나. 회귀분석은, 변수간 변수간의 관계를 회귀모형으로 잡아내서,
#     인과관게를 검증하는 목적
# 다. 시계열분석은, 하나의 변수가 시간의 흐름에 따라, 움직이는 것을, 
#     수리모형으로 잡아내서, 미래를 예측하기 위한 것.
#     정리 : 결국 변수와 시간의 관계를 모형화하는 것이 바탕이 됨.
# 라. 시계열분석 모형은 변수 Y가 시간에 따라, 어떻게 변화해
#     나가는지를 수리모형으로 표현 ---> 쉽게 말하면,
#     Y가 종속변수이고, 시간이 독립변수이다 라고 생각하면 됩니다.
#     그러나, 시간이 독립변수 역할은 하지만, 실제 독립변수 아닙니다.

# ----------------------------------------------------------
# 시계열 모형의 종류 
# ----------------------------------------------------------

# (1) AR(p) # (자기회귀 모형..)
# (2) MA(q) # (이동평균 모형)
# (3) ARMA(p, q) 
# (4) ARIMA(p, d, q) # 이게 궁극적 목적 ?

# ----------------------------------------------------------
# 시계열 모형의 정의식
# ----------------------------------------------------------

#Ｙ＝　ａ　＋　ｂＴ　＋　ｅ
#      （ｅ：교란항　－　설명가능／불가능한　모든 밝혀지지　않은　요인들）
# ->　Ｙ＝　θ　＋　Ｎｔ(교란항)　
#     （θ：　시계열의　균형수준->정태성(stationarity）)
#
# 시계열 데이터는 추세(trend) + drift(동향) + 오차(교란)으로 구성
# 여기서, 추세(trend)를 제거한 시계열 데이터는 정태성을 가진다
# 라고 하며, 정태성이 시계열 분석의 시작이다!!!!


# R에서 대표적인 시계열 데이터 셋
# (1) AirPassengers
# (2) JonhsonJonhson
# (3) nhtemp
# (4) Nile
# (5) sunspots

View(AirPassengers)
View(JohnsonJohnson)
View(nhtemp)
View(Nile)
View(sunspots)

plot(AirPassengers)
plot(JohnsonJohnson)
plot(nhtemp)
plot(Nile)
plot(sunspots)

# 시계열 데이터 직접 생성
sales <- sample(1:99, 24,  F) # 비복원추출로 24개 뽑는다.  (여기서 24개인 이유는 2년치 월간 자료)
sales

tsales <- ts(sales, start = c(2003,1), frequency = 12)# 2년치 월간 판매액
tsales
-
plot(tsales)
start(tsales)
end(tsales)
frequency(tsales)

tsales.subset <- window(tsales, start = c(2003,5), end = c(2004,4))
tsales.subset # 시계열 데이터에서 일정 기간을 뽑아냄.

# ========================주기 나눠서 연습

(tsales2 <- ts(sales, start = c(2003,1), frequency = 365))

(tsales3 <- ts(1:8, start = c(2009, 4), frequency = 4)) # fre로 분기로 나누고, 내가 연도 뒤에 2009년 다음 4로 하면 4분기부터 시작한다는 의미.

(tsales31 <- ts(1:8, start= c(2010, 1), frequency = 1)) # start 뒤에 0으로 하면 2009부터 시작. (전년부터 시작한다는 의미)

(tsales4 <- ts(1:24, frequency= 8760)) # 시간단위로 데이터 지정.


# ==============================지수평활
class(Nile)
start(Nile)  
end(Nile)
frequency(Nile)



dev.off()
library(forecast)
par(mfrow = c(2,2))

plot(Nile, main = '- Original Time Series- ')
plot(ma(Nile, 3), main = '- Time Series with-3 ') # forecas에 있는 ma 이동평균 평활함수 사용 # 얼마나 drift를 깎을것이냐..
plot(ma(Nile, 5), main = '- Time Series with-5 ')
plot(ma(Nile, 7), main = '- Time Series with-7 ') # 평활수준만 계속 숫자 바꾸는거 ! 
