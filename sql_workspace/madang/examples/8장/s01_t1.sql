/*  STEP 1 */
SET TRANSACTION NAME 'T1';

SELECT * 
FROM   Book
WHERE  bookid=1;

UPDATE Book 
SET     price=7100
WHERE  bookid=1;

/*  STEP 1 끝 */

/* STEP 3  */
SELECT * 
FROM   Book
WHERE  bookid=1;

COMMIT;
/* STEP 3 끝 */
