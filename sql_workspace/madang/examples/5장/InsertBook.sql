CREATE OR REPLACE PROCEDURE InsertBook(
  myBookID IN NUMBER, 
  myBookName IN VARCHAR2, 
  myPublisher IN VARCHAR2, 
  myPrice IN NUMBER)
AS
BEGIN
  INSERT INTO Book(bookid, bookname, publisher, price)
      VALUES(myBookID, myBookName, myPublisher, myPrice);
END;

