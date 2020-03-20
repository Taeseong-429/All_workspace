# T.test 실습

# ch_7_df # SA폴더에 있는 거 불러와서 실습

t.test(ch7_df$Calories, mu = 140) # 검정통계량 구하기 가능.
# 결과 평균은 137. but, 통계적으론 같다 ! p-value

table(ch7_df$Type)

t.test(data= ch7_df, Calories ~ Type)

t.test(data =ch7_df, Calories ~ Type, var.equal = T)

# ----------새로운 데이터 프레임 불러옴 
# Paired T-test

t.test(ch7_paired$post - ch7_paired$pre)

## 