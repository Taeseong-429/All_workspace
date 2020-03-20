CREATE OR REPLACE PROCEDURE BookInsertOrUpdate(
  myBookID NUMBER,
  myBookName VARCHAR2, 
  myPublisher VARCHAR2,
  myPrice INT) 
AS
  mycount NUMBER;
BEGIN
  SELECT count(*) INTO mycount FROM Book 
    WHERE bookname LIKE myBookName; 
  IF mycount!=0 THEN
    UPDATE Book SET price = myPrice
      WHERE bookname LIKE myBookName;
  ELSE
    INSERT INTO Book(bookid, bookname, publisher, price)
      VALUES(myBookID, myBookName, myPublisher, myPrice);
  END IF;
END;