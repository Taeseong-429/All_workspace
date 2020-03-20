# ---------------------------------------------
# 비계층적 군집분석(=분할 파티셔닝) 사례 2
# ---------------------------------------------

# K-means clustering with the same data set, USArrests

# (1) 다변량 데이터셋의 변수 척도화(표준화) --> 표준화시킨 데이터셋만을 써야함. 
library(pls)

zUSArrests <- stdize(as.matrix(USArrests))
View(zUSArrests)

# (2) k=4 (사전에 정한 군집의 개수)로 분할 파티션닝 
kmc <- kmeans(zUSArrests, centers = 4)
kmc
names(kmc)
kmc$cluster # 각 관측치별로 소속군집 정보가 들어있는 벡터. 이걸 넣어주면됨.

# (3) 소속군집정보를 가지고 있는 파생변수(cluster) 추가
library(dplyr) #여기선 원래 데이터 프레임에 붙여야함
USArrests <- USArrests %>% mutate(cluster = kmc$cluster)

View(USArrests)

# (4) 군집결과 시각화
plot(zUSArrests, col = kmc$cluster) # 매트릭스 상태이니까 그냥 점만 찍어서 나옴.
plot(as.data.frame(zUSArrests, col = kmc$cluster)) # 데이터프레임으로 바꾸면 다르게 나옴 
pairs(zUSArrests, col = kmc$cluster, pch = 16) # 아니면 그냥 이거 pairs로 출력하면 됨. 

