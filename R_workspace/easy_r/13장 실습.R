### 13장 실습.

# 앞에 통계 내용은 안씀

# compact 자동차와 sub 자동차의 도시 연비 t 검정
# 데이터 준비
mpg <- as.data.frame(ggplot2::mpg)

library(dplyr)
mpg_diff <- mpg %>% 
  filter(class %in% c('compact', 'suv')) %>% 
  select(class,cty)
  
View(mpg_diff)

summary(mpg_diff %>% filter(class %in% 'compact')) # suv 차량과 compact 차량의 도시연비 기술통계량
summary(mpg_diff %>% filter(class %in% 'suv'))
#mpg_diff %>% 
 # group_by(class) %>% 
  #summarise(mean_cty = mean(cty)) 위에 도시연비 기술통계량 구한거랑 같은 뜻.

summary(mpg)

table(mpg_diff$class)

boxplot(mpg_diff$cty, col = 'yellow') # cty
boxplot(mpg$cty, mpg$hwy, col = 'lightgray') # hwy

boxplot(data = mpg_diff, cty ~ class, col = 'lightgray')

class_cty <- mpg_diff %>% 
  group_by(class) %>% 
  summarise(mean_cty = mean(cty))

View(class_cty)



# 여기까지 책에 없는 내용 많이 했음

# t-test 

t.test(data = mpg_diff, cty ~ class, var.equal = T)


# 일반 휘발유와 고급 휘발유의 도시 연비 t 검정
# 데이터 준비 # 내가 검정하려는 변수가 무슨 분포를 따르는지 먼저 보기
mpg_diff2 <- mpg %>% 
  filter(fl %in% c('r', 'p')) %>% 
           select(fl,cty)
mpg_diff2         

library(ggplot2)
hist(mpg_diff2$cty, freq = F, breaks = 50)
lines(density(mpg_diff$cty), col = 'red', lwd = 2)

library(e1071)
skewness(mpg$cty) # 왜도 계산. 양수면 꼬리분포 위치가 플러스 방향.
# 마이너스는 꼬리가 마이너스 방향.
