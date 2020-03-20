CREATE OR REPLACE TRIGGER AfterInsertBook 
AFTER INSERT ON Book FOR EACH ROW
DECLARE 
  average NUMBER;
BEGIN   
  INSERT INTO Book_log 
    VALUES(:new.bookid, :new.bookname, :new.publisher, :new.price);
  DBMS_OUTPUT.PUT_LINE('삽입 투플을 Book_log 테이블에 백업..');
END;