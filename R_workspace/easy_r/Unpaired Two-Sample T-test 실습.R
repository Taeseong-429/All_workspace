# Unpaired Two-Samples T-test
# 파일명 6-3.-Unpaired-Two-Samples-T-test.html

# 두 그룹이 독립적이어야 함. 관련이 없어야함

# 두 그룹이 정규분포를 따라야함. shap ~ 이걸로 검정
# 두 그룹의 분산이 같아야함. 등분산이어야함. F-test 검정 !! 이게 var.test 검정하는거.

# 기본은 양측검정
t.test(x, y, alternative = 'two.sided', var.equal = FALSE) # 등분산성은 디폴트 False
# 등분산성을 알 수 없는 경우는 그냥 이렇게 False를 주거나 아무것도 안씀


# 데이터 만들기
women_weight <- c(38.9, 61.2, 73.3, 21.8, 63.4, 64.6, 48.4, 48.8, 48.5)
men_weight <- c(67.8, 60, 63.4, 76, 89.4, 73.3, 67.3, 61.3, 62.4)
(my_data <- data.frame(
                      group = rep(c('Woman', 'Man'), each = 9), # 반복할 횟수.
                      weight = c(women_weight, men_weight)
)) # 두개의 벡터를 생성하고 9개 나열.. 데이터프레임으로 만들기.


# 여성의 평균몸무게와 남성의 평균몸무게가 같은가 ?
# 기술통계량으로 남성의 평균몸무게, 여성의 평균 몸무게 구하기
group_by(my_data, group) %>% 
  summarise(
    count = n(),
    mean = mean(weight, na.rm = TRUE),
    sd = sd(weight, na.rm = TRUE)) ## 이렇게 dplyr 패키지 안써도 기술통계량 빨리 구하는법 파일 0번에 있다고 하는데 확인해보자. summary 인가 ? 
# sapply 인듯 ~! 
# by, aggregate 도 있음.
# 사용법 : example(aggregate) 해서 보거나, ?aggregate 해서 볼 수 있음.
sapply(my_data[,2], mean)
aggregate(my_data)
# 그림으로 확인하기
library(ggpubr)

ggboxplot(my_data, x = 'group', y = 'weight',
          color = 'group', palette = c('#00AFBB', '#E7B800'),
          ylab = 'Weight', xlab = 'Groups') # 이미 남성, 여성 독립적으

with(my_data, shapiro.test(weight[group == 'Man'])) #판다스의 불린추출
# group는 벡터, man은 스칼라. 남성에 대한 체중 변수의 정규성 검정임.
# 귀무가설 채택. (정규성을 갖는다)
with(my_data, shapiro.test(weight[group == 'Woman']))
#여성의 체중 변수에 대한 정규성 검정. 귀무가설 채택(정규성을 따른다)

(res.ftest <- var.test(weight ~ group, data = my_data)) # F 검정.
# 귀무가설 채택. 분산은 같다 ~! 만족. 

# 이 3가지 만족시켰으니 t test 사용가능

# t test 진행
(res <- t.test(women_weight, men_weight, var.equal = TRUE)) # 등분산 확인 했기 때문에 TRUe
# p-value 작으니 귀무가설 기각. 대립가설 채택. 귀무가설 : 두 그룹의 평균 차이 없다.
# 귀무가설 기각했으니, 남성 여성 평균 몸무게 차이가 있다 ! 

# 6-3 끝끝
