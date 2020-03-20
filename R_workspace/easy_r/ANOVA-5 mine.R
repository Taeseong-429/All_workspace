# ANOVA-5 mine

# 반복측정 ANOVA (Repeated Measure ANOVA)
# 실험설계 조건 :
# (1) 1개의 집단간 요인 (Between-groups factor)
# (2) 1개의 집단내 요인 (Within-groups factor)
# 
# 분석할 데이터셋 : CO2{datasets}
# 변수정보 : 
#   (1) Plant - 서열변수(개별 Plant의 고유식별자)
#   (2) Type - 범주(Plant의 서식지 - Quebec, Mississippi)
#   (3) Treatment - 냉해/비냉해 처리
#   (4) uptake - CO2 섭취량
#   (5) conc - CO2 농도

data(CO2, package = 'datasets')

str(CO2)
str(CO2$Treatment)

# 요인역할을 할 변수는 
# factor 타입으로 변환하자 !!(분산분석할 때)
CO2$conc <- factor(CO2$conc)

attach(CO2)
# ANOVA 대상 요인 선정
# (1) conc (2) Type 

# 냉해의 영향을 받는 식물만 분석대상으로 뽑자 !!! 
wlbl <- subset(CO2, Treatment = 'chilled')

# 1개의 집단 내 요인을 공식으로 지정하는 방식에 집중
fit.aov <- aov(formula = uptake ~ conc * Type + Error(Plant/(conc)))

# 집단 간 요인의 개체수가 일정 (Balanced Design)
fit.aov <- aov(formula = uptake ~ Type * conc + Error(Plant/conc),
               data = wlbl)
fit.aov # 이거해서 나오는 결과  startum는 집단 내 요인 있을 때 나옴,
summary(fit.aov)


# 분산분석 결과 시각화
attach(wlbl)
  dev.off()
  interaction.plot(
    conc, Type, uptake, type = 'b',
    col = c('red', 'blue'),
    pch = c(16, 18)
  )
   
# 분산분석 결과 시각화 -2 
# 사후분석ㅇ로, 평균의 다중비교법을 하지 않더라도
  # 아래의 시각화 결과로, 어느집단간에 종속변수의
  # 평균의 차이가 얼마나 나는지, 좀 더 직관적으로 알 수 있음.
  boxplot(uptake ~ Type*conc, data = wlbl,
          col = c('red', 'green'),
          main = '- Main -')
          
detach(wlbl)
detach(ToothGrowth)  
detach(CO2)  
  