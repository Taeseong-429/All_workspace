# Regression-5.R
# 회귀분석의 통계적 가정(statistical Assumptions)의 충족여부 확인을
# 통해, 회귀분석결과에 대한 신뢰성 확보

# (1) 회귀분석을 통한, 모델의 적합화(Model fitting)은 첫번째 단계에
#     불과하다...
# (2) 회귀분석의 가정을 검정하는 방법이 습득되어야 만 한다.

# 회귀진단(Regression Diagnostics) 수행
# lm()함수로 적합화된 모델과, summary()함수로 확인된
# 회귀모델과 계수의 유의성 검정의 결과는, 결코
# 회귀분석의 가정을 설명하지 않습니다. (정규성, 등분산,, 이런거 말하는듯 ?)

df_states <- as.data.frame(
  state.x77[, 
            c('Murder', 'Population', 'Illiteracy', 'Income', 'Frost')])

# 다중선형회귀분석수행
fit <- lm(Murder ~ Population + Illiteracy + Income + Frost, data = df_states)

View(df_states)

fit
summary(fit)

# -------------------------------------------------
# 회귀진단 수행
# -------------------------------------------------
# 그림영역에, 지정된 격자구조를 만듦
par(mfrow = c(2,2)) # 2 x 2 격자구조
plot(fit)
par(mfrow = c(1,1))


# ---------------------------------------------------
# 회귀진단 수행 방법 - 2 (향상된 접근법)
# ----------------------------------------------------
# {car} 패키지 안에, 회귀분석 가정을 판단할 수 있는
# 유용한 함수들이 있습니다.
# {gvlma} 패키지도 유용하다.

# (1) 정규성 가정 진단 
lirary(car)
qqPlot(fit, labels = row.names(df_states),
       simulate = T, # 이거 시뮬레잍 중요하다는데 무슨뜻 ?
       main = '- Main Title -')

# (2) 독립성 가정 진단
# 대상 : 잔차의 독립성을 보는 것이다 !!!
# 잔차의 독립성 검정기법 --> Dubin-Watson Test 이용
# durbinWatsonTest 검정의 통계적 가설은 아래와 같음:
#   H0: 모상관계수(rho)는 == 0 이다.
#         --> 잔차값들이 서로간에 자기상관성이 없음 의미
#         --> 잔차는 독립이다다
#   H1: NOT H0
durbinWatsonTest(fit) # 귀무 채택.
# 잔차들이 갖고 있는 값이 서로간에 관련성이 없다. 독립이다.

# (3) 선형성 가정 진단
# 독립변수와 종속변수 간의 관계가 선형적인지 진단
# 실제 진단 대상은 바로 잔차이다.

# 선형성 가정을 위배하는 경우에는,
# (1) 현재의 fitted model(회귀모형)은 
#     적합하지 않은 것으로 간주하고, ,
# (2) 다항회귀같은 곡선적 요인을 추가하거나
# (3) 하나 또는 둘 이상의 독립변수들을 소위 "변환" 해야함.
library(car)

crPlots(fit)

# (4) 등분산성 진단
# ncvTest(car) 검정함수 이용
# 통계적 가설 :
#    H0 : Heteroschedasticity (등분산성)
#    H1 : NOT H0
library(car)

ncvTest(fit)

par(mfrow = c(1,1))


# 오차등분산성을 평가하는 Spread-Level Plot
# -----------------------------------------
# 점들이 가장 적합한 수평선 주위에 무작위적인 수평적 무리를
# 형성하면, 등분산성을 인정할 수 있다
#
# 만일 이분산성을 가지게 된다면,
# 수평이 아닌 선(곡선등)이 나타나게 됨
#
# 플롯의 결과는 위의 ncvTest{car} 검정결과와 같음
spreadLevelPlot(fit)


# *********************************
# 선형회귀모델의 가정에 대한 옴니버스 검정
# *********************************

library(gvlma)

gvlma(fit)