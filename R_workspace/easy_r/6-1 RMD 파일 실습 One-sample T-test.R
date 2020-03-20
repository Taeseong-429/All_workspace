# 6-7 
library(dplyr)

my_data <- PlantGrowth

class(my_data)
str(my_data) # 데이터 확인
head(my_data)

# 데이터 셋에 있는 표본으로 만들기
set.seed(1234)
dplyr::sample_n(my_data, 10)

# 레벨 보기
levels(my_data$group)

# group에 있는 3개의 변수는 순서를 갖는 변수니까 ordered로 정렬
my_data$group <- ordered(my_data$group, levels = c('ctrl', 'trt1', 'trt2'))

# dplyr 패키지로 그룹바이 후 계산

group_by(my_data, group) %>% 
  summarise(
    count = n(),
    mean = mean(weight, na.rm = TRUE),
    sd = sd(weight, na.rm = TRUE)
  )

# 박스플롯 그리기. # 이 시각화된 걸로 평균 차이 판단할 수 있는가 .. 
library('ggpubr', quietly = TRUE)

ggboxplot(my_data,
          x = 'group',
          y = 'weight',
          color = 'group',
          palette = c('#00AFBB', '#E7B800', '#FC4E07'),
          order = c('ctrl', 'trt1', 'trt2'),
          ylab = 'Weight',
          xlab = 'Treatment'
          )


# Mean plots
ggline(my_data,
       x = 'group',
       y = 'weight',
       add = c('mean_se', 'jitter'),
       order = c('ctr1', 'trt1', 'trt2'))


# plotmeans 이게 가장 좋은 듯 !!! 
library('gplots', quietly = TRUE)

plotmeans(weight ~ group,
          data = my_data,
          frame = FALSE,
          xlab = 'Treatment',
          ylab = 'Weight',
          main = 'Mean Plot with 95% Cl')

# 


## 1. Tukey multiple pairwise
res.aov <- aov(weight ~ group, data = my_data)
summary(res.aov)

TukeyHSD(res.aov)

## 2. multiple comparisons
library(multcomp, quietly = TRUE)

summary(glht(res.aov, linfct = mcp(group = 'Tukey')))

## 3. Pairewise t-test
pairwise.t.test(my_data$weight, my_data$group, p.adjust.method = 'BH')


############################################
# 여기서부턴 따라하는 실습

my_data <- PlantGrowth
fit.aov <- aov(weight ~ group, data = my_data)

# 예측값을 구하는 fitted 함수
fitted(fit.aov)
fit.aov$fitted.values # 이거해서 나오는 값이 y의 햇 (추정값)
# 원래 값은 weight 변수로 갖고 있다.

y_hat <- fitted(fit.aov) # 이게 추정값(y 햇)
y <- my_data$weight # 이게 진짜 값

myresiduals <- y - y_hat # 잔차 값 구하기. (벡터연산)
myresiduals # 이 값도 이미 피팅된 모델 안에 들어있음

names(fit.aov) # 여기 안에 residuals 안에 들어있음.
fit.aov$residuals
# 실제 검정 대상은 잔차임. 잔차 가지고 정규성 검정해야함 ! ! ! 
