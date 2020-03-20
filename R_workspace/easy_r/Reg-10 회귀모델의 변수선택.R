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

# 예제: 후진(Backward Stepwise)
library(MASS)
df_states

fit <- lm(Murder ~ Population + Illiteracy + Income + Frost, data = df_states)
stepAIC(fit, direction = 'backward') # 이거 결과로 나온거 : 첫번째 단계에서 Frost를 뺀게 가장 좋은거라는 의미 ??
# 진행할수록 스텝 볼 수 있음. 두번째 단계는 좀 더 좋아졌다는 얘기. # 두번째 단계에선 Frost 이미 뺀 결과고, Income를 뺀게, 이 3개만 있을때보다 훨씬 좋다는 의미
# 세번째 스텝. income를 뺀 상태. 가 좋다는 의미인듯. 다음단계부턴 빼면 AIC 올라가니까 안좋다고 보면 되는듯?  ? ?? ? ?? ?

# *********************
# (2) 모든변수를 입력하는 방법
#     (All subjects regression)
# *********************
# 가. 모든 부분집합 회귀로, 모든 가능한 모델을 탐색 수행.
# 나. 분석가는, 이를 수행할 때, 모든 가능한 결과의 제시나 
#     소위 nbest 모델을 선택하여 수행한다. 
#     (예 : nbest = 2 --> 1개의 예측변수를 가진, 2개의 최선의 
#            예측 모델 + 2개의 예측변수를 가진, 2개의 최선의 
#             예측모델 등, 모든 예측변수가 포함될 때까지의 결과)
#
# 다. 사용패키지 : regsubsets{leaps} 함수 이용
# 라. nbest 개수만큼의, 최선의 후보모델을 선택할 때에, 
#      지정가능한 최선의 모델 기준으로는 아래와 같음 :
#       (1) Multiple R^2 (결정개수 - 종속변수변량의 설명력)
#       (2) Adjusted R^2 (결정계수 - 상관강도를 보여줌)
#       (3) Mallow CP statistic 

library(leaps)

leaps <- regsubsets(
            Murder ~ ., 
            data = df_states,
            nbest = 4) # "최선"의 후보 모델의 개수 지정. # 모든 예측변수 넣음.
leaps # 이거 친 결과 : 해석하기 난감. 이 변수의 값을 가지고 plot에 넣기
plot(leaps, scale = 'adjr2')

# -------------------------------------------------------

library(car)
dev.off

par(mfrow = c(2,2))

# 지정된 nbest 개수의 최선의 후보모델 선택시
# 아래와 같은 통계량의 특성은 다음과 같음 :
# (1) R^2(rsq) - 예측변수에 의해서, 설명되는 종속변수의
#                변량의 크기. 단, 예측변수가 많아지면, 이 수치는 항상 증가한다.
#                이로인해서, 표본크기에 비해, 모회귀계수가 많아지면, 소위 "과적합(overfitting)"발생
# (2) Adjusted R^2(adjr2)
#     R제곱(rsq)에 비해서, 보다 정직함함
# (3) Mallow CP
#     주의할 것은 별로 없지만, 단계적 회귀분석
#     (Stepwise Regression)의 종료기준으로 사용됩니다.
#     좋은 모델은 Cp 통계량이 모델의 모회귀계수에 근접하는
#     경향을 보임.
# (4) unadjusted R^2(rsq)
subsets(leaps, statistic = 'bic')
subsets(leaps, statistic = 'adjr2') # 3  이런 순으로 하기 ~! 
subsets(leaps, statistic = 'cp')  # 우리는 이거 쓰는게 좋다는건가 ? 순서로만 치면 1
subsets(leaps, statistic = 'rsq') # 2 

# abline(1,1,1,col = 'red',lty =1)

abline(1, 1, col = 'red' ,lty = 1) # 이 cutoff 라인 아래에 있는 게 최적의 (best)모델이다?.. 라는 얘기 같음.
# 하지만 우리가 지정한 갯수 만큼의 후보모델만 내줄 뿐, 최선의 모델은 아님.. 분석가가 나머지 결정 !  
# 위에있는 것들은 뺴도 됨 ! 
df_states

