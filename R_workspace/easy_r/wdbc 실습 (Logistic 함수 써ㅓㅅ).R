# Clustering -4 
# 직관적으로 
library(RWeka)

View(mowner.data)
(mowner.weka <- Logistic(formula = owner ~ ., data = mowner.data))

summary(mowner.weka) # 정확하게 분류된 관측치 20개, 잘못 분류 관측치 4개. 오차율 16% 자동으로 알려줌.

# (wdbc.weka <- Logistic(formula = , data = wdbc))

# 예측수행
mowner.pred <- 
  predict(mowner.weka, newdata = mowner.data, type = 'class') # 새롭게 넣을 데이터 셋 new로 지정

mowner.pred 
