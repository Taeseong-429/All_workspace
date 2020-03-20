/* step 2 */
SET TRANSACTION NAME 'T2';

UPDATE Book 
SET    price=price*1.1
WHERE  bookid=2;

/* step 4 */
UPDATE Book 
SET    price=price*1.1
WHERE  bookid=1;

/* step 6 */
COMMIT;