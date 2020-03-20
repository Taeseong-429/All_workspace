# --------------------------------------------------
# 비계층적(위계적) 군집분석 사례
# --------------------------------------------------

# (1) 모든 변수를 척도화 수행
df_beer
View(df_beer) # 참고로ㅡ, 이미 1번파일에서 ID 지우고 한번 더 지운 상태임.

library(pls)
df_zbeer <- stdize( as.matrix(df_beer) )
View(df_zbeer)

df_zbeer <- as.data.frame(df_zbeer)
mean(df_zbeer$CALORIES)
var(df_zbeer$CALORIES) # 분산이 1로 
sd(df_zbeer$CALORIES)

# (2) 군집분석 수행(k-means with k = 2)
( kmc <- kmeans(df_zbeer, centers = 2) )

# (3) 군집분석결과 탐색
names(kmc)
kmc$cluster

# (4) 군집분석결과 시각화
plot(df_zbeer, col = kmc$cluster, pch= 16)
