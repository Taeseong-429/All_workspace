# ANOVA -6 mine
# MANOVA : 다변량 분산분석
# Multivariate ANOVA
#
# formula 에서, 종속변수가 2개 이상인 경우(y1, y2, ... ~ )

# 분석 데이터 셋 : uscereal(MASS)

library(MASS)

rownames(UScereal)
row.names(UScereal)

colnames(UScereal)

library(prettyR)
freq(UScereal$shelf) # 비균형설계. 3단에 유독 많음.

# 요인설계:
#   (1) 집단간 요인 : shelf
#   (2) 분석변수(종속변수) : 칼로리(calories), 지방(fat), 당분(sugars)

attach(UScereal)

  # 분산분석에서, 요인역할을 하는 변수는 factor 타입으로 변환하라 !!!
  str(UScereal)
  UScereal$shelf <- factor(shelf)  
  
  # 종속변수가 여러개일때에는, 이들을 묶어서 
  # 행렬이나 데이터프레임으로 만들어준다 !!! 
  (y <- cbind(calories, fat, sugars))
  class(y)  
  
  # 각 집단별 평균을 구하자 !! 
  aggregate(y, by = list(shelf), mean) # 데이터프레임이든 행렬이든 넣으면 다 계산해줌. #
  
  # MANOVA 수행
  fit.mov <- manova(y ~ shelf)
  fit.mov
  
  # 분산분석의 유의성 검정
  summary(fit.mov)  
  
  # 각 종속변수별, 유의성 검정
  summary.aov(fit.mov) # 유의성 검정 반드시 각 종속변수별로도 유의성 인정되는지 확인해야함 !! 
  summary.manova(fit.mov)
  
  # 적합화 시킨 모델의 다양한 속성을,
  # 아래와 같이, 알든/모르든, 자주 볼려고 하라 !!!!
  names(fit.mov)
  fit.mov$fitted.values  
  
  # 분산분석의 가정(assumptions) 평가
  # (1) 지정된 모든 종속변수는 정규성을 가져야 한다.
  # (2) 집단간 요인이 만들어내는, 각 집단의 분산이 등분산성을 가짐
  
  # 다변량 데이터(y)의 정규성 검정 (***) # (써먹을 수 있을듯)
  # "막간의 이론" (A theory) ---------------Mul~~~ 이 파일에 들어있음 사용법.
detach(UScereal)  
  