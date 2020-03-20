# 3.

df_mpg <- ggplot2::mpg
df_mpg <- as.data.frame(df_mpg)

df_mpg_diff <- df_mpg %>% 
  select(class, hwy) %>% 
  filter(class %in% c('suv', 'compact'))

View(df_mpg_diff)

df_mpg_diff %>% 
  group_by(class) %>% 
  summarise(mean_hwy = mean(hwy))

t.test(data = df_mpg_diff, hwy~class, var.equal = T)

H0 : 두 차종에 대해 고속도로 연비 차이가 없다.
H1 : 차이가 있다

유의수준 0.05에 대해 유의확률(p-value)이 2.2e-16 보다 작ㅇ므로  귀무가설을 기각하고 대립가설을 채택한다.
따라서 유의수준 0.05에 대하여 두 차종의 고속도로 평균 연비에 차이가 있다고 할 수 있다.
library(ggplot2)
ggplot(df_mpg_diff, aes(x = class, y = hwy)) + geom_boxplot()

# 4.

ecnonomics <- ggplot2::economics

cor.test(ecnonomics$unemploy, economics$pce)

상관계수 = 0.6145176

두 변수간에 양의 상관관계가 있다고 할 수 있다.

유의확률(p-value) < 2.2e-16 이므로 귀무가설을 기각, 대립가설 채택한다. 따라서 두 변수 간에 상관관계가 있다고 할 수 있다.