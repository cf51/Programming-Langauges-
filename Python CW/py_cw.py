# Arash's coursework template

# Callum Forsyth, cf51, H00275277 
# F28PL Coursework 2, Python                 


# You may assume variables, procedures, and functions defined in earlier questions
# in your answers to later questions, though you should add comments in code explaining
# this if any clarification might help read your code.


################################################################################
# Question 1   <--- Yes, so we know what question you think you're answering


"""
The complex numbers are explained here (and elsewhere):
 http://www.mathsisfun.com/algebra/complex-number-multiply.html
Represent a complex integer as a pair of integers, so (4,5) represents 4+5i (or 4+5j, depending on the complex numbers
notation you use).
1a. Using def, define functions cadd and cmult representing complex integer addition and
multiplication.
For instance,
 cadd((1,0),(0,1))
should compute
 (1,1).
1b. Python has its own native implementation of complex numbers. Write translation functions
tocomplex and fromcomplex that map the pair (x1,y1) to the complex number x1+(y1)j and vice 
versa. You may use the python methods real and imag without comment, but not complex 
(use j directly instead).
"""
#  <--- always have the question under your nose

#####################################
# Question 1a

# adding the first 2 real number part from the tuple,  then adding the 2 imaginary numbers part of the tuple
# 'c1[0]' , c1[1] - adds the first indexs of the tuple (the real number part)
# 'c2[0]' , c2[1] - adds the second index of the tuple (the imaginary part)

def cadd(c1, c2):
    return ((c1[0] + c2[0]), (c1[1] + c2[1]))

#printing out tests to the terminal for my testing
print("")
print("*****cadd TESTS*****")
print("")
print("Expected = (1, 1)")
print("Answer   =",cadd((0,1),(1,0)))
print("")
print("Expected = (6, 8)")
print("Answer   =",cadd((5,1),(1,7)))
print("")
print("")


# multiplying the tuple using the equation (ac-bd) + (ad + bc)i 
# Using the FOIL method we get (c1[0]*c2[0])-(c1[1]*c2[1])),((c1[0]*c2[1]) + (c[0]*c1[1])
# c1[0] = a , c1[1] = b , c2[0] = c , c2[1] = d 

def cmult(c1,c2):
    return ((c1[0] * c2[0]) - (c1[1] * c2[1])) , ((c1[0] * c2[1]) + (c2[0] * c1[1]))

#printing out tests to the terminal for my testing
print("")
print("*****cmult TESTS*****")
print("")
print("Expected = (-5, 10)")
print("Answer   =",cmult((1,2),(3,4)))
print("")
print("Expected = (10, 45)")
print("Answer   =",cmult((7,6),(4,3)))
print("")
print("")


#####################################
# Question 1b

def tocomplex(x1, y1):
    return x1.real + (y1*1j)    # First I do .real on the real number, the number in the tuple. Then I multiply the second number
                                # by '1j' which concatinates it into the string 1j, i then concatinate it with the first number giving
                                # the final complex number with the real part and the imaginary part 

#printing out tests to the terminal for my testing 
print("")
print("*****tocomplex TESTS*****")
print("")
print("Expected = (1+1j)")
print("Answer   =",tocomplex(1,1))
print("")
print("Expected = (100+90j)")
print("Answer   =",tocomplex(100,90)) 
print("")
print("")


#fromcomplex takes in a complex, it then creates a tuple that holds the real number and the imaginary number 
def fromcomplex(c):
    return c.real, c.imag

#printing out tests to the terminal for my testing
print("")
print("*****fromcomplex TESTS*****")
print("")
print("Expected = (2.0, 3.0)")
print("Answer   =", fromcomplex(2+3j))
print("")
print("Expected = (100.0, 300.0)")
print("Answer   =", fromcomplex(100+300j))
print("")
print("")




# END ANSWER TO Question 1
################################################################################


################################################################################
# Question 2


"""
2a. Using def, write iterative functions seqaddi and seqmulti that implement pointwise
addition and multiplication of integer sequences.
For instance
 seqaddi([1,2,3],[~1,2,2])
should compute
 [0,4,5]
You need not write error-handling code to handle the cases that sequences have different
lengths.
2b. Do as for 2a, but make your functions recursive (like OCaml).
Call them seqaddr and seqmultr.
2c. Do it again. This time use list comprehensions instead of iteration or recursion.
"""

#####################################
# Question 2a

#this helper method gets the length of the sequence, it iterates through the elements and adds 1 to the size, then returns the size 

def getLength(l1): 
    size = 0 
    for i in l1: 
        size = size+1
    return size 

#this function adds two sequences together, it iterates through using a for loop, adds the first 2 elements then the second 2 etc..
#using the getLength helper function it continues up to the length of the sequence then exits the loop and returns the total 

def seqaddi(l1, l2):
    x = []
    for i in range(getLength(l1)):
        x = x + [(l1[i]) + (l2[i])]
    return x 


#printing out tests to the terminal for my testing
print("")
print("*****seqaddi TESTS*****")
print("")
print("Expected = [2, 4, 6]")
print("Answer   =",seqaddi([1,2,3],[1,2,3]))
print("")
print("Expected = [24, 45, 65]")
print("Answer   =",seqaddi([11,22,34],[13,23,31]))
print("")
print("")


#this function multiplies two sequences together, it iterates through using a for loop, multiplies the first 2 elements then the second 2 etc..
#using the getLength helper function it continues up to the length of the sequence then exits the loop and returns the total 

def seqmulti(l1, l2):
    x = []
    for i in range(getLength(l1)):
        x = x + [(l1[i]) * (l2[i])]
    return x 

#printing out tests to the terminal for my testing 
print("")
print("*****seqmulti TESTS*****")
print("")
print("Expected = [1, 4, 9]")
print("Answer   =",seqmulti([1,2,3],[1,2,3]))
print("")
print("Expected = [60, 44, 93]")
print("Answer   =",seqmulti([6,22,3],[10,2,31]))
print("")
print("")


#####################################
# Question 2b

#this method recursivly add the sequences together, it first checks if one of the list is empty it returns the other list, as [1, 2, 3] + [] = [1, 2, 3]
#it then add the first 2 elements of the list (the head), then recursively calls seqaddr on the rest of the elements  

def seqaddr(l1, l2):
    if l1 == []:
        return l2
    elif l2 == []:
        return l1
    else:
        return [l1[0] + l2[0]] + seqaddr(l1[1:], l2[1:])

#printing out tests to the terminal for my testing
print("")
print("*****seqaddr TESTS*****")
print("")
print("Expected = [2, 4, 6]")
print("Answer   =",seqaddr([1,2,3],[1,2,3]))
print("")
print("Expected = [16, 24, 34]")
print("Answer   =",seqaddr([6,22,3],[10,2,31]))
print("")
print("")


# This method recursivly multiplies the sequences together, it first checks if one of the list is empty it returns the other list, as [1, 2, 3] * [] = [1, 2, 3]
# it then multiplies the first 2 elements of the list (the head), then recursively calls seqmultr on the rest of the elements  


def seqmultr(l1, l2):
    if l1 == []:
        return l2
    elif l2 == []:
        return l1
    else:
        return [l1[0] * l2[0]] + seqmultr(l1[1:], l2[1:])

# Printing out tests to the terminal for my testing
print("")
print("*****seqmultr TESTS*****")
print("")
print("Expected = [3, 4, 9]")
print("Answer   =",seqmultr([3,2,3],[1,2,3]))
print("")
print("Expected = [60, 44, 93]")
print("Answer   =",seqmultr([6,22,3],[10,2,31]))
print("")
print("")

#####################################
# Question 2c

#This uses list comprehension, it takes in 2 lists and returns a list of the two added lists while loops through until the length of the list
#using my helper function, 'getLength' 
def seqaddlc(l1,l2):
    return [l1[i] + l2[i] for i in range(getLength(l1))]


# Printing out tests to the terminal for my testing
print("")
print("*****seqaddlc TESTS*****")
print("")
print("Expected = [4, 4, 6]")
print("Answer   =",seqaddlc([3,2,3],[1,2,3]))
print("")
print("Expected = [11, 27, 33]")
print("Answer   =",seqaddlc([10,25,30],[1,2,3]))
print("")
print("")

#This uses list comprehension, it takes in 2 lists and returns a list of the two multiplied lists while loops through until the length of the list
#using my helper function, 'getLength'
def seqmultlc(l1,l2):
     return [l1[i] * l2[i] for i in range(getLength(l1))]


# Printing out tests to the terminal for my testing
print("")
print("*****seqaddlc TESTS*****")
print("")
print("Expected = [3, 16, 90]")
print("Answer   =",seqmultlc([3,8,30],[1,2,3]))
print("")
print("Expected = [100, 50, 18]")
print("Answer   =",seqmultlc([100,25,6],[1,2,3]))
print("")
print("")




# END ANSWER TO Question 2
################################################################################

################################################################################
# Question 3

"""
Write functions
● ismatrix
This should input a list of list of integers (henceforth an intmatrix) and test whether a list
of lists of integers represents a matrix (so the length of each row should be equal).
● matrixshape
This should input an intmatrix and return the size of the matrix, which is the number of rows and the number of columns 
(traditionally the number of rows is given first, but if you have done it the other way around that’s fine; 
just make sure to clearly explain your code). 

● matrixadd
Matrix addition, which is simply pointwise addition.
● matrixmult
Similarly for matrix multiplication.
You do not need to write error-handling code, e.g. for the cases that inputs do not represent
matrices or represent matrixes of the wrong shapes; so for instance your matrixshape may 
assume that the argument has successfully passed the test ismatrix.
Your answer can use iteration, recursion, list comprehension, or anonymous functions. You
should not appeal to any libraries, e.g. for matrix processing.  Don't use zip.
"""

def ismatrix(m):
    first = len(m[0])                         # First is equal to the length of the first part of the matrix (row)
    [] == True                                # An empty matrix is a valid matrix 
    if all(len(i) == first for i in m[1:]):   # Checking if the first is equal to the next part and so on, iterating through until the length of the matrix 
        return True 
    else:                                     # If the matrix is not equal or empty then return false, ie it is NOT a matrix 
        return False

# Printing out tests to the terminal for my testing
print("")
print("*****ismatrix TESTS*****")
print("")
print("Expected = True")
print("Answer   =",ismatrix([[3,8],[1,2]]))
print("")
print("Expected = True")
print("Answer   =",ismatrix([[1,2,3],[1,2,3]]))
print("")
print("Expected = False")
print("Answer   =",ismatrix([[1, 2, 3],[1, 2]]))
print("")
print("")

def matrixshape(m):
    rows = 0                        # Setting rows initally to 0 
    columns = 0                     # Setting columns initally to 0 
    if ismatrix(m) == True:         # While it is a valid matrix, count the rows and columns 
        for r in m:                 # Looping through the matrix until the end of the rows and adding 1 to the rows count
            rows = rows + 1         
        for c in m[0]:              # Looping through the matrix until the end of the columns and adding 1 to the columns count
            columns = columns + 1 
        return rows,columns         # Returning the rows and columns 

# Printing out tests to the terminal for my testing
print("")
print("*****matrixshape TESTS*****")
print("")
print("Expected = (3, 3)")
print("Answer   =",matrixshape([[1,2,3],[1,2,3],[1,2,3]]))
print("")
print("Expected = (2, 3)")
print("Answer   =",matrixshape([[1,2,3],[1,2,3]]))
print("")
print("Expected = (4, 2)")
print("Answer   =",matrixshape([[2,3],[2,3],[2,3],[2,3]]))
print("")
print("")


def matrixadd(m1,m2): 
    addition = []                                       # Setting addition as an empty matrix 
    if (ismatrix(m1) and ismatrix(m2)) == True:         # Checking if the matrix are valid 
             for i in range(len(m1)):                   # Using the length of the first matrix (as they're equal) to iterate to 
                addition += [seqaddr(m1[i], m2[i])]     # Recursively calling 'seqaddr' and adding to two matrices 
             return addition                            # Returning the new matrix 

# Printing out tests to the terminal for my testing
print("")
print("*****matrixadd TESTS*****")
print("")
print("Expected = [[2, 4]]")
print("Answer   =",matrixadd([[1,2]],[[1,2]]))
print("")
print("Expected = [[6, 202]]")
print("Answer   =",matrixadd([[5,200]],[[1,2]]))
print("")
print("Expected = [[11, 24]]")
print("Answer   =",matrixadd([[10,22]],[[1,2]]))
print("")
print("")
        



def matrixmult(m1,m2):
    l1 = [] # Empty list to put the matrix at the end in 
    l2 = [] # Empty list to put the other matrix in 
    for x1 in range(len(m1)):            # Looping through till the length of the first matrix 
        for x2 in range(len(m2[0])):     # Looping through till the length of the first part of the second matrix 
            sum = 0
            for x3 in range (len(m2)):   # Looping through till the length of the second matrix 
                sum = sum + (m1[x1][x3]* m2[x3][x2]) # Multiplying matrix 1 (the length of m1 & m2) with matrix (length of m2 & first element of m2)
            l1.append(sum)              # Adding the sum to the first list
        l2.append(l1)                   # Adding list 1 to the second list 
        l1=[]                           # Setting list 1 back to an empty matrix 
    return l2  # Returning the multiplied matrix 
"""
# Matrix Mult Example

[3,4,2] * [13, 9, 7, 15]
          [8 , 7, 4, 6 ]
          [6 , 4, 0, 3 ]

= [83, 63, 37, 75]

83 = (3*13) + (4*8) + (2*6)
63 = (3*9) + (4*7) + (2*4)
37 = (3*7) + (4*4) + (2*0)
75 = (3*15) + (4*6) + (2*3)


"""
# Printing out tests to the terminal for my testing
print("")
print("*****matrixmult TESTS*****")
print("")
print("Expected = [[5, 14]]")
print("Answer   =",matrixmult([[1,2]],[[1,2],[2,6]]))
print("")
print("Expected = [[7, 10]]")
print("Answer   =",matrixmult([[1,2]],[[1,2],[3,4]]))
print("")
print("Expected = [[7, 12]]")
print("Answer   =",matrixmult([[1,2]],[[1,2],[3,5]]))
print("")
print("")


# END ANSWER TO Question 3
################################################################################


###############################################################################
# Question 4


"""
Write an essay on Python data representation. Be clear, to-the-point, and concise. Convince
your marker that you understand:
● Mutable vs immutable types. Give at least two examples of each, with explanation.
● Integer vs float types.
● Assignment = vs equality == vs identity is.
● The computational effects of a call to list on an element of range type, as in
list(range(5**5**5)).
● Slices, with examples. Including an explanation of the difference in execution between
 list(range(10**10)[10:10]) and
 list(range(10**10))[10:10]
Include short code-fragments where appropriate (as I do when lecturing) to illustrate your
observations.
"""

# Mutable vs Immutable types 
"""
A mutable type can be freely modified, for example in a list or set you can change the value of one of the positions

>>> mutable_type = ['1','2','3'] # This is a list, which is mutable, we can go in and change the value of one of the positions
>>> mutable_type[2] = '4'        # Here we access the list and change the value of position 2 from 3 to 4
>>> mutable_type                 # We then print out the new list with the changed value showing it can be freely modified 
['1', '2', '4']

Mutable types have append() or add() methods allowing you to add elements to your list or set

>>> mutable_type = ['a','b','c']
>>> mutable_type.append('d')
>>> mutable_type
['a', 'b', 'c', 'd']

Mutable types also have remove() or dicard() methods allowing you to remove elements from your list or set 

>>> mutable_type = ['a','b','c']
>>> mutable_type.remove('c')
>>> mutable_type
['a', 'b']

An Immutable type cannot be freely modified, for example in a tuple or a string, you cannot modify the individual characters of a string

>>> immutable_type = ('a','b','c')  # This is a tuple of characters 
>>> immutable_type[2] = 'd'         # Here we try to change the value of the 2nd positon from 'c' to 'd'
Traceback (most recent call last):  # We then are given an error message as you cannot freely modify an immutable type 
  File "<pyshell#5>", line 1, in <module>
    immutable_type[2] = 'd'
TypeError: 'tuple' object does not support item assignment

Immutable types can be helpful however, they are useful when debugging. As the value cannot be changed you will always know the 
value has stayed the same the entire time and hasn't changed, this was you always know what it is throughout debugging as it 
is constant after it is created 

Immutable types are used when you need to guarantee that a types value or contents is not going to change 

Mutable types are used when you know that a types value or size will be modified as you go along 

"""

# Integer vs Float types
"""
An integer is a positive or negative whole number, in python 3 an integer is of unlimited size. 

>>> integer = 10
>>> type(integer)
<class 'int'>

As integers in python 3 have unlimited size the calculation will continue going without an out of bounds error. 
(As seen with this infinite loop number generator)

>>> number = 10
>>> while number > 2:
	number = number * 10000000000
	print(number)

A float is used to represent real numbers with a decimal point dividing the integer and decimal part, float can also use scientific notation
with 'E'

>>> float = 1.0
>>> type(float)
<class 'float'>

"""


# Assignment = vs equality == vs identity
"""
*Assignment* - In python you don't need to assign variables to a type, python does that for you based on the variable. You can assign a variable
using '=' as shown below. 

I assign the variable 'x' to 5, python assumes this is an integer 
>>> x = 5
>>> type(x)
<class 'int'>

I assign the variable 'y' to string 'word' , python assumes this is a string
>>> y = 'word'
>>> type(y)
<class 'str'>

I assign the variable 'i' to the list ['a','b','c'], python assumes this is a list 
>>> i = ['a','b','c']
>>> type(i)
<class 'list'>

I assign the variable 'j' to the tuple (1,2,3), python assumes this is a tuple
>>> j = (1,2,3)
>>> type(j)
<class 'tuple'>

This is unlike other languages such as Java where you must state the type of the variable when assinging it.

---Java---
int x = 5 
----------

In python the variable named on the left should not refer to the value named on the right.

>>> x = 100 -- This sets the variable x to 100 (x refers to integer 100)
>>> y = x   -- This sets the variable y to the value of x (y now refers to integer 100)
>>> x = 200 -- This sets the variable x to 200 (x now refers to integer 200, but y still refers to integer 100)
>>> print(y)
100         -- The value of y is 100 not 200, as there were orginally orginally 1 reference to integer 100 (x), then 2 (y)
               then when x was refered to integer 200, y's reference to integer 100 still remained.

*Equality* 

In python we use the double equals '==' to mean equality. We use equality to check if two variables contain the same thing 

>>> x = 10  -- Here we assign the variable x to the integer 10
>>> y = 10  -- Here we assign the variable y to the integer 10 
>>> x == y  -- Here we check if x and y are equal to eachother 
True        -- Python returns that the statement is true

Equality is most commonly used in if statements to check if one value is equal to another value allowing you to enter the if statement.

>>> word = 'This is equal'
>>> if word == 'This is equal':
	print(word)
This is equal

*Identity*

In python we use identity to see if one object is the same as another object. 

>>> num1 = 10       -- Here we assign the variable num1 to the integer 10 
>>> num2 = 5        -- Here we assign the variable num2 to the integer 5
>>> num1 = num2     -- Here we assign the variable num1 to the variable num2
>>> num1 == num2    -- Here we check if they are are equal using '=='
True                -- They are equal 
>>> num1 is num2    -- Here we check their identity 
True                -- They have the same identity 
>>> id(num1)        -- Checking they have the same id in memory 
1671219184
>>> id(num2)
1671219184

>>> list1 = [1,2,3]   -- Here we assign the variable list1 to the list [1,2,3]
>>> list2 = [1,2,3]   -- Here we assign the variable list2 to the list [1,2,3]
>>> list1 == list2          -- Here we check if they are equal using '=='
True                        -- They are equal 
>>> list1 is list2          -- Here we check if they have the same identity 
False                       -- They do not, their values are the same but they don't have the same identity as we did not assign them to eachother
>>> id(list1)               -- Upon checking their id's we see they don't have the same identity
48994536
>>> id(list2)
55326696

"""


# The computational effects of a call to list on an element of range type
"""
Python's range function generates a list on numbers, in python 3 when using range in a for loop, it generaters the next number after each iteration of the for loop
unlike python 2 where it generated the whole sequence before the for loop was executed. The new way tends to be faster at generating larger amounts
of data however the range function is still not very efficent when handling large data.

When calling the function below we are given an error, as the data is too large. This is because it is taking up too many memory locations.
>>> x = list(range(5**5**5))
Traceback (most recent call last):
  File "<pyshell#15>", line 1, in <module>
    x = list(range(5**5**5))
OverflowError: Python int too large to convert to C ssize_t

When calling this function the output is very large however python is able to compute this as it is 1 (large) number stored in memory 
>>> list3 = range(5**5**5)

When calling the function below you are given an error as python is creating a new memory location for every element leading up to the final value
of (5**5**5) as shown below. This is much more memory than python is able to compute and thus an error is given
[0,1,2,3,4,5,6,7,8,9........]
>>> x = list(range(5**5**5))
"""


# Slices
"""
Slicing is used to seperate a 'slice' from a list or string. Here I create a new list, and then create a slice from the index position 3 up to but not including the index position 6

>>> list = [0,1,2,3,4,5,6,7,8,9]
>>> list
[0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
>>> list[3:6]
[3, 4, 5]


list(range(10**10)[10:10]) vs list(range(10**10))[10:10]

There is a subtle differnce between the 2 pieces of code that create a very different effect on memory 

-- list(range(10**10)[10:10]) - This list is created with the slice first, meaning the list (10**10) is created from the start point [10:10],
which is an empty list, this is the more efficent way to code as it is alot more efficent on memory thus the time to complete this code is much
quicker. 

>>> x = list(range(10**10)[1:11]) # Here I create a slice of [1:11] to show the whole list 
>>> x
[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

-- list(range(10**10))[10:10] - This list is created first then the slice is made, meaning the list (10**10) is created, using up lots of memory
then the slice [10:10] is created from this list, which is an empty list. This way is very inefficent and takes alot longer to complete 

>>> y = list(range(10**10))[1:11]       # When trying the second method I am given an error as the list uses too much memory 
Traceback (most recent call last):
  File "<pyshell#3>", line 1, in <module>
    y = list(range(10**10))[1:11]
OverflowError: Python int too large to convert to C ssize_t

>>> z= list(range(9**9))[1:11]          # Another error is given when trying to create a smaller list (9**9)
Traceback (most recent call last):
  File "<pyshell#4>", line 1, in <module>
    z= list(range(9**9))[1:11]
MemoryError

"""




# END ANSWER TO Question 4
################################################################################


###############################################################################
# Question 5
print()
print('Question 5')

"""
Write a general encoding function encdat that will input an integer, float, complex number, or
string, and return it as a string.

So
• encdat(-5) should return '-5'
• encdat(5.0) should return '5.0'
• encdat(5+5j) should return '5+5j' (not '(5+5j)'; see hint below).
• encdat('5') should return '5'


"""


def encdat(dat):
    string = str(dat)
    if type(dat) == type(5+5j):    # Checking if the type of 'dat' is equal to the input we are looking for
        string = string.strip("(") #'.strip' is used to remove the leading and tailing spaces around a string 
        string = string.strip(")") # This removes the tailing bracket 
    return string 

print("")
print("*****encdat TESTS*****")
print("")
print("Expected = -5")
print("Answer   =",encdat(-5))
print("")
print("Expected = 5+5j ")
print("Answer   =",encdat(5+5j))
print("")
print("Expected = 10.0 ")
print("Answer   =",encdat(10.0))
print("")
print("")

# END ANSWER TO Question 5
################################################################################


###############################################################################
# Question 6


"""
An encoding f of numbers in lists is as follows:
• f(0) = [] (0 maps to the empty list)
• f(n+1) = [f(n),[f(n)]] (n+1 maps to the list that contains f(n) and singleton f(n))
Implement encode and decode functions in Python, that map correctly between nonnegative
integers and this representation. Call them fenc and fdec.
"""
#applys the function n times

def fenc(i):
    if i == 0:      # If the function given is 0, it returns an empty list 
        return []   # Returning the empty list 
    else:
        return [fenc(i-1),[fenc(i-1)]] # Returning the empty list after the fucntion is applied i number of times  

print("")
print("*****fenc TESTS*****")
print("")
print("Expected = []")
print("Answer   =",fenc(0))
print("")
print("Expected = [[[], [[]]], [[[], [[]]]]]")
print("Answer   =",fenc(2))
print("")
print("Expected = [[[[], [[]]], [[[], [[]]]]], [[[[], [[]]], [[[], [[]]]]]]]")
print("Answer   =",fenc(3))
print("")
print("")


def fdec(l):
    if l == []: # If an empty list is given then the function just returns 0 
        return 0
    else:
        return  1 + fdec(l[0]) # Returning the amount of times you have applied i 

print("")
print("*****fdec TESTS*****")
print("")
print("Expected = 0")
print("Answer   =",fdec([]))
print("")
print("Expected = 1 ")
print("Answer   =",fdec([[], [[]]]))
print("")
print("Expected = 2 ")
print("Answer   =",fdec([[[], [[]]], [[[], [[]]]]]))
print("")
print("")



# END ANSWER TO Question 6
################################################################################


###############################################################################
# Question 7


"""
Implement a generator cycleoflife such that if we assign
 x = cycleoflife()
then repeated calls to
 next(x)
return the values
 eat
 sleep
 code
 eat
 sleep
 code
 ...
in an endless cycle. If you can’t manage an endless cycle, do a program that runs for 1000
cycles then stops.
Note that this question is not asking you to program an endless loop that prints these values.
In effect, I am asking you to implement what is called a stream (infinite list)
 x = [eat, sleep, code, eat, sleep, code, ...].
This does not mean the whole infinite datastructure is in memory at any time (which is 
impossible for a machine with finite memory), but for any finite but unbounded number of calls 
to next your generator behaves as if it were the infinite datastructure illustrated above.
"""

"""
Here I create a generator that prints 'eat sleep code', first I set it to while true, this will continue to print while 
the statement is set to true. With the first call to cycleoflife() it runs the code until it hits yield, it then returns the first 
value of the loop 'eat', as it is set to true, it will print  is called it returns the next value.
 
"""
"""
To run:

    cycle = cycleoflife()
    while: True 
        next(cycle)
"""

def cycleoflife():
    while True:         # This creates a generator 
        yield("eat")    # printing 'eat'
        yield("sleep")  # printing 'sleep' 
        yield("code")   # printing 'code' 
   


print("")
print("*****cycleoflife TESTS*****")
print("")
print("Expected to print out 'eat sleep code' 3 times")
print("")
cycle = cycleoflife()
print(next(cycle))
print(next(cycle))
print(next(cycle))
print(next(cycle))
print(next(cycle))
print(next(cycle))
print(next(cycle))
print(next(cycle))
print(next(cycle))
print("")
print("")




# END ANSWER TO Question 7
################################################################################


#################################################################################
# Question 8

"""
Call a *datum* something that is either an integer, or a list of data (datums).

Write a flatten function gendat that converts a datum to a list of integers.

So
- gendat(5) should return [5]
- gendat([])should return []
- gendat([5,[5,[]],[],[5]]) should return [5,5,5]

Do not use str.  You may find it useful to consider isinstance or the following code fragment
   type(5) == type([]) 

"""


def gendat(datum):
    newList = []                            # Here I am creating a new list to add the elements to 
    if isinstance(datum, int):              # If the datum is an integer, we add it straight to the list 
        newList.append(datum)
    else:
        isinstance(datum, list)             # Moving deeper into the list
        for x in datum:                     # Iterating through the elements in the list 
           if isinstance(x, int):           # If it's an integer, we add it to the new list 
               newList.append(x) 
           elif isinstance(x, list):        # Moving deeper into the list of lists 
               for y in x:                  # Iterating through the list of lists 
                   if isinstance(y, int):   # If it's an integer we add it to the new list 
                       newList.append(y)
                   else:
                       newList += gendat(y) # Recursivly moving deeper into the list of lists 

        
    return newList                          # Returning the new flattened list 

print("")
print("*****gendat TESTS*****")
print("")
print("Expected = []")
print("Answer   =",(gendat([])))
print("")
print("Expected = [5, 5, 5] ")
print("Answer   =",(gendat([5,[5,[]],[],[5]])))
print("")
print("Expected = [5] ")
print("Answer   =",(gendat(5)))
print("")
print("")

# END ANSWER TO Question 8
################################################################################


##########################################################
# Question 9

"""
Implement the Sieve of Eratosthenes
 https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes
as a Python generator eratosthenes such that if we assign
 x = eratosthenes()
then repeated calls to
 next(x)
return the primes, starting from 2.
"""

def eratosthenes():
    pass



# This is not an endless generator (like you're asked to programme) this will only get primes upto the passed input or 40000
def eratosthenes(z=40000):
    # create an array of true values the size of z
    A = [True] * z
    # iterate over each value to z squared
    for x in range(2, int(z ** 0.5)):
        # if A[x] has a true value
        if A[x]:
            # iterate over a range starting from x*2 ending at z in jumps of x
            for z in range(x * 2, z, x):
                # set anything in the range to false
                A[z] = False
    # iterate over the array
    for y in range(2, len(A)):
        # if a value is true that index is a prime number
        if A[y]:
            # yield the current iterator location as it is a prime
            yield y




# END ANSWER TO Question 9
################################################################################
