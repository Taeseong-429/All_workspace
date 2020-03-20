# ---------------------------------------------------
# 군집분석시(위계적/비위계적 모두 해당)
# 최적의 군집의 개수 결정하기 
# ---------------------------------------------------

library(NbClust)


# (1) 데이터 셋 로딩
library(flexclust)
data("nutrient", package= 'flexclust')

# (2) 최적의 군집의 개수(k) 정하기
(nc <- NbClust(
        scale(nutrient), # 척도화 수행 
        distance = 'euclidean',
        min.nc = 2,# 분석가가 생각했을 때, 최소 군집 개수
        max.nc = 15, # 최대 개수
        method = 'average' # 군집방법은 single, complete 등등 가능
) )
View(nutrient)
View(nc$Best.nc)
names(nc)
class( nc$Best.nc)

nc$Best.nc # 하나의 인덱스에 대해 두개의 값을 보여줌. Nc와 Value.. 
nc$Best.nc[1,]  # 위에꺼 행렬이라고 생각했을 떄 , [1,] 는 열은 지정하지 않고, 위에 있는 값들만 뽑아낸다는 의미
# 즉 우리한테 필요한 Number_clusters 값만 뽑아낸다는 의미 !!! 

# 30개의 인덱스가 제안하는 최적의 군집개수 중에, 
# k = 5로 결정함.

table( nc$Best.nc[1,] ) # 위에꺼 빈도 보여줌. 위에꺼가 군집의 갯수, 아래는 그 군집을 지지하는 인덱스의 갯수수
# 4개의 지표가 군집 갯수 2개, 3개, 5개, 15개 지지.. 한다는 의미 ? 정확히는 모름.
# 근데 2, 15개는 우리가 위에서 정한 값이니까 제외하고 생각.

barplot( 
  table( nc$Best.nc[1,] ),
  xlab = 'Number of Clusters',
  ylab = 'Number of Indexes',
  main = '- To search best cluster numbers -')


# 계층적 군집분석
df <- scale(nutrient)
d <- dist(df)

( fit <- hclust(d, method = 'average')) # 피팅 완료.

dev.off()
plot(fit, hang = -1)

# k = 5 군집개수로 수형도의 군집들을 자름 !!
clusters <- cutree(fit, k = 5)
clusters   # 클러스터링 벡터로 나옴.
table(clusters) # 빈도표 생성.

# 군집별 특성의 차이를 비교
aggregate(nutrient, by = list(cluster= clusters), median) # 군집의 특성의 차이를 판별하는방법.. 군집별로 비교하는듯.
# 여기들은 각 변수의 차이를 비교하는 거.
aggregate(
  as.data.frame(scale(nutrient)),
  by = list(cluster= clusters), 
  median) 

plot(fit, hang = -1) # 
rect.hclust(fit, k = 5) # 우리가 5개로 나눈 군집을 시각화해서 잘라주는거.
