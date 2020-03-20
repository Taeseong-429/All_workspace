# --회귀모델의 변수선택 --
# 많은 예측변수 중에서, 최종 예측변수를 선택하는 자동화된 방법

# *********************
# (1) 단계적 회귀 (Step-wise Regression)
# *********************
# 가. 예측변수들을, 어떤 기준에 이를때까지, 회귀모델에 변수를
#     가감
# 나. 두가지 종류(=알고리즘):
#     a. Forward Stepwise (= 전진)
#        예측변수들을 더이상 더해도, 모델의 설명력이 더이상
#        향상되지 않을때까지, 모델에 예측변수를 하나하나씩,
#        차례로 첨가해 나감
#
#     b. Backward Stepwise (= 후진)
#        모든 예측변수들을 포함한 모델로부터 시작.
#        예측변수를 하나씩 제거해도, 더이상 모델의 설명력이
#        감소되지 않을 때까지, 변수를 하나씩 제거함
#
# 다. 사용 패키지와 함수: stepAIC{MASS} 함수 이용
#     이 함수는, 정확한 AIC 기준을 사용하여, 모델을 단계적으로
#     선택해 나감.
#
# 라. 단계적 방법의 주의사항:
#     - 이 방법이 좋은 모델을 발견하기는 하나,
#     - 발견한 모델이 "최선"의 모델인지는 보장해주지 못함
#       (이유: 모든 가능한 모델을 평가하지 않기 때문)

# 예제: 후진(Backward Stepwise)
library(MASS)

fit <- lm(Murder ~ Population + Illiteracy + Income + Frost, data = df_states) 

stepAIC(fit, direction = 'backward')

par(mfrow=c(2,2))
plot(fit)
# *********************
# (2) 모든변수를 입력하는 방법
#     (모든 부분집합 회귀, All subjects regression)
# *********************
# 가. 모든 부분집합 회귀로, 모든 가능한 모델을 탐색수행.
# 나. 분석가는, 이를 수행할 때, 모든 가능한 결과의 제시나
#     소위 nbest 모델을 선택하여 수행한다.
#     (예: nbest = 2 -> 1개의 예측변수를 가진, 2개의 최선의
#           예측모델 + 2개의 예측변수를 가진, 2개의 최선의
#          예측모델 등, 모든 예측변수가 포함될 때까지의 결과)
#
# 다. 사용패키지: regsubsets{leaps} 함수 이용
# 라. nbest 개수만큼의, 최선의 후보모델을 선택할 때에,
#     지정가능한 최선의 모델기준으로는 아래와 같음:
#     (1) Multiple R^2 (결정계수 - 종속변수변량의 설명력)
#     (2) Adjusted R^2 (결정계수 - 상관강도)
#     (3) Mallow CP statistic 

library(leaps)

leaps <- 
  regsubsets(
      Murder ~ Population + Illiteracy + Income + Frost, 
      data=df_states, 
      nbest=4   # "최선"의 후보 모델의 개수 지정
  )

leaps

plot(leaps, scale='adjr2')

#-------------------------------------

library(car)

dev.off()

par(mfrow=c(2,2))

# 지정된 nbest 개수의 최선의 후보모델 선택시
# 아래와 같은 통계량의 특성은 다음과 같음:
#  (1) R^2(rsq) - 예측변수에 의해서, 설명되는 종속변수의
#                 변량의 크기. 단, 예측변수가 많아지면,
#                 이 수치는 항상 증가한다.
#                 이로인해서, 표본크기에 비해, 모회귀계수가
#                 많아지면, 소위 "과적합"(overfitting) 발생
#  (2) Adjusted R^2(adjr2) 
#      R제곱(rsq)에 비해서, 보다 정직함함
#  (3) Mallow CP
#      주의할 것은 별로 없지만, 단계적 회귀분석
#      (Stepwise Regression)의 종료기준으로 사용됩니다.
#      좋은모델은 Cp 통계량이 모뗼의 모회뀌꼐쑤예 근접
#      하는 경향을 보임.
subsets(leaps, statistic="bic", legend = F)
subsets(leaps, statistic="adjr2",legend = F)
subsets(leaps, statistic="cp", legend = F)
subsets(leaps, statistic="rsq", legend = F)
dev.off()
abline(1, 1, col='red', lty=1)

# abline(a = , b = , h=, col=,lty=)


