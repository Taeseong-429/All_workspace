library(ggplot2)
library(foreign)
library(readxl)
library(haven)

raw_welfare <- read.spss(file = 'C:/app/all_workspace/R_workspace/easy_r/easy_r/Data/Koweps_hpc10_2015_beta1.sav', to.data.frame = T)

welfare <- raw_welfare

welfare <- rename(welfare,
                  sex = h10_g3,            # 성별
                  birth = h10_g4,          # 태어난 연도
                  marriage = h10_g10,      # 혼인 상태
                  religion = h10_g11,      # 종교
                  income = p1002_8aq1,     # 월급
                  code_job = h10_eco9,     # 직종 코드
                  code_region = h10_reg7)  # 지역 코드

# 이상치 결측 처리
welfare$sex <- ifelse(welfare$sex == 9, NA, welfare$sex)

# 성별 항목 이름 부여
welfare$sex <- ifelse(welfare$sex == 1, "male", "female")

# 이상치 결측 처리
welfare$income <- ifelse(welfare$income %in% c(0, 9999), NA, welfare$income)

1. 성별 월급 평균표 만들기
sex_income <- welfare %>%
  filter(!is.na(income)) %>%
  group_by(sex) %>%
  summarise(mean_income = mean(income))

sex_income

2. 그래프 만들기
ggplot(data = sex_income, aes(x = sex, y = mean_income)) + geom_col()


# 이상치 결측 처리
welfare$birth <- ifelse(welfare$birth == 9999, NA, welfare$birth)
table(is.na(welfare$birth))


3. 파생변수 만들기 - 나이
welfare$age <- 2015 - welfare$birth + 1
summary(welfare$age)


나이와 월급의 관계 분석하기
1. 나이에 따른 월급 평균표 만들기
age_income <- welfare %>%
  filter(!is.na(income)) %>%
  group_by(age) %>%
  summarise

head(age_income)

2. 그래프 만들기
ggplot(data = age_income, aes(x = age, y = mean_income)) + geom_line()


# 연령대 변수 검토 및 전처리하기
# 파생변수 만들기 - 연령대
welfare <- welfare %>%
  mutate(ageg = ifelse(age < 30, "young",
                       ifelse(age <= 59, "middle", "old")))

ageg_income <- welfare %>%
  filter(!is.na(income)) %>%
  group_by(ageg) %>%
  summarise(mean_income = mean(income))

2. 그래프 만들기
ggplot(data = ageg_income, aes(x = ageg, y = mean_income)) + geom_col()

# 막대 정렬 : 초년, 중년, 노년 나이 순
ggplot(data = ageg_income, aes(x = ageg, y = mean_income)) +
  geom_col() +
  scale_x_discrete(limits = c("young", "middle", "old"))

# 연령대 및 성별 월급 차이 분석하기
# 1. 연령대 및 성별 월급 평균표 만들기
sex_income <- welfare %>%
  filter(!is.na(income)) %>%
  group_by(ageg, sex) %>%
  summarise(mean_income = mean(income))
sex_income

# 2. 그래프 만들기
ggplot(data = sex_income, aes(x = ageg, y = mean_income, fill = sex)) +
  geom_col() +
  scale_x_discrete(limits = c("young", "middle", "old"))

# 성별 막대 분리
ggplot(data = sex_income, aes(x = ageg, y = mean_income, fill = sex)) +
  geom_col(position = "dodge") +
  scale_x_discrete(limits = c("young", "middle", "old"))

# 나이 및 성별 월급 차이 분석하기
# 성별 연령별 월급 평균표 만들기
sex_age <- welfare %>%
  filter(!is.na(income)) %>%
  group_by(age, sex) %>%
  summarise(mean_income = mean(income))
head(sex_age)

# 2. 그래프 만들기
ggplot(data = sex_age, aes(x = age, y = mean_income, col = sex)) + geom_line()

list_job <- 
  read_excel("Data/Koweps_Codebook.xlsx", 
             col_names = T, sheet = 2)
View(list_job)
class(list_job)

# 데이터 프레임으로 변환
list_job <- as.data.frame(list_job)
class(list_job)
library(ggplot2)
library(readxl)
library(dplyr)
list_job <- read_excel('Data/Koweps_Codebook.xlsx', col_names = T, sheet =2)
head(list_job)

# welfare에 직업명 결합
welfare <- left_join(welfare, list_job, id = 'code_job')

## joining, by = 'code_job'

welfare %>% 
  filter(!is.na(code_job)) %>% 
  select(code_job, job) %>% 
  head(10)

## 직업별 월급 차이 분석하기
# 1. 직업별 월급 평균표 만들기
job_income <- welfare %>% 
  filter(!is.na(job) & !is.na(income)) %>% 
  group_by(job) %>% 
  summarise(mean_income = mean(income))

job_income

# 2. 상위 10개 추출
top10 <- job_income %>% 
  arrange(desc(mean_income)) %>% 
  head(10)  
# 3. 그래프 만들기
ggplot(data = top10, aes(x = reorder(job, mean_income), y = mean_income))+
  geom_col() + 
  coord_flip()

# 4. 하위 10위 추출
bottom10 <- job_income %>% 
  arrange(mean_income) %>% 
  head(10)

bottom10

# 5. 그래프 만들기
ggplot(data = bottom10, aes(x = reorder(job, -mean_income),
                            y = mean_income)) +
  geom_col() + 
  coord_flip() +
  ylim(0, 850)


### 9 - 7 성별 직업 빈도
## 성별로 어떤 직업ㄱ이 가장 많을까 ??

## 성별 직업 빈도 분석하기
# 1. 성별 직업 빈도표 만들기
# 남성 직업 빈도 상위 10개 추출

job_male <- welfare %>% 
  filter(!is.na(job) &  sex == 'male') %>% 
  group_by(job) %>% 
  summarise(n = n()) %>% 
  arrange(desc(n)) %>% 
  head(10)

# 여성 직업 빈도 상위 10개 추출

job_female <- welfare %>% 
  filter(!is.na(job) & sex == 'female') %>% 
  group_by(job) %>% 
  summarise(n = n()) %>% 
  arrange(desc(n)) %>% 
  head(10)

job_female

# 여기서 9장은 건너뜀.
