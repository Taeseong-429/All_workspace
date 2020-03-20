# 세번째 응용: One-way ANCOVA
#  요인 1개, 공변량 1개

# 사용할 데이터 셋: litter{multcomp}
library(multcomp)


# 분산분석에서, 교란요인(잡음변수)은 공변량(covariate)인데,
# 공변량에서, 공분산을 계산하도록 되어있습니다. -->
# 교란요인 변수의 유형은, 양적변수입니다.
# dose (factor), gesttime(covariate), weight(종속변수)
head(litter)

data("litter", package = 'multcomp')
attach(litter)

library(prettyR)
freq(dose)

aggregate(weight, by=list(dose), mean)

fit.aov <- aov(formula = weight ~ gesttime + dose, data = litter)
fit.aov
names(fit.aov)

# anova(fit.aov)
summary(fit.aov)


# 공변량(교란요인)이 추가되어 있을 때에는,
# 소위 "수정된(교란효과를 제외한 순수한) 집단평균"을 구해야 함!!!!(*주의*)
library(effects)

# effect{effects} 함수를 통해, 순수한 집단평균을 구함
# 즉, 공변량의 효과를 제거한 순수한 집단의 평균을 의미함
effect("dose", fit.aov)


# 사후분석: 평균의 다중비교
library(multcomp)

contrasts <- rbind("비투약그룹 대 투약그룹"= c(3, -1, -1, -1))
contrasts
class(contrasts)

df_contrasts <- as.data.frame(contrasts)
df_contrasts

# 분석가가 원하는 가설대로(즉, 현재같은 경우는,
# 비약물투여집단과 약물투여집단간의 평균의 차이를 검정)
# 평균의 다중비교를 수행할 수있음.
# 이때 조건은, 분석가가 검정하고자하는 대조군을 벡터로
# 만들어서 지정하면 됨(즉, constrasts = c(3, -1, -1, -1)처럼)
fit.glht <- glht(fit.aov, linfct=mcp(dose=contrasts))
fit.glht

summary(fit.glht)



# 위의 분석결과를 과연 신뢰할 수 있는가???
# 담보물: 분산분석의 가정(Assumptions) 충족여부
# (1) 정규성, (2) 등분산성을 충족해야 함
# 
# 문제는, 공변량이 포함된 ANCOVA 의 경우에는, 가정이
# 한개가 더 추가됨
# 즉, (3) 회귀방정식의 기울이(slope)가 각 집단별로 동일해야 함

library(multcomp)

# 회귀방정식의 기울기의 동등성을 검정하기 위해서는,
# 요인이 만들어내는 각 집단에 대해, 상호작용효과(gestttime * dose)를
# ANCOVA 모델에 추가해야 함!!! (*주의*)
#
# 이것이 의미하는 바는 결국, 상호작용이 통계적으로 유의미하다면,
# 투여시간(gesttime)과 출산시체중(weight) 과의 관계가, 약물투여량(dose)에
# 따라, 다르게 나타남을 의미함!!!! (*주의*)

# formula = weight ~ gesttime + dose + gesttime:dose
fit2.aov <- aov(formula = weight ~ gesttime * dose, data = litter)
summary(fit2.aov)

dev.off()

library(HH)
ancova(weight ~ gesttime + dose, data = litter)





