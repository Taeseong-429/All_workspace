#---------------------------------------------------
# 분류 머신러닝을 위한 Raw Data Set 준비
#---------------------------------------------------
# 로드하고 진행.
colnames(breast_cancer_wisconsin) <- c('표본번호', '종양두께', '세포크기균일성', '세포모양균일성', '주변접착력', '단일상피세포크기', '세포핵', '염색질', '정상세포핵여부', '유사분열', 'Class')

df_wbc <- breast_cancer_wisconsin

save(df_wbc, file = 'df_wbc.rda')

class(df_wbc)

df_wbc <- as.data.frame(df_wbc)


describe(df_wbc)
?describe

library(prettyR)
