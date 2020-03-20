# 시계열 # 

library(dplyr)
class(analysis_total)
View(analysis_total)

colnames(analysis_total)

analaysis_발생 <- analysis_total %>% group_by(일시) %>% summarise(발생건수합 = sum(발생건수)) 

View(analaysis_발생)

tanalysis_발생 <- ts(analaysis_발생$발생건수합,
                frequency = 365, 
                start = c(2016,1),
                end = c(2019,1))

View(tanalysis_발생)

tanalysis_평균 <- ts(analysis_total$평균기온..C., 
                   frequency = 365, 
                   start = c(2016,1), 
                   end = c(2018,12))

a <- analysis_total %>%  group_by(일시) %>% summarize(x = sum(발생건수))
library(forecast)
plot(ma(tanalysis_발생, 21))

dev.off()
par(mfrow = c(2,2))

plot(tanalysis_발생)
plot(tanalysis_평균)

fit <- stl(tanalysis_발생, s.window = 'periodic')
fit2 <- stl(ma(tanalysis_발생, 100), s.window = 'periodic')
plot(fit)
fit$time.series
# =====
## 가법/승법 모델 확인 (예시 이용)
plot(AirPassengers)

logaAirPassengers <- log(AirPassengers)
plot(logaAirPassengers)
