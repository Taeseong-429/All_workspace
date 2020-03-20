UPDATE SummerPrice
SET     price=15000
WHERE  class='FORTRAN';

SELECT price "FORTRAN 수강료"
FROM   SummerPrice
WHERE class='FORTRAN';

commit;