df_2016 <- read.csv('C:/app/R/RStudio/Teamproject/기상관측2016real_Fixed.csv', encoding = 'cp949')

library(ggplot2)

hist(df_2016$평균기온..C., freq = F, breaks = 50)
lines(density(df_2016$평균기온..C.), col = 'red')

df_dust <- read.csv('C:/app/R/RStudio/Teamproject/fine_dust_data.csv', encoding= 'cp949')

str(df_dust)

hist(df_dust$PM10, freq = F, breaks = 50)
lines(density(df_dust$PM10), col = 'blue')

hist(df_dust$PM25, freq = F, breaks = 50)
