# SA 통계학 실습 2

# test <- read.csv(file.choose()) # 이거 test 파일 불러옴.

ch2_discrete <- as.data.frame(ch2_discrete)


### 빈도 분석

freq(ch2_discrete) # 빈도, 백분율 계산

describe(ch2_discrete) # 빈도, 백분율 계산.

prettyR::describe(ch2_discrete) # 설명 ? 
# 범주 값을 보여주고, 빈도수 보여주고 상대도수 보여주고
# mode가 나옴. 최빈값 ! 

mpg
mpg[ , c(1,2) ] # 내가 원하는 행 열 추출 !! 문법 외우기 
# 이건 빠르게 추출하는 방법임. 원래는 select로
df_mpg <- ggplot2::mpg

freq(df_mpg[, c(1,2,4)])
freq(df_mpg[c(7,10)]) # drv 의 범주형 변수 갯수와 총 관측치 갯수 보여줌 # 5개 연료 각 5개도 더하면 관측치 갯수 볼 수 있음

prettyR::describe(df_mpg[ , c(1,2,4)])

test <- read.csv(file.choose()) # 이거 test 파일 불러옴.
# 여기선 ch2_~~~ 파일 불러옴

### 교차 분석  <- 범주형 변수는 교차 분석이 핵심 !! 

xtab(~product+gender, data =  ch2_discrete)
# 이 결과 나오는 p value는 카이제곱 검정이 됨 .
# 두 변인이 서로 상관이 있는지 없는지 ~ 독립적인지 !! 
xtab(~product+area, data =  ch2_discrete) # 이건 제품과 국가 간의 교차검증. p value는 어느정도 크므로 귀무가설. 근데 아래 읽어보니 올바르지 않을수도 있다는 경고문 나옴.
xtab(~gender+area, data =  ch2_discrete) # 오른쪽에 오는게 독립변수수


### 산포도 계산 ! 

range(mpg$cty)
randu(mpg$hwy)
IQR(mpg$cty) # 연속형 변수의 사분위수를 보여줌

### 왜도 구하기
install.packages('moments', dependencies = T)
library(moments)


# 왜도 > 0: 왼쪽 꼬리
# 왜도 < 0: 오른쪽 꼬리
skewness(mpg$hwy)
hist(mpg$hwy, freq = F, breaks = 30)
lines(density(mpg$hwy), col = 'red', lwd = 2)

skewness(mpg$cty)
hist(mpg$cty, freq = F, breaks = 30)
lines(density(mpg$cty), col = 'red', lwd = 2)
# 아래 cty 값이 더 크므로 더 오른쪽 꼬리 된다는 뜻!!

### 첨도 구하기
kurtosis(mpg$cty)
# 3번 자료 불러서 사용
kurtosis(ch3_continuos$incom)
hist(ch3_continuos$incom, freq = F, breaks = 30)
lines(density(ch3_continuos$incom), col = 'red', lwd = 2)
# 첨도 = 3 : 정규분포
# 첨도 < 3 : 옆으로 퍼짐.
# 첨도 > 3 : 뾰족해짐

### 연속형 변수(데이터)에 대한 기본 명령어
length(ch3_continuos$incom) # 표본 갯수
length(ch3_continuos) # 변수의 갯수
mean(ch3_continuos$incom) # 평균
var(ch3_continuos$incom)
sd(ch3_continuos$incom)
max(ch3_continuos$incom)
min(ch3_continuos$incom)
median(ch3_continuos$incom)
quantile(ch3_continuos$incom, probs = seq(0,1, .1)) # probs지정하며 내가 정한 비율 보여줌.
cor(mpg$hwy, mpg$cty) # 상관관계 검정         
cov(mpg$hwy, mpg$cty) # 공분산 보여줌
summary(mpg)
stem(mpg$cty) # 줄기, 잎 표현해서 몇개 있는지 보여줌. 즉 텍스트 방식의 히스토그램이라 생각하면 됨. 분포를 보여줌
scale(mpg$cty) # mpg의 cty값을 표준화 하기 위함.자료형이 매트릭스 형으로 달라짐. 평균이 0이고 분산이 1인 형태로 바꿔줌.
x <- scale(mpg$cty)
class(x)
x <- as.data.frame(x)
x <- x$V1
str(x)
mean(x) # 정규화해서 변수로 담아 평균을 구해보니 평균이 0이고, 분산이 1이 됐음
var(x) 
hist(x, freq = F, breaks = 30) # 한번 그려봄. 분포곡선도
lines(density(x), col = 'red', lwd = 2) # 표준화 시킨 결과

shapiro.test(mpg$cty) # 원래 cty 값의 정규성 검증
shapiro.test(x) # 표준화 한 값의 정규성 검증. p value는 같게 나옴.

boxplot(x) # 극단치 있음. 이상값 때문에 나오는듯.

# 표준화 : 단위를 떼고 두 값을 비교하기 위해 사용
# 원래 갖고 있는 값을 평균을 0으로 분산을 1로 만들어줌 ! 단위가 떼어짐.

skew(x)
kurtosis(x)

### -------------------------------------------------
# 연속형 변수(데이터)의 이상치(outlier)확인
# boxplot(mpg$cty ~ mpg$fl)
boxplot(cty ~ drv, data = mpg, col ='salmon')
 