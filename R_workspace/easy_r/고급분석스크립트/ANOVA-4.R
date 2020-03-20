# 이원요인분산분석(Two-way Factorial ANOVA)
# factorial: 완전교차(*)
# 이원: 요인이 몇개? 2개

head(ToothGrowth)
View(ToothGrowth)

attach(ToothGrowth)
#-------------------------------------

# 집단별, 평균구하기(평균치아길이)
aggregate(len, by=list(supp, dose), mean)


library(prettyR)
freq(supp)
freq(dose)

table(supp, dose)

xtab(~supp+dose, data = ToothGrowth)   
xtabs(~supp+dose, data = ToothGrowth) # like table() func.


#-------------------------------------
str(ToothGrowth)

ToothGrowth$dose <- as.factor(dose)
str(ToothGrowth)

# ANOVA 수행
fit.aov <- aov(formula = len ~ supp * dose)
# fit.aov <- aov(formula = len ~ supp + dose + supp:dose)
fit.aov
anova(fit.aov)


# 분석결과 시각화 - 1 (supp와 dose 두 factor의 상호작용효과)
dev.off()
interaction.plot(
  dose, supp, len, type = 'b',
  col=c('red', 'blue'), pch=c(16, 18)
)

# 분석결과 시각화 - 2 (supp와 dose 두 factor의 상호작용효과)
library(gplots)

interaction(supp, dose, sep = '-')


plotmeans(
  formula = len ~ interaction(supp, dose, sep = '.'),
  connect = list(c(1,3,5), c(2,4,6)),
  col = c('red', 'blue'),
  main = '- Main Title -',
  xlab = 'Trt & Dose Combination'
)


# 분석결과 시각화 - 3 (주효과 + 상호작용효과 모두 시각화)
# interaction2wt{HH} 함수 이용
library(HH)

interaction2wt(len ~ supp * dose)
# interaction2wt(len ~ supp + dose + supp:dose)




#-------------------------------------
detach(ToothGrowth)


