# 데이터 생성 후 연습 2

dd <- matrix(
  data = c(
    c(1342, 1442, 1252, 1343),
    c(1425, 1362, 1456, 1272),
    c(1243, 1359, 1412, 1253),
    c(1201, 1478, 1322, 1406),
    c(1254, 1289, 1497, 1205)
  )
) 

( dd.ts <- ts(data = dd, frequency = 4, start = c(2006, 1)) ) # 분기 데이터 생성.


(dd.ts <- lag(dd.ts, k = 2)) # 과거로 2분기만큼 떙김 ! 

dd.ts # 다시 원래대로 되돌림.

(dd3.ts <- lag(dd.ts, k = -2)) # 미래로 2분기만큼 가라 !  그래서 06 3, 4 부터 생김.
