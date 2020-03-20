
#-----------------------------------------------------------
# One-way ANOVA (일원분산분석) 수행 및 평균의 다중비교 분석
#-----------------------------------------------------------

# cholesterol{multcomp} 데이터셋 사용.
library(multcomp)

# 데이터셋에 대한 기본적 탐색 수행.
cholesterol
View(cholesterol)

# trt 범주형변수(=요인, factor)의 그룹개수와 빈도수/비율확인
library(prettyR)

freq(cholesterol$trt)  # freq{prettyR}

# trt 요인의 집단별 평균(response) 구하기
# 아래코드는, 매번 변수접근시 dataframe$를 붙여주어야 하니 불편함
# aggregate(cholesterol$response, by=list(cholesterol$trt), FUN = mean)


# cholesterol 데이터 셋을, 현재 실행환경에 붙임
# Global Environment 확인
# 이렇게 실행환경에 한번 붙인 데이터셋은, 변수접근시
# dataframe$를 붙일 필요가 없이, 변수명만으로 접근가능
attach(cholesterol)
#-------------------------------------------------


#-------------------------------------------------
# 1. 각 집단별 평균 집계통례량 구하기
#-------------------------------------------------
# aggregate(분석대상연속형변수, by=groupby기준변수지정, FUN=각 그룹에 적용할 함수)
aggregate(response, by=list(trt), FUN=mean)

# tapply(분석대상연속형변수, 요인변수, 각 그룹에 적용할 함수)
tapply(response, trt, mean)


#-------------------------------------------------
# 2. One-way ANOVA 수행 (일원분산분석) - 요인이 하나!!!
#-------------------------------------------------
# aov{stats} function 으로 분산분석 수행
# 수행결과, 분석가가 지정한 formula대로 model fitting
fit.aov <- aov(response ~ trt, data = cholesterol)
fit.aov

# 적합된 모델객체에는 다양한 속성이 있음
names(fit.aov)
# 특정 속성에 접근하는 방법: fitted_model$속성이름
fit.aov$coefficients


#-------------------------------------------------
# 3. 아래 둘 중 하나 함수로 검정통계량 검정수행
#-------------------------------------------------

# fitted model의 검정통계량 출력 - 1
anova(fit.aov)

# fitted model의 검정통계량 출력 - 2
summary(fit.aov)


#-------------------------------------------------
# 4. 집단별 평균 시각화
#-------------------------------------------------
# 시각화 결과는, 평균의 다중비교 수행결과와 동일
#-------------------------------------------------
library(gplots)

# formula 대로, 각 집단별 평균을 시각화해서 보여줌
plotmeans(formula = response ~ trt, data = cholesterol)


#-------------------------------------------------
# 5. 평균의 다중비교 수행 - 1
#-------------------------------------------------
fit.mcp <- TukeyHSD(fit.aov)

fit.mcp
names(fit.mcp)

par(las=2)
par(mar=c(5,8,4,2))

plot(fit.mcp)


#-------------------------------------------------
# 6. 평균의 다중비교 수행 - 2
#-------------------------------------------------
library(multcomp)

tuk <- glht(fit.aov, linfct=mcp(trt='Tukey'))

dev.off()

par(las=1)
par(mar=c(5,4,6,2))

plot( cld(tuk, level = .05), col='lightgray'   )


#-------------------------------------------------
detach(cholesterol)
