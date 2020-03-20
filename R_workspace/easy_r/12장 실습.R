### 12장 인터랙티브 그래프

## 12-1. plotly패키지로 인터랙티브 그래프 만들기
# 인터랙티브 그래프 만들기

# 패키지 준비하기
install.packages('plotly', dependencies = T)
library(plotly)

# ggplot으로 그래프 만들기
library(ggplot2)
a <- ggplot(data = mpg, aes(x = displ, y = hwy, col = drv)) + geom_point()
a
# 인터랙티브 그래프 만들기
ggplotly(a)
# ??mpg  displ 은 배기량

# 인터랙티브 막대 그래프 만들기
# p <- ggplot(data = diamonds, aes(x = cut, fill = clarity)) +
#  geom_bar()
p <- ggplot(data = diamonds, aes(x = cut, fill = clarity)) + 
  geom_bar(position = 'dodge')
# position dodge 안쓰면 등급에 따라 구분되지 않고 모두 쌓여있음. 그래서 이걸 나눠주는게
# 포지션 닷지임.

# str(diamonds) # 타입 보니까 cut. colorl clar 이건 순서 범주형 변수임 ! 
# clarity 는 투명도를 의미

p
ggplotly(p)
?? diamonds
View(diamonds)



## 12-2. dygraphs 패키지로 인터랙티브 시계열 그래프 만들기기
## 인터랙티브 시계열 그래프 만들기

# 패키지 준비하기
install.packages('dygraphs', dependencies = T)
library(dygraphs)

# 데이터 준비하기
economics <- ggplot2::economics
head(economics)
??economics
str(economics)
# 시간 순서 속성을 지니는 xts 데이터 타입으로 변경
library(xts)

eco <- xts(economics$unemploy, order.by = economics$date)
class(eco)
str(eco)
# unemploy 데이터를 정렬해서 시계열 데이터로 만들어라. (date 변수로)
head(eco) # 행 이름이 날짜정보를 담고있는 이름이 됨.

# 인터랙티브 시계열 그래프 만들기
# 그래프 생성
dygraph(eco)

# 날짜 범위 선택 기능
dygraph(eco) %>% dyRangeSelector() # 아래쪽에 축 선택 가능한거 볼 수 있음. 특정구간 쉽게 볼 수 있음.

# 여러 값 표현하기

# 저축률
eco_a <- xts(economics$psavert, order.by = economics$date)

# 실업자 수
eco_b <- xts(economics$unemploy/1000, order.by = economics$date)
# 들어가서 실업자 unemploy 관련 뜻 보니 number of unemployed in thousands, 이거.
# 이건 실업자 단위 천명으로 되어있으니까, 1000으로 나눠서 위에 저축률이랑 맞춰준거.
View(eco_b)

# 합치기
eco2 <- cbind(eco_a, eco_b) # 데이터 결합합
View(eco2)
colnames(eco2) # 이 함수에 값 지정하면 변수 이름 바꾸는거임.
rownames(eco2)
colnames(eco2) <- c('psavert', 'unemploy') # 변수명 바꾸기
View(eco2)

# 그래프 만들기
dygraph(eco2) %>% dyRangeSelector()
