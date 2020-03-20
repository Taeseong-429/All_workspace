# 11. 지도 시각화 실습

install.packages('ggiraphExtra', dependencies = T)
library(ggiraphExtra)

# 미국 주별 범죄 데이터 준비하기
str(USArrests)
head(USArrests)

View(USArrests)
colnames(USArrests)

library(tibble)

# 행 이름을 state 변수로 바꿔 데이터 프레임 생성
crime <- rownames_to_column(USArrests, var = 'state') # 행의 이름 state 변수로 바꿔
# 데이터 프레임 생성
View(crime)

# 지도 데이터와 동일하게 맞추기 위해  state의 값을 소문자로 수정
crime$state <- tolower(crime$state)
View(crime)

# 미국 주 지도 데이터 준비하기
library(ggplot2)
states_map <- map_data('state')
str(states_map)

# 아래 두 개의 패키지를 추가로 설치해야함.
install.packages('maps', type = 'binary', dependencies = T)
install.packages('mapproj', type = 'binary',dependencies = T)

# 단계 구분도 만들기
ggChoropleth(data = crime,       # 지도에 표현할 데이터
             aes(fill = Murder,  # 색깔로 표현할 변수
                 map_id = state),# 지역 기준 변수
             map = states_map)   # 지도 데이터

# 인터랙티브 단계 구분도 만들기
ggChoropleth(data = crime,       # 지도에 표현할 데이터
             aes(fill = Murder,  # 색깔로 표현할 변수
                 map_id = state),# 지역 기준 변수
             map = states_map,   # 지도 데이터
             interactive = T)    # 인터랙티브

### 11-2.대한민국 시도별 인고, 결핵 환자 수 단계 구분도 만들기
## 대한민국 시도별 인구 단계 구분도 만들기

# 패키지준비하기
install.packages('stringi', dependencies = T)

devtools::install_github('cardiomoon/kormaps2014')

# 대한민국 시도별 인구 데이터 준비하기 
# 한글 깨지는거 방지하기 # 강사님은 이거 temp라는 변수에 넣었음.
str(changeCode(korpop1)) # 한글 깨짐 방지. 변수에 저장한건 아님
korpop1 

# 데이터 먼징 작업
library(dplyr)

korpop1 <- korpop1 %>% rename(pop = '총인구_명',name = '행정구역별_읍면동')
str(changeCode(kormap1))

View(kormap1) # name 변수 한글 다 깨짐
View(changeCode(kormap1)) # 체인지코드하면 한글 안깨짐

# ----------나도 체인지 코드 적용한 새로운 변수 만듦.
korpop1_change <- changeCode(korpop1)
kormap1_change <- changeCode(kormap1)

View(korpop1_change)
View(kormap1_change)

# 단계 구분도 만들기
ggChoropleth(data = korpop1_change, # 지도에 표현할 데이터
             aes(fill = pop,        # 색깔로 표현할 변수
                 map_id = code,     # 지역 기준 변수
                 tooltip = name),   # 지도 위에 표시할 지역명
             map = kormap1,         # 지도 데이터
             interactive = T)       # 인터랙티브
