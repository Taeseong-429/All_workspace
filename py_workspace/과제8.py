# - Python 표준라이브러리 문서페이지를 보시고....

# 1. 각 조당, 50개의 함수를 조사
#    가. 함수 기능과 function prototype
#    나. 간단한 사용예제
# 2. 각 조의 조장님은, 50개의 함수를
#    미리 결정해놓고, 조원수에 맞게 배부

#함수 해더 :function prototype
#메소드 헤더 : method signature

#1.abs(x) : argument의 절댓값을 반환-------------------------#
print('\n#1.abs(x) : --------------------------------------------------------#')
#   abs() takes exactly one argument
#   type(abs) : <class 'builtin_function_or_method'>
print('type(abs): ', type(abs))
#   Ex.:
argument = -8
print('print(abs({})):'.format(argument),abs(argument))


#2.all(iterable) : iterable의 모든 요소에 대해 bool(요소)가 전부 T면 T, 하나라도 F면 F 반환(단 빈 iterable 객체는 True)-------------------------#
print('\n#2.all(x) : --------------------------------------------------------#')
#   all() takes exactly one argument
print('type(all): ', type(all))
#   Ex.1
print('all([True, 1, -1]):', all([True,1,-1]))
print('all([True, 1, -1, 0]):', all([True,1,-1,0]))
#   Ex.2: 빈 iterable argument를 넣었을때 True 반환
# def ALL(iterable):
#     for element in iterable:
#         print('ALL함수 내의 for문 ')
#         if not element:
#             return False
#     return True
# print(ALL(l))
l=[]
# print(l)
# print(bool(l))
# print(all(l))
print('all([]):', all(l))

#3.any(iterable) : iterable의 모든 요소에 대해 bool(요소)가 하나라도 T면 T반환(단 빈 iterable 객체는 False)-------------------------#
print('\n#3.any(x) : --------------------------------------------------------#')
print('type(any): ', type(any))
#   Ex.1
print('any([0, 1, 2, 3]):', any([0,1,2,3]))


#4.ascii(iterable) : 객체의 인쇄 가능한 표현(??) 포함하는 문자열을 반환, 
#   단 비 ASCII 문자는  \x 나 \u 또는 \U 의 escape code를 이용해 반환함 -------------------------#
print('\n#3.ascii(obj) : --------------------------------------------------------#')
print('type(ascii): ', type(ascii))
#   Ex.1: 아스키 이외의 값에 대해서는 백슬래시를 사용한 유니코드값을 반환
print('ascii(''ABCDEabcde''):', ascii('ABCDEabcde'))
print('ascii(''파이썬test''):', ascii('파이썬test'))



#4.bin(int) : 정수를 넣으면 《0b》 가 앞에 붙은 이진 문자열로 변환합니다.-------------------------#
print('\n#4.bin(int) : --------------------------------------------------------#')
print('type(bin): ', type(bin))
#   Ex.1:
print('bin(3):', bin(3))
print('bin(0):', bin(0))

#5.bool(x) : True Value testing을 해서 결과로 논리값, 즉 True 또는 False 중 하나를 반환.-------------------------#
print('\n#5.bool(x) : --------------------------------------------------------#')
print('type(bool): ', type(bool))
#   Ex.1:
print('bool(3):', bool(3))
print('bool(None):', bool(None))
print('bool([]):', bool([]))
print('bool("python"):', bool("python"))


#6.breakpoint(x) :python 3.7부터 새로 생긴 내장함수, 코드에 "중단점(breakpoint)"이라는걸 위치시켜줌으로써 코드 실행을 인터럽트. 
print('\n#6. breakpoint() : --------------------------------------------------------#')
#print('type(breakpoint): ', type(breakpoint()))
#   중단점(breakpoint):  프로그램의 현재 상태를 확인할 수 있도록 실행을 일시적으로 중단해야하는 코드 내의 신호
#   pdb : python 표준 라이브러리의 디버거인 pdb
#   breakpoint()는 먼저 pdb를 임포트해주고, breakpoint()를 만나면 실행이 중단되고 PDB 디버깅 세션에 진입. 
#   help(breapoint):
    # breakpoint(*args, **kws)

    # Call sys.breakpointhook(*args, **kws).  sys.breakpointhook() must accept
    # whatever arguments are passed.

    # By default, this drops you into the pdb debugger.
 
#   Ex.1: c를 누르면 종료됨

#-------------------------------------------------------------------------------------#

# 10. callable()    # 호출가능한 object인지 여부를 판단하는 함수

sample1 = 1

print(callable(sample1))

def sample2():
    return ("Hello!")

print(callable(sample2))

#-------------------------------------------------------------------------------------#

# 11. delattr(object, name)     # object의 속성(Atrributes)를 제거하는 함수

class sample:
     def __init__(self):
         self.x = 1

a = sample()

print(dir(a))

delattr(a, 'x')

print(dir(a))

# del a.x 를 해도 똑같은 결과를 얻을 수 있음

#-------------------------------------------------------------------------------------#

# ** 12. enum.Enum

import enum

# 여기서는 편의상 정수로만 지정했지만, 데이터 종류에 상관없이 상수를 지정할 수 있다.
# 실수, 문자열, 리스트 등의 모든 자료형을 사용할 수 있다.

class Color(enum.Enum):
    RED = 1
    GREEN = 2
    BLUE = 3

a = Color(1)

print(a)

class Color(enum.Enum):
    RED = enum.auto()
    GREEN = enum.auto()
    BLUE = enum.auto()

#-------------------------------------------------------------------------------------#

# 13. dir()

dir([object])

# 객체의 속성과 메소드를 모두 불러옴
# 객체에 __dir__메소드가 있을 경우 실행되는데, __dir__메소드가
# 없다고 해서 실행되지 않는 것은 아니다.
# __dir__메소드가 없을 경우 __dict__ 속성과 형객체로 부터 정보를
# 수집하기 위해 최선을 다한다.

class Shape:
    def __dir__(self):
        return ['area', 'perimeter', 'location']
        pass

    pass

s = Shape()

dir(s)

#-------------------------------------------------------------------------------------#

# 14. divmod()

# divmod(num1 , num2)

# num1을 num2로 나눈 몫과 나머지를 튜플 형로 돌려주는 함수

result = divmod(4, 3)

print( result )         # answer 1, 1

#-------------------------------------------------------------------------------------#

# 15. 16. 17.  eval(), exec(), compile()        # eval()과 비슷함

# 실행가능한 식을 입력받고 결과값을 반환

x = eval('5+5')

# eval('x=5+5')  # 실행되지 않음

# eval()과는 다르게 문장 그자체를 입력받고 바로 실행시킴
# 결과값을 반환하지는 않음

exec('x = 5+5')

# eval, exec 의 경우 compile된 문장도 실행 시킬 수 있음

print(x)

# compile()의 경우 source 를 코드 또는 AST 객체로 컴파일함. 
# 코드 객체는 exec() 또는 eval() 로 실행할 수 있음.

#-------------------------------------------------------------------------------------#

# 18. doctest   # 간단한 사용 예제를 테스트를 해볼때

import doctest

def doubler(num):
    """
    This function returns the argument 'num' multipled by 2

    Example
    -------
    >>> doubler(10)
    30
    """
    return num * 2

doctest.testmod()

#################################################################

import random

# 1. random() 함수 : 0부터 1사이의 랜덤 실수를 리턴.
print('random :',random.random())

# 2. uniform() 함수 : 2개의 숫자 사이의 랜덤 실수를 리턴.
print('uniform :',random.uniform(1,10))

# 3. randint() 함수 : 2개 숫자 사이의 랜덤 정수 리턴 (2번째 인자 정수도 범위에 포함)
print('randint :',random.randint(0,100))

# 4. randrange() 함수 : range(start,stop,step) 함수로 만들어지는 정수 중 하나를
#                      랜덤하게 리턴
print('randrange :',random.randrange(0,101,2)) 

# 5. choice() 함수 : 랜덤하게 하나의 원소를 선택. 인자는 리스트 같은 시퀀스 자료형
print('choice :',random.choice('abcdefghij'))

# 6. sample() 함수 : 랜덤하게 여러 개의 원소를 선택.# 여기선 3개 선택
#                    리스트 형태로 변환.(중복없음, 로또 번호)
print('sample :',random.sample([1,2,3,4,5], 3))


# 7. shuffle() 함수 : 리스트 변수 내용 자체를 랜덤하게 섞음.
data = [1, 2, 3, 4, 5, 6, 7]
random.shuffle(data)
print(data)

############################################################################
# === float() ===
# Returns a floating point number constructed from a <number> or <string>.

# Examples:
""" float1 = float('-1.50')
float2 = float(55)
float3 = float(1e-3)
float4 = float(1e3) """


# ===  format() ===
# 'string'.format(<values>) 
# Inserts values to format a string.
# In the string, the spaces to format are delimited by {  }

""" format1 = '{} + {} is {}'.format(1, 1, 2)
format2 = 'Hello, {}!, welcome to {}!'.format('USERNAME', 'SITENAME') """



# ===  hash() ===
# Returns the unique hash number of an IMMUTABLE object.
# Hash codes are most used in comparison of dictionary keys is done. 
# Comparing hash is much faster than comparing the complete key values because 
# the set of integers that the hash function maps each dictionary key to 
# is much smaller than the set of objects itself.

""" class User:
    def __init__(self, name, occupation):
        self.name = name
        self.occupation = occupation
        pass # end constructor
    # end class

user1 = User('John Doe', 'Gardener')
user2 = User('John Doe', 'Gardener')
hash1 = hash(user1)
hash2 = hash(user2) 
 """


# === help() ===
# Invokes the help page of a given module, function, class, method, keyword, or documentation topic.

""" print(help(list()))
import statistics
print(help(statistics)) """


# === hex() ===
# Converts an integer number to a lowercase hexadecimal string prefixed with “0x”.

""" hex1 = hex(1)
hex2 = hex(2)
hex3 = hex(500) """


# === id() ===
#Returns the unique id of an object. 

""" id1 = id(123)
id2 = id(133)
id3 = id(133)
id4 = id(list())
id5 = id(list()) """


# === input() ===
# Converts an user input value into a string.

""" Input1 = input('Type something:' )
Input2 = input('---> ') """


# === int() ===
# Returns the integer value, of a string. 
# Returns TypeError when any data type otherthan string or integer is passed.

""" int1 = int('1000')
print(int(1)) """

###########################################################################################

# assignment8.py

# isinstance()
# isinstance(object, class)

# # ex1) 
# class Person:
#     pass
# a = Person()
# print(isinstance(a, Person))

# # ex2)
# b = 3
# print(isinstance(b, Person))

# # ex3)
# print(isinstance(1, int))
# print(isinstance(1.2, int))
# print(isinstance('Hi', str))


#------------------------------------------#


# issubclass
# issubclass(class,classinfo)

# # ex)
# class Cake1():
#     pass
# class IceCake(Cake1):
#     pass
# class ChocholateCake(Cake1):
#     pass
# class Cake2():
#     pass
# class CreamCake(Cake2):
#     pass

# print(issubclass(IceCake,Cake1))
# print(issubclass(ChocholateCake,Cake1))
# print(issubclass(CreamCake,Cake1))
# print(issubclass(ChocholateCake,object))
# print(issubclass(CreamCake,object))
# print(issubclass(object,object))


#------------------------------------------#


# # iter , next
# # iter(), next(iter()), next(iter(), )
# a = iter([1,2,3])
# # print(next(a))
# # print(next(a))
# # print(next(a))
# # print(next(a))

# a = iter(([1,2,3,4]),3)

# print(next(a,0))
# print(next(a,0))
# print(next(a,0))
# print(next(a,0))
# print(next(a,0))

#------------------------------------------#


# # len
# # len()

# # ex)
# print(len("python"))
# print(len([1,2,3]))
# print(len((1, 'a')))

# 활용도가 높음(반복문, 객체 자체의 길이가 길때...)


#------------------------------------------#


# memoryview


#------------------------------------------#


# # min
# # min()

# # ex)
# print(min([1, 2, 3]))
# print(min("python"))


#------------------------------------------#


# # object
# # class object

# class object(): 
#     pass

####################################################################

# 함수조사 
#   가. 함수 기능과 function prototype(함수의 헤더)
#   나. 간단한 사용예제 코드


# 1. slice 함수
# 함수의 기능 :  range(start, stop, step) 에 의해 지정된 인덱스 세트를 나타내는 슬라이스 객체를 돌려줍니다.
# class slice(start, stop[, step])

a = range(1, 10, 2)
a.slice(1,10,[2])



# 2. sorted 함수
# 함수의 기능: 입력값을 정렬한 후 그 결과를 리스트로 돌려주는 함수이다.

# sorted(iterable)
a=[7,4,10]
b=['c','a','u']
c = ('대한민국')

ResultSorted = sorted(a)
ResultB = sorted(b)
ResultC = sorted(c)
print(ResultSorted)
print(ResultB)
print(ResultC)



# 3. staticmethod 함수
# 함수의 기능: 




# 4. str 함수
# 함수의 기능: 문자열 형태로 객체를 변환하여 돌려주는 함수
d = str(3)
print(d)
print(type(d))


# 5. sum 함수
# sum(iterable, start)
# 함수의 기능: 입력받은 리스타나 튜플의 모든 요소의 합을 돌려주는 함수

e =  sum((4,2233))
print(e)



# 6. super 함수 : class 작성 시, 상위클래스의 속성을 그대로 호출할 때 사용.
# super는 클래스 이름이며, '부모'를 나타내는 또다른표현
# 부모 없는 자식은 없기 때문에 메모리에 부모 객체를 반드시 생성하고, 부모 객체의 생성자를 호출
# 생성자의 목적: 객체의 초기화 및 객체 속성 활용하기 위해


class Parent :                 # 부모클래스
    def __init__(self):        # 생성자
        print('- Parent::__init__invoked.')
        self.field1 = 0 
        pass

    def method1(self):         # 메소드(method)
        print('- Parent::__init__invoked.')
       
        pass

    pass  # end \class

class Child(Parent) :           # 자식클래스
    def __init__(self):         # 생성자 
        print( '- Child::__init__ invoked.')
        
        super().__init__()               
           
        print('\t+ type(super):', type(super))  
        print('\t+ dir(super):', dir(super))
        print('\t+ type(super()):', type(super()))   #super() 가 super 클래스의 객체이며, 부모클래스의 객체
        print('\t+ dir(super()):', dir(super()))

        parent = super()         # super 클래스의 인스턴스 생성
        parent.__init__()        #생성자 호출
        pass # constructor
    
    def method2(self):
        print(' - Child::method2 invoked.')
        pass #method2
    
    pass # end \class

child = Child()
child.method2()

# 7. tuple 함수
#  기능: 반복가능한(iterable) 자료형을 입력받아 튜플 형태로 바꾸어 돌려주는 함수이다.

a = tuple("abc")
print(a)

b= tuple("d",)
print(b)


# 8. type 함수
# 함수기능: type(object)은 입력값의 자료형이 무엇인지 알려주는 함수이다.
print(type("abc"))
print(type({}))
print(type([]))
print(type(open("sample2.py",'r')))
