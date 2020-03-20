# 반복측정 ANOVA (Repeated Measure ANOVA)
# 실험설계 조건:
#  (1) 1개의 집단간 요인 (Between-groups factor)
#  (2) 1개의 집단내 요인 (Within-groups factor)
#
# 분석할 데이터셋: CO2{datasets}
# 변수정보:
#   (1) Plant - 서열(개별 Plant의 고유식별자)
#   (2) Type - 범주(Plant의 서식지- Quebec, Mississippi)
#   (3) Treatment - 냉해/비냉해 처리
#   (4) uptake - CO2 섭취량
#   (5) conc - CO2 농도

data(CO2, package = 'datasets')

head(CO2)
View(CO2)

str(CO2)

table(CO2$conc)
table(CO2$Type)
table(CO2$Treatment)

# 요인역할을 할 변수는, 
# factor  타입으로 변환하자!!!(분산분석할 때)
CO2$conc <- factor(CO2$conc)

# ANOVA 대상 요인선정
# (1) conc (집단 내 요인)  (2) Type (집단 간 요인)

# 종속변수 선정: uptake


# 냉해의 영향을 받는 식물만 분석대상으로 뽑자!!!
wlbl <- subset(CO2, Treatment=='chilled')
View(wlbl)

# 1개의 집단 내 요인을 공식으로 지정하는 방식에 집중
# fit.aov <- aov(formula = uptake ~ conc  Type + Error(Plant/(conc)))

# 집단 간 요인의 개체수가 일정(Balanced Design)
fit.aov <- aov(
    formula = uptake ~ Type * conc + Error(Plant/conc), 
    data = wlbl
)

fit.aov

# anova(fit.aov)
summary(fit.aov)



attach(wlbl)

  dev.off()  # plot area 초기화
  
  # 분산분석 결과 시각화 - 1
  # 사후분석으로, 평균의 다중비교법을 하지 않더라도
  # 아래의 시각화 결과로, 어느집단간에 종속변수의
  # 평균의 차이가 얼마나 나는지, 좀 더 직관적으로
  # 알 수 가 있음
  interaction.plot(
    conc, Type, uptake, type='b',
    col = c('red','blue'), 
    pch = c(16, 18)
  )
  
  # 분산분석 결과 시각화 - 2
  # 사후분석으로, 평균의 다중비교법을 하지 않더라도
  # 아래의 시각화 결과로, 어느집단간에 종속변수의
  # 평균의 차이가 얼마나 나는지, 좀 더 직관적으로
  # 알 수 가 있음
  boxplot(
      uptake ~ Type*conc, data = wlbl,
      col = c('red', 'green')
      # main = '- Main -',====
      # xlab = ,
      # ylab = 
    )


detach(wlbl)


