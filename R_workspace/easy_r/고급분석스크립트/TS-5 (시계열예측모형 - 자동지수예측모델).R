# -------------------------------------------
# 시계열 예측모형 - 자동지수예측모델
# -------------------------------------------
# ets{forecast} 함수에는 특수한 기능이 존재 :
# 가. 승법모델을 지원
# 나. 자동예측(예측모형을 적합)을 지원

# 사례 데이터셋 : JohnsonJohnson

start(JohnsonJohnson)
end(JohnsonJohnson)
frequency(JohnsonJohnson)
cycle(JohnsonJohnson)

plot(JohnsonJohnson) # 시계열의 성분구조가 애매모호?

# (1) 자동예측모형 적합
lirary(forecast)

(fit <- ets(JohnsonJohnson)) # 불규칙 M, 추세 A, 계절A로 나옴. # 모두 자동으로 판단하도록 넣었
# 추세는 가법, 계절은 있는걸로 나옴
names(fit)

# (2) 1-step ahead forecasting
( pred <- forecast(fit) ) # h 제거하는 default h = 10

# (3) 시계열 예측결과 시각화
plot(pred)

# (4) 예측정확도 판단
accuracy(fit)
summary(fit)
