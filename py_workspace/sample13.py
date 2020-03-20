# sample13.py
# 문자열 객체의 여러 메소드 테스트
         #0123456789012345678901234
string = "Python is the best choice"

# 1. count() 메소드
# print( string.count('b') )

# 2. find() 메소드: 지정된 문자의 인덱스 번호를 찾아준다!!!
# print( string.find('b') )
# print( string.find('k') )
# print( string.find('best') )

# 3. index() 메소드: find()와 동일하게 찾는 문자/문자열의 위치(인덱스번호)를 반환
# print( string.index('b') )
# print( string.index('k') )

# 4. join() 메소드: 전달인자로 지정된 문자열을 구성하는 각 문자 사이에, 지정된 문자를 삽입.
# print(   "-".join("1234567890")  )

# 리스트 선언 (한 학생의 5과목 성적을 포함하고 있는 리스트)
# scores = [ 98, 100, 77, 22, 100 ] # 리스트 변수정의
scores = [ '98', '100', '77', '22', '100' ] # 리스트 변수정의

# CSV 형식으로 각 점수를 구분해서 출력하기
# print(     ",".join( ['a', 'b', 'c', 'd'] )       ) 
# print(     ",".join( scores )       ) 

# 문자열 안의 모든 문자들을,
#    대문자 -> 소문자로     ----> 문자열.lower()
#    소문자 -> 대문자로     ----> 문자열.upper()
# 변경시키는 메소드: 


# print(targetString.upper())
# print(targetString.lower())

# 5. 문자열 안에 포함되어잇는 공백을 제거하는 메소드들:
#      1) lstrip() 메소드: 왼쪽 공백 제거
#      2) rstring() 메소드 : 오른쪽 공백 제거
#      3) strip() 메소드: 양쪽 공백 제거

# targetString = "abc  de fg"

# print(targetString.lstrip())
# print(targetString.rstrip())
# print(targetString.strip())

# 6. replace() 메소드
#    지정된 문자열을, 새로운 문자열로 대체
# s = "Life is too short"

# print( s.replace("Life", "You leg") )
# print( s.replace("  ", "") )  # 바꿀값: 빈문자열(Empty String)

# 7. 문자열 쪼개기(split)
#    split() 메소드: 문자열을, 지정된 구분자(delimiter)를 기준
#                    으로 쪼개서, 리스트로 반환합니다.
#    주의) delimeter(구분자)를 지정하지 않으면, default는
#          공백문자!!
s = "A:  B:C:   D"

# print(  s.split()   )
# print(  s.split(':, ')   )

print( (s.replace(' ', '')).split(':') ) # Method Chaining
print( s.replace(' ', '').split(':') )  # Method Chaining