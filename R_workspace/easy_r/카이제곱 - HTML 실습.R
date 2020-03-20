# 카이제곱 - HTML 파일 실습
# 파일명 : 4.-Chi-square.test.html



library(ggplot2)

data(mpg)
mpg<- as.data.frame(mpg)
str(mpg)

library(MASS)
data(survey)
str(survey)

library(prettyR)

xtab(formula = ~fl + drv, data = mpg) # show frequency and ratio

(crosstab <- xtabs(formula = ~fl+drv, data = mpg)) # show only frequency

(crosstab2 <- table(survey$W.Hnd)) # 글씨를 쓰는 손의 빈도표 생성. 


chisq.test(crosstab, correct = TRUE) #독립성 검정

chisq.test(crosstab2, p = c(.3, .7)) # 비율검정(적합도 검정?)
# 적합도 검정 결과 귀무가설을 채택함.

## alternative : 'greater', 'less', 'two-sided' (default)
fisher.test(crosstab, alternative = 'two.sided') # 양측 검정
fisher.test(crosstab, alternative = 'greater') # 우측 단측 검정
fisher.test(crosstab, alternative = 'less') # 좌측 단측 검정
# 모두 p-value는 같게 나옴.

# 공분산(covariance) - 독립성 검정 
# 두 확률변수가 얼마나 함께 변화하는지 측정
# 한 변수가 커질 때, 다른 변수가 함께 커지거나 한 변수가 작아질 때, 다른 변수가 함께 작아지는 것과 같이, 크기변화의 방향이 같다면, 공분산은 양의값을 가짐
# 한 변수가 커질 때, 다른 변수가 작아지거나 한 변수가 작아질 때, 다른 변수가 커지는 것과 같이, 크기변화의 방향이 다르다면, 공분산은 음의값을 가짐
# 만약 두 변수의 값이 서로 상관없이 변한다면, 공분산은 0 임

library(ggplot2)
data(mpg)

with(data = mpg, expr = {
  cov(x = cty, y= hwy)
}) # 0에 가까울수록 독립적임. 0보다 큰 값이면 점점 같은방향으로 움직임.


cov(x = 1:5, y = 5:1) # 임의의 벡터로 공분산 검정. 결과는 음의 값

cov(x = 1:5, y= c(1,3,1,2,0))

cov(x = 1:5, y = c(4,4,4,4,4))
