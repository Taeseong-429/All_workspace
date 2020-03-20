/* step 1 */
SET TRANSACTION NAME 'T1';

UPDATE Book 
SET    price=price+100
WHERE  bookid=1;

/* step 3 */
UPDATE Book 
SET    price=price+100
WHERE  bookid=2;

/* step 5 */
COMMIT;