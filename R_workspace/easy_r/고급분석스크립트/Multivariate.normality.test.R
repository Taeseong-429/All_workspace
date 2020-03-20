#-------------------------------------------------
# 다변량 데이터의 정규성 검정
#-------------------------------------------------
# 기존의 shapiro-Wilk test 는 단변량(1개연속형변수)
# 정규성 검정방법.

# 만일, 데이터프레임안에 있는 많은 수의 연속형변수에
# 대한 정규성 검정이 필요하다면?
# Shapiro-Wilk Test를 모든 변수에 대해 반복검정수행?

# 다변량 연속형 데이터셋에 대한 동시정규성 검정은
# "막간의 이론" 적용

#-------------------------------------------------
# 막간의 이론 (A theory interlude)
#-------------------------------------------------
# (1) 평균 μ이고 공분산행렬 Σ 인, 
# (2) p(변수개수) x 1의 정규성을 따르는 다변량 벡터 x가 있다면, 
# (3) 이 다변량 벡터 x와 평균 μ 사이의 Mahalanobis 거리의 제곱은,
# (4) p(변수개수) 자유도(df)를 가지는 χ2 분포를 따릅니다. 
# (5) 이때, Q-Q 플롯은, Mahalanobis D-제곱값에 대한, 
# (6) 표본의 χ2 분포의 Quantiles을 그래프로 표시합니다. 
# (7) 이때 데이터 포인트는, 기울기 1과 절편 0인 선을 따라,
#     분포되어있으면, 데이터가 다변량 정규성을 가지는 증거가 됩니다.
#-------------------------------------------------

( x <- mtcars )            # 양적변수로 구성된 다변량 데이터 확보

library(MASS)
UScereal

x <- UScereal[, c('calories', 'fat', 'sugars')]
View(x)

( center <- colMeans(x) )  # 각 변수별 평균(μ) 벡터

( n <- nrow(x) )           # 표본크기(n)
( p <- ncol(x) )           # 변수개수(p)
( cov <- cov(x) )          # 공분산행렬(Σ)

# Mahalanobis 거리
( d <- mahalanobis(x, center = center, cov = cov) )

# ppoints{stats} : Generates the sequence of probability points
ppoints(n)

# qchisq{stats}  : Quantile function for the chi-squared (chi^2) distribution with df degrees of freedom.
qchisq(ppoints(n), df = p)

coord <- qqplot(
            qchisq(ppoints(n), df = p),
            d,
            main='Q-Q plot assessing multivariate normality',
            xlab='qchisq(ppoints(n), df = p)',
            ylab='Mahalanobis Distance^2'
          )

abline(a=0, b=1) # 기울기 1과 절편 0인 직선추가

identify(coord$x, coord$y, labels = row.names(x))


View(x)

# 다변량 데이터의 이상치(outliers) 확인
library(mvoutlier)
( outliers <- aq.plot(x) )
