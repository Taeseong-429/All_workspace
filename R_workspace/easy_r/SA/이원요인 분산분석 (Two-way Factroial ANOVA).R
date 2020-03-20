# 이원 요인 분산분석(Two-way factorial ANOVA)
# factorial : 완전교차(*)
# 이원 : 요인이 몇개 ? 2개

head(ToothGrowth)
View(ToothGrowth)

attach(ToothGrowth)
# 집단별, 평균구하기(평균치아길이)
aggregate(len, by = list(supp, dose), mean)

# 균형설계 되어있는지 확인 (빈도확인)
library(prettyR)
freq(supp)
freq(dose) 

table(supp, dose) # 동시에 빈도 확인하는 방법 분할표 만들기 
xtab(~supp + dose, data = ToothGrowth)
xtabs(~supp + dose, data = ToothGrowth) # like table() func.

# ----------------------------------------------
str(ToothGrowth) # dose 타입은 numm~ 이걸  팩터로 변환시켜야함

dose <- as.factor(dose)

# ANOVA 수행
fit.aov <- aov(formula = len ~ supp * dose)
fit.aov <- aov(formula = len ~ supp + dose + supp:dose) # 이거랑 바로 위에꺼랑 동일.
fit.aov
summary(fit.aov)

# 분석결과 시각화 # 요인을 나열하고, 종속변수를 뒤에 나열함. 타입은 플로팅의 유형을 지정하는 값일 뿐.
# 컬러와 포인트 모양도 두개로 지정. 
interaction.plot(dose, supp, len, type = 'b',
                 col = c('red', 'blue'), pch = c(16, 18)
                 ) # 비타민 투여량이 증가할수록 평균 치아길이가 선형적으로 증가함., 투여방식을 오렌지주스로 주었더니
                   # 비타민제로 주었을 때보다 오렌지주스 효과가 훨씬 좋음. 
