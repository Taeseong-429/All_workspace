# Unpaired Two-Samples Wilcoxon Test (non-parametric)
# 비 모수적인 방법
# 파일명 : Unpaired Two-Samples Wilcoxon Test (non-parametric)


women_weight <- c(38.9, 61.2, 73.3, 21.8, 63.4, 64.6, 48.4, 48.8, 48.5)
men_weight <- c(67.8, 60, 63.4, 76, 89.4, 73.3, 67.3, 61.3, 62.4)

(my_data <- data.frame(
                group = rep(c('Woman', 'Man'), each = 9),
                weight = c(women_weight, men_weight)
))

# 원래 파일에는 그림도 그려보고 하지만, 수업땐 그림 안그리고 바로 계산함.

(res <- wilcox.test(women_weight, men_weight)) # 귀무가설 기각. 대립가설 채택
# 몸무게 차이가 있다 ! (독립이다)
# wilcox 검정 : 비모수적 통계분석방법. 유의미한 차이가 있냐에 대한 검정.
# 30명 이하의 자료일 떄 매우 유용한 방법.
# 비모수 : 정규 분포를 가정하지 않음. 중위수로 비교 !! 

(res <- wilcox.test(weight ~ group, data = my_data, exact = FALSE))
# 위에 방법과 같음. 귀무가설 기각. (이건 formula 로 한거)