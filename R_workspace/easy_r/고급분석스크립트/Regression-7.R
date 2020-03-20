# 회귀모형에서 이상치(Outliters)의 확인

# 이상치의 종류
# (1) 이상치(Outliers)
# (2) 큰-지렛대 점(High-leverage Point)
#     특정 관측치인데, 회귀모형을 통해 나오는 추정값(예측값)에
#     지대한 영향을 끼치는 관측치
#     주로, 독립변수와 관련된 것임.
#     수식: 어떤 데이터 포인트(관측치)가 예측치를 끌어당기는 
#           정도
# (3) 영향치(Influencers)
#     종속변수의 값중에, 영향력 있는 데이터포인트

# (1) 이상치의 판단
#     회귀모델로 잘 예측할 수 없는 관측치
#     대체로, 큰 양수나 음수의 잔차를 가지게 됨
#     
# 잔차(오차) = 종속변수의 관측치 - 종속변수의 추정치(예측값)
#     ε = y - y^
#
# 가. 과대추정: 잔차가 - 방향으로 클수록, 관측치보다 크게 추정
# 나. 과소추정: 잔차가 + 방향으로 클수록, 관측치보다 작게 추정


# *********************
# (1) 이상치 검정
# *********************
# 방법-1: Q-Q plot

# 방법-2: outlierTest{car} - 이상치 검정
# 통계적 가설: 
#    H0: No outlier
#    H1: Not H0

library(car)

# 관측치 중에, 가장 큰 잔차를 가지는 하나의 관측치에 대한
# 이상치 검정이기 때문에, 반복적으로 수행하셔야 함
outlierTest(fit) # Bonferroni p-value로 가설검정


# *********************
# (2) 큰 지렛대 포인트(High-leverage point) 판단
# *********************
# 정의: 다른 예측변수(독립)의 값들에 비해서, 이상치인 값
# 주의: 종속변수(반응)는 고려하지 않음
#
# 판단배경이론:
#     Hat values (모수추정치)와 평균모수치를 비교하여,
#     Hat values(모수추정치)가 평균모수치의 2 ~ 3배 큰 관측치를
#     큰 지렛대 포인트로 판단
#
# 확인된 큰 지렛대 포인트는, 이상치 여부에 따라,
#   (1) 영향치가 될 수도 있고
#   (2) 영향치가 안될 수도 있음

# 가. 모수추정치(hat values) 구하기 - hatvalues{stats}

hatvalues(fit)

# 나. 평균모수치 = p / n 
#      (n =표본크기, p: 회귀모형이 찾아낸, 회귀계수의 개수)

p <- length( coef(fit) )
n <- length( fitted(fit) )

( x <- p / n )

# High-leverage point 판단함수 만들기
hat.plot <- function(fit) {
  p <- length( coef(fit) )
  n <- length( fitted(fit) )
  
  hv <- hatvalues(fit)
  plot(hv, main = '- Index plot of hat values -')
  abline(h=c(2, 3) * p/n, col='red', lty=2)
  identify(1:n, hv, names(hv))
}

hat.plot(fit)


# *********************
# (3) 영향치 판단
# *********************
# 회귀모형의 회귀계수 결정에 큰 영향을 주는 관측치
# 이론: Cook's distance (거리척도)를 이용해서, 찾아냄.
# 작용: 회귀모델이 하나의 관측치(영향치)에 의해서, 
#       극적으로 변화하게 됨
#
# 판단공식:
#     if Cook's distance > 4 / (n - k - 1), ===> 영향치
#     where,
#           n: 표본의 크기, k: 예측(독립)개수
#

n <- nrow(df_states)
k <- length(coef(fit)) - 1 # why? 절편(intercept)는 제외

cutoff = 4 / (n - k -1)

dev.off()
dev.new()

# par(mfrow=c(2,2))
# plot(fit)
plot(fit, which = 4)

# cutoff line 추가
abline(h = cutoff, col='red')


# *************
#  Added-variable plot
# *************
# avPlot{car}함수를 이용한 영향치 판단
#
# Cook의 거리에 기반한 영향치 판단 기법은, 제약이 있습니다
# 제약: 영향치를 찾는데에는 도움을 주지만, 찾아낸 영향치가
#       실제 모델적합화에서 어떻게 영향을 끼치는지는 말해주지
#       않는다.

library(car)

dev.off()
avPlots(fit, id.method = 'identify', ask = F)



