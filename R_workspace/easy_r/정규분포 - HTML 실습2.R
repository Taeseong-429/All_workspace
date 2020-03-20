# 정규분포 - HTML 실습2
# 파일명 2.-Normality_Test2.html

require(ggplot2)
data(mpg)

install.packages('DT', dependencies = T)
library(DT)

my_data <- as.data.frame(mpg, stringAsFactors = FALSE)

# 1페이지, 2페이지, 3페이지 처럼 페이지로 볼 수 있도록 출력

datatable(sample_n(my_data,size = 10, replace = FALSE))

# DT::datatable(my_data)

require(ggpubr)
ggdensity(my_data$cty,
          add = 'mean',
          color = 'red',
          fill = 'lightblue',
          alpha = .5,
          title = 'Density plot of City Milege',
          xlab = 'City Milege')

require(ggpubr)
ggqqplot(my_data$cty, color = 'red')

qqPlot(my_data$cty)

qqnorm(my_data$cty)
qqline(my_data$cty, col = 2)
