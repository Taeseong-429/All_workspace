# --------------------------------------------------------
# 비계층적 군집분석(= 분할 파티셔닝) 사례 3
# --------------------------------------------------------

iris
View(iris)

df_iris <- iris[-5] # 맨 끝에 품종(species) 변수는 제외시킴킴

View(df_iris)
table(iris$Species)

# (2) k-means clustering with k = 3 수행
( fit <- kmeans(df_iris, centers = 3) ) # 보통 모형만들 때 fit 자주 사용.
# 이거 fitting 시키면, 그 안에 names(fit) 했을 떄, cluster 생기는데 이걸 이제 아래에서 그래프 그릴때나 그럴때 사용하는듯.
names(fit)
class(fit)

# (3) 군집분석 시각화 
# 차원축소 후, 군집결과 시각화
library(cluster)
clusplot(df_iris, fit$cluster, 
         color = T, shade = T, labels = 2, lines = 0) # 원래의 데이터, 클러스터링 벡터 입력!

# (5) 특정 군집의 관측치들만 추출
df_cl2 <- subset(df_iris, fit$cluster == 2)
View(df_cl2)
