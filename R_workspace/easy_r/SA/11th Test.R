# Test

# 3.
(1)

library(ggplot2)

df_mpg <- ggplot2::mpg
View(df_mpg)
df_mpg <- as.data.frame(df_mpg)

df_mpg_diff <- df_mpg %>%
  filter(class %in% c('compact', 'suv')) %>%
  select(class,hwy)

df_mpg_diff %>% 
  group_by(class) %>% 
  summarise(mean_hwy = mean(hwy))

# (2) 그림 확인 후 T Test
ggplot(df_mpg_diff, aes(x = class, y = hwy))+ geom_boxplot()

t.test(data = df_mpg_diff, hwy~class, var.equal = T)

# (3) 검정 결과
# H0: suv, compact 두 종류의 차종에 대해 고속도로 평균 연비 차이가 없다.
# H1: suv, compact두 종류의 차종에 대해 고속도로 평균 연비 차이가 있다.

# boxplot으로 봤을 때, 차이가 있을 것이라 가정할 수 있다.
# p-value < 2.2e-16 이므로 유의수준 0.05에서 귀무가설은 기각되고, 대립가설은 채택된다. 따라서 suv, compact 두 종류의 차종에 대해 고속도로 평균 연비에 차이가 있다고 할 수 있다.
# 통계적으로 유의미하다



# 4.

# (1)

ecnonomics <- ggplot2::economics
View(economics)

# (2) 그림 확인 후 상관분석
ggplot(economics, aes(x = unemploy, y = pce)) + geom_point()

cor.test(economics$unemploy, economics$pce)

# (3) 검정 결과

# 상관계수 0.6145176 이므로 양의 상관관계가 있다고 할 수 있다.
# p-value < 2.2e-16 이므로 유의수준 0.05에서 귀무가설은 기각되고, 대립가설은 채택된다. 따라서 두 변수간에 양의 상관관계가 있다고 할 수 있다. 통계적으로 유의미하다.











