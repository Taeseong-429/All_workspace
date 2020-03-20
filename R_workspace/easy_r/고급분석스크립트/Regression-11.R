shrinkage <- function(fit, k = 10) {
  
  require(bootstrap)
  
  theta.fit <- function(x, y) { lsfit(x, y) }
  theta.predict <- function(fit, x) { cbind(1, x) %*% fit$coefficients }
  
  x <- fit$model[ , 2:ncol(fit$model)]
  y <- fit$model[ , 1]
  
  results <- crossval(x, y, theta.fit, theta.predict, ngroup = k)
  
  r2 <- cor(y, fit$fitted.values)^2
  r2cv <- cor(y, results$cv.fit)^2
  
  cat('1. Original R-square: ', r2, '\n')
  cat('2.', k, 'fold cross validation R-square: ', r2cv, '\n')
  cat('3. Change = ', r2-r2cv, '\n')
}

states <- as.data.frame(
  state.x77[ , c('Murder','Population','Illiteracy','Income','Frost')]
)

fit <- lm(Murder ~ Population + Illiteracy + Income + Frost, data = states)

shrinkage(fit)
