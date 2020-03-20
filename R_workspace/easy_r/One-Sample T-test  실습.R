# One-Sample T-Test (parametric)
# 파일명 6-1.-One-Sample-T-test.html


# We want to know, if the average weight of the mice differs from 25g?

set.seed(1234)

(my_data <- data.frame( name = paste0( rep('M-', 10), 1:10 ), weight = round( rnorm(10, 20, 2), 1) ) ) #이거 잘 이해하기.
# 생쥐의 이름을 M1 부터  M10까지 무작위로 열개의 값 추출해서 무게로 삼기.
# 데이터 프레임 만드는 방법 
# rep 는 반복함수, rnorm은 랜덤..


library(dplyr, quietly = TRUE)
sample_n(tbl = my_data, size = 10, replace = FALSE)

summary(my_data$weigh)

ggboxplot(
  my_data$weight,
  ylab = 'Weight (g)',
  xlab = FALSE,
  ggtheme = theme_minimal()
)

# 정규성 검정 먼저.
# 1)
shapiro.test(my_data$weight) # 귀무 채택. 정규분포 따름.
ggqqplot(my_data$weight, ylab = "Mne's weight", ggtheme = theme_minimal()) #이것도 그림을 정규성 확인.

# 정규성 검정 하고 이제 T test
(res <- t.test(my_data$weight, mu = 25) ) # 유의확률 무지 작음.
# 대립가설 채택 ! 귀무 기각.


## 하다가 나 졸아서 2장으로 넘어감
## 6-2.-One-Sample-Wilcoxonn-Signed-Rank-Test.html


(my_data <- data.frame(
  name = paste0(rep('M-',10), 1:10),
  weight = round(rnorm(10,20,2),1)))

sample_n(tbl = my_data, size = 10, replace = FALSE)

ggboxplot(my_data$weight, 
          ylab = "Weight (g)", 
          xlab = FALSE,
          ggtheme = theme_minimal())

(res <- wilcox.test(my_data$weight, mu = 25)) # 귀무가설 기각.

res$p.value


