# 다중선형회귀
#
# (1) 독립(예측/설명)변수가 2개 이상일 때
# (2) 독립변수와 종속변수간의 관계가 선형적일 때
#

# 분석 데이터셋: state.x77{datasets}
# 미국의 50개 주의 강력범죄(살인율)와 관련된,
# 여러 변수를 가지고 있는 것으로,
# 인구수, 문맹율, 평균소득, 추운날씨를 보인 날수 등을
# 변수로 가지고 있음.
str(state.x77)
class(state.x77)

df_states <- 
  as.data.frame(
    state.x77[ , 
         c('Murder', 'Population', 'Illiteracy', 'Income', 'Frost')
    ]
  )
View(df_states)  
  

# 1) 변수 선정(독립, 종속)
# 종속변수: Murder (살인율)
# 원인(독립/설명/예측)변수: Population / Illiteracy / Income / Frost

# 2) 종속변수와 선정된 독립변수간의 관계를 확인
cor(df_states)   # 상관행렬

# 산점도행렬
library(car)
dev.off()
scatterplotMatrix(df_states)

# 공분산행렬
( covMatrix <- cov(df_states) )

# cov2cor{stats}
cov2cor(covMatrix)


# 다중선형회귀분석수행
fit <- lm(Murder ~ Population + Illiteracy + Income + Frost, data = df_states)
#fit <- lm(Murder ~ . , data = df_states) # NOT recommended.

fit

summary(fit)
  
  