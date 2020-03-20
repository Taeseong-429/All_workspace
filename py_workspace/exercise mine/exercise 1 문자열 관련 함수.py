# exercise mine1.py

# 문자열 포맷팅
print(f'abcdeef{"wefwefwe"}wefwefwf')
python = 'abcdefg'
print(f'12345{python}12345')

# 문자열 관련 함수
1) 문자열 삽입(Join)
>>>",".join('abcd')
'a,b,c,d' abcd 문자열의 각각 문자 사이에 ,를 삽입.
>>>a = "hi"

2) 소문자를 대문자로 바꾸기
# a.upper()

3) 대문자를 소문자로

4) 왼쪽 공백 지우기(lstrip) 
# a.lstrip()

5) 공백 지우기 
# a.rstrip() , a.lstrip(), a.strip() 

6) 문자열 바꾸기(replace)
# a.replace(바뀌게 될 문자열, 바꿀 문자열)

7) 문자열 나누기(split)
# a.split() <- 공백을 기준으로 문자열 나눠줌. 나눠서 리스트로 들어가게 된다. 저장해주지는 않을듯 ?
