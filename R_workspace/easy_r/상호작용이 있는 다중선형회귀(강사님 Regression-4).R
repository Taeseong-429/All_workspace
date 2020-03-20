# 상호작용이 있는 다중선형회귀
# formula symbol. : -> interaction

# 분석 데이터셋 : mtcars{datasets}

fit <- lm(mpg ~ hp + wt + hp:wt, data = mtcars) # hp는 엔진의 힘. wt는 차의 중량
# 이 두가지간의 상호작용에 있어서도 연비가 영향을 받는가
fit
summary(fit)

# 추정회귀방정식 : yHat = a + bx
# mpg^ =  49.80842  - 0.12010~` x hp -8.2162430 x wt + 
#          0.02784815 x hp x wt

# if wt = 2.2 일때,
# mpt^ = 49.808 - 0.12010 x hp 

# 시각화 상호작용 효과를 시각화해서 판단가능.
library(effects)
plot(effect("hp:wt", fit), multiline = T )


dev.new()
plot(mtcars$wt, mtcars$mpg)
