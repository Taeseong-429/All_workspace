CREATE OR REPLACE PROCEDURE Interest 
AS
  myInterest NUMERIC;
  Price NUMERIC;
  CURSOR InterestCursor IS SELECT saleprice FROM Orders;
BEGIN
  myInterest := 0.0;
  OPEN InterestCursor;
  LOOP
    FETCH InterestCursor INTO Price;
    EXIT WHEN InterestCursor%NOTFOUND;
    IF Price >= 30000 THEN
        myInterest := myInterest + Price * 0.1;
    ELSE 
        myInterest := myInterest + Price * 0.05;
    END IF;
  END LOOP;
  CLOSE InterestCursor;
  DBMS_OUTPUT.PUT_LINE(' 전체 이익 금액 = ' || myInterest);
END;