# 정규분포 - HTML 실습
# 파일명 1.-Normality_Test.html

data("ToothGrowth")
my_data <- ToothGrowth

set.seed(1234)

require(dplyr)
sample_n(my_data, size = 10, replace = FALSE) # random sampling

require(ggpubr)
ggdensity(my_data$len,
          add = 'mean', # 중위수 알고싶으면 이거 대신 median 
          color = 'red',
          fill = 'lightblue',
          alpha = .5,
          title = 'Density plot of Tooth Length',
          xlab = 'Tooth length')

# -----------------------------------
# 연속형 변수의 정규성 검정

require(car)
car::qqPlot(my_data$len)
View(my_data)

stats::qqnorm(my_data$len) # 이상치라 할만큼 눈에 잘 띔
stats::qqline(my_data$len, col = 2)

# 검정통계량으로 계산해보기, 귀무가설 : 정규성을 따른다.
# 항상 시각적인 것과 검정통계량 검정 같이 해야함.


stats::shapiro.test(my_data$len) # 

df_mpg <- ggplot2::mpg
df_mpg <- as.data.frame(df_mpg)
str(df_mpg)

# 정규성 검정 해보라했는데 이 데이터가 아니고 mtcars임 !!  
# 내장형 데이터 셋임 !! 다시해보기 !! 
stats::shapiro.test(df_mpg$hwy)
stats::shapiro.test(df_mpg$cty)

stats::qqnorm(df_mpg$hwy)



