# -------------------------------------------------------------------
# 2nd. Classfication : 의사결정나무(Decision Tree)
# -------------------------------------------------------------------

# (1) 분류목적 데이터셋 준비 : df_wbc
load('')
df_wbc <- breast_cancer_wisconsin

colnames(breast_cancer_wisconsin) <- c('표본번호', '종양두께', '세포크기균일성', '세포모양균일성', '주변접착력', '단일상피세포크기', '세포핵', '염색질', '정상세포핵여부', '유사분열', 'Class')

df_wbc <- df_wbc[-1]            # 표본번후 변수제거
df_wbc <- as.data.frame(df_wbc) # 순수한 데이터프레임으로 형변환
df_wbc

save(df_wbc, file = 'df_wbc.rda')

str(df_wbc)

n <- nrow(df_wbc) # 전체표본의 크기

library(dplyr)

# 70%에 해당되는 관측치의 행번호 추출

( trains <- sample(n, replace = F, 0.7*n))

df_train <- df_wbc[trains, ] # 70% 관측치 추출 : 훈련용 셋
df_vaild <- df_wbc[-trains,] # 30% 관측치 추출 : 검증용 셋

# 완전확률화로 추출된 각 셋의 분류의 빈도와 비율확인
library(prettyR)
freq(df_train$Class) # 확인
freq(df_vaild$Class)

# -------------------------------------------------------------------
# (2) 의사결정나무 키우기
# -------------------------------------------------------------------
# rpart{rpart}

library(rpart)

# set.seed(1234)

args(rpart)

dtree <- rpart(
            formula = Class ~ .,
            data = df_wbc,
            method = 'class',
            parms = list(split = 'information')
)

class(dtree)
names(dtree)

dtree # 가장 안쪽에서 바깥으로 읽음.

dtree$cptable # 맨 왼쪽에 있는 번호가 나무의 크기.  
              # nsplit :  가지 분기 수를 의미. 
              # rel " 나무의 예측 오류
              # xerror : 교차 검증 오류 ?? Cross
              # xstd : 표준오차
              # CP : 복잡성 파라미터 
#xerror의 최소값 + xstd 값으로 결정된 cut-off 상한선의 아래에 있는 점 중에, 가장 왼쪽 cp값을 가진 나무 선택
#                 이 그림에선 2개 들어와서 왼쪽에 있는 4를 선택.하고 분기가 4가 되려면 n+1은 4니까, n은 3

# (3) 복잡성 파라미터의 정보를 이용하, 적정 나무의 크기 결정 판단기준:
#       가. xerror(교차타당성 검증오류값)가 최소값 + xstd 내에 있는 
#           min(xerror) +- xstd --> 일정범위 값 구간생성 
#       나. 가에서 생성한 구간(범위)내의 교차검증오류(xerror)값이 가장 작은 나무를 선택.
#       다. 종합 : xerror의 최소값 + xstd 값으로 결정된 cut-off 상한선의 아래에 있는 점 중에, 가장 왼쪽 cp값을 가진 나무 선택
#                 이 그림에선 2개 들어와서 왼쪽에 있는 4를 선택.하고 분기가 4가 되려면 n+1은 4니까, n은 3
#

# 전달된 의사결정나무의 CP table를 시각화
plotcp(dtree) # 왼쪽은 X error임. rel error 아님. , 위쪽은 나무의 크기, 아래는 CP값.

dtree.pruned <- prune(dtree, cp =0.01659751) # 나무 3일때니까 0.1659751 넣는다다
dtree.pruned

library(rpart.plot)
prp(
    dtree.pruned,  # 가지치기를 끝낸 나무
    type = 2,      # 출력 나무의 모양을 결정
    extra = 103,   # 출력 나무의 노드 안에 출력값을 결정
    fallen.leaves = T, # 터미널 노드 출력여부 결정
    main = '- Decision Tree -') # 103 혹은 104
