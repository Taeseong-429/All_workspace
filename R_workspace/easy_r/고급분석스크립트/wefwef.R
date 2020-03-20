# 1. 

class(state.x77) # matrix

df_states <- as.data.frame(
  state.x77[, 
            c('Murder', 'Population', 'Illiteracy', 'Income', 'Frost')
            ]
  )

str(df_states)


fit <- lm(Murder ~ Population + Illiteracy + Income + Frost, data = df_states)
fit
dev.off()
par(mfrow = c(2,2))
plot(fit)

summary(fit)

# 3.
data(iris)
View(iris)
df_train <- iris[1:105,]
df_validation <- iris[106:150,]

str(df_train)
d
str(df_validation)
d


library(MASS)

fit <- lm(Murder ~ Population + Illiteracy + Income + Frost, data = df_states)

stepAIC(fit, direction = 'backward')

Bestfit <- lm(Murder ~ Population + Illiteracy, data = df_states)
summary(Bestfit)
