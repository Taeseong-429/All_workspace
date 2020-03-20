# -------------------------------------------
# 계층적(위계적) 군집분석 사례 2
# -------------------------------------------
library(dplyr)


data("USArrests")
str(USArrests)
edit(USArrests)

( hc <- hclust( dist(USArrests) , method = 'average' ) )

plot(hc, hang = -1)

# -------------------------------------------
# 군집의 개수를 정해서, 위계적 군집분석 수행
# -------------------------------------------

# 4개의 군집으로 계층적 군집분석결과를 내놔라!!!
( hc4 <- cutree(hc, k =4) ) # 

hc4 # 이거 해서 나온 결과 보니까 개별 관측치가 어떤 군집에 속한지 알 수 있음.

# 원래의 데이터 프레임의 각 관측치의 소속군집정보를 파생변수로 추가
USArrests <- USArrests %>%  mutate(cluster = hc4)
View(USArrests)

USArrests$파생변수 <- hc4 # 두번째 방법.
