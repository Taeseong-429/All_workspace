# 상호작용이 있는 다중선형회귀
# formula symbol, : -> interaction

# 분석 데이터셋: mtcars{datasets}

fit <- lm(mpg ~ hp + wt + hp:wt, data = mtcars)
fit

summary(fit)
coef(fit)

# 추정회귀방정식 : yHat = a + bx
# mpg^ = 49.80842343 -0.12010209 x hp -8.21662430 x wt + 
#        0.02784815 x hp x wt

# if wt = 2.2 일때,
#   mpt^ = 49.80842343 - (0.12010209 x hp) -8.21662430 x 2.2 +
#          ( 0.02784815 x 2.2 x hp ) = ? - ? x hp
#   mpg^ = 31.41 - 0.06 x hp

# 시각화
dev.off()

library(effects)
plot( effect("hp:wt", fit), multiline = T )


dev.new()
plot(mtcars$wt, mtcars$mpg )

dev.new()
boxplot(mtcars$mpg)
