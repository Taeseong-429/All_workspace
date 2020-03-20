# 3.9 Onewayanova 실습

df <- as.data.frame(df)
str(df)
table(df$age) # 각 집단 관측치 갯수가 다르므로 균형잡히지 않음. 

library(prettyR) # 의 freq 함수 사용해서 빈도와 비율 한꺼번에
freq(df$age)

str(df)
df$age <- factor(df$age, levels = c('20대', '30대', '40대') , 
                    labels = c('20s', '30s', '40s')) # chr타입의 age를 팩터로 변환 후 이름지정
# str 해보면 age는 팩터로 변함. (이건 내가 직접 라벨명까지 바꾸고 싶을때 사용.) 
# 하지만 실습은 이거 대신 as.factor 사용 ! 

df$age <- as.factor(df$age)

tapply(df$score, df$age, mean) # 그룹바이 집계와 같음

aggregate(df, FUN = mean)
example("aggregate")

attach(df) # attach와 detach를 이용해 내가 갖고있는 변수에 접근할 수 있다.
tapply(score, age, mean)
detach(df)


fit.aov <- aov(score~age, data = df) # ~ 양옆에 분석대상 변수(score)와 factor(age)
fit.aov # 호출출
summary(fit.aov) # 검정통계량 값과 p-value 값 등 다 나옴. summary 사용
anova(fit.aov) # anova와 summary 둘다 사용가능.

# 다중비교 수행 # 하나의 검정방법 (가설있음)
library(multcomp)
?glht
fit.glht = glht(fit.aov, linfct = mcp(age = 'Tukey'))  
summary(fit.glht) # 검정결과 귀무가설 기각. 어느 연령대가 평균이 가장 높은가 # 30대 40대 20대 순으로 평균 순서.
# 어느 집단이 평균 가장 높고 어느 집단이 가장 낮은지 볼 수 있음.
# 검정통계량 값이 없으나, summary함수에 집어넣으면 확인 가능.
names(fit.glht)

glht(fit.aov, linfct = mcp(age = 'Dunnett'))

# ----------
freq(cholesterol$trt) 

attach(cholesterol)
aggregate(response, by = list(trt), FUN = mean ) # by는 그룹을 만들어내는 기준 대상. (by는 리스트를 요구함. R의 리스트 객체는 파이썬의 dict. 즉, 키 밸류 쌍으로 넣으면 됨.) FUN은 mean으로로
# trt로 그룹바이하고, reponse로 통계량 내라 ! 이런말임.
# response는 콜레스테롤 감소 량이므로, drugE가 가장 많이 감소됨.
detach(cholesterol) 

fit.aov <- aov(formula = response ~ trt, data = cholesterol)
fit.aov
anova(fit.aov) # 결과 차이 유의함 ! 

# --------------------------
# 여러 집단의 평균을 시각화해주는 것 ! 
library(gplots)

plotmeans(formula = response ~ trt, data = cholesterol,
          main = '', xlab = 'drug and times', ylab = 'response')
anova(fit.aov)
TukeyHSD(fit.aov) # Tukey의 평균 다중 비교 
# 하한, 상한 추정량도 나옴. (95% 신뢰구간)


fit.mcp <- TukeyHSD(fit.aov)
names(fit.mcp)
plot(fit.mcp)
par(las=2) # 가로로 눕힘.

# -------------------------
# 6. 평균의 다중비교 수행 - 2
# -------------------------
library(multcomp)
fit.glht <- glht(fit.aov, 
                 linfct = mcp(trt = 'Tukey'))
dev.off() # 그림이 그려지는 영역 삭제 (이전 그림 영역 설정들 reset)

par(las = 1)
par(mar = c(5,6,7,2))

plot(cld(fit.glht, level = .95) ) # 95% 신뢰구간.
# compact letter display 의 준말. 