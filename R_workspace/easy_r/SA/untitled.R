# 1.
# (1)
df_mpg <- ggplot2::mpg
library(dplyr)
head(df_mpg)
df_mpg <- as.data.frame(df_mpg)

df_mpg_diff <- df_mpg %>% 
  select(class, cty) %>% 
  filter(class %in% c('compact', 'suv')) 
  
df_mpg_diff %>% 
  group_by(class) %>% 
  summarise(mean_cty = mean(cty))

table(df_mpg_diff$class)

#----
# (2).
t.test(data = df_mpg_diff, cty ~ class, var.equal = T)

# H0 : 평균 연비의 차이가 없다
# H1 : 평균 연비의 차이가 있다.

# (3).
# 유의확률(p-value)이 유의수준 0.05에 비해 매우 작으므로, 귀무가설을 기각하고 대립가설을 채택한다. 5% 유의 수준에서 두 차종의 연비 차이가 있을 수 있다.

# ------------------------------
# 4.

# (1)
economics <- as.data.frame(ggplot2::economics)

cor.test(economics$unemploy, economics$pce)

# (2) 
# 상관계수 값 0.61455176 으로 두 변수 간 양의 상관 관계가 있음을 짐작할 수 있다.

# (3) 
# 상관분석 결과 유의확률(p-value)이 2.2e-16보다 작으므로, 유의수준 0.05보다 매우 작은 것을 알 수 있다. 귀무가설을 기각하고 대립가설을 채택한다. 두 변수간의 상관관계가 통계적으로 유의미하다 할 수 있다.