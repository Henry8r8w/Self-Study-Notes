### Print and None
- Pure Functions: just return values
- Non-pure Functions: have side-effect (behaviour of the function)
    ex. print()
```python
print(print(1), print(2)) 
1
2
None None # the eval of the print(1), print(2) by print()

# example from lab01
>>> def welcome():
...     print('Go')
...     return 'hello'
>>> def cal():
...     print('Bears')
...     return 'world'
>>> welcome()
Go
'hello'
>>> print(welcome(), cal()) # eval the call statement first, then the print statement
Go 
Bears
hello worlrd
```
- None is nothing; you can print(None)
```python
def deost_not_square(x):
    x*x
does_not_square(4)  #None
sixteen = does_not_square(4)    # sixteen = None
sixteen +4  #Typeerror: addingi a Nonetype and int
```
### Defining Functions
- Calling User-Defined Functions
    - **Procedure for calling/applying user-defined funcitons (version 1)**
        1. Add a local frame, forming a new enviroment
        2. Bind the function's formal parameter to it arguments in that frame
        3. Exceute the body of the function in that new enviroment
   
- Assignment is a simple means of abstraction: binds names to values
- Function definition is a more powerful means of abstraction: binds names to expressions
```python
from operator import mul
def square(square):
    return mul(square, square)

square  # view of info on square: <function square at 0x102dc1940>; note that 0x120dc1940 is the memory address
square(-2) # 4; it works b/c square in a local varaible within square function 


# Global frame: mul -> func mul(...), square -> func square(square)
# Local frame (square): square = -2, where -2 bind the the formal parameter of square function
```

```python
def <name>(<formal parameters>): # function signature: indicates how many arguments a function takes
    return <return expression>  # function body defines the computational process expressed by a function

```

### Enviroment Diagrams
- Allow us to keep on track what is going on within the python program
    - alot of computer scientist like to draw boxes and arrow point to another boxes
- Code on the left and frames on the right
  - Code: 1. contains statements and expressions 2. arrows indicate evaludation order
    - note: using python tutor, the gray arrow denote the exceuted and the red arrow denote the next executing
  - Frame: 1. Name bound to value, where the name cannot be repeated

https://pythontutor.com/python-compiler.html#mode=edit
```python
a = 1   # Global frame -> a:1
b = 2   # Global frame -> a:1, b:2
b,a = a+b, b    #Global frame -> a:2, b:3

```
### Names, Assignment and User-Defined Functions
- Discussion Quetion 1
```python
f = min # f is assigned to min built-in function
f = max # f is re-assigned to a max built-in function
g,h = min, max  # g is min built-in funiction, h is max built-in function
max = g         # max name is assign with g, which is a min built-in funciton
max(f(2,g(h(1,5),3)),4) # 3

```
- Types of Expression
  - Primitive: Numeral(ex. 2,3), Name (ex. max_of, mul_of), String(ex. 'hello')
  - Call expressions: operator (operand, operand)
    - An operand can also be a call expression
- def statement allow us to create a customized function
```python
from operator import mul, add
from math import pi, sin
def square(x):
    return mul(x,x)

square(add(3,4))    # 49

def sum_square(x,y):
    return square(x) + square(y)

sum_square(3,4)     #25

def area():
    return pi*(radius**2)
radius = 20
area()      # pi*20*20
radius = 10
area()      # pi*10*10
```
- Assignment statement
ex.2
```python
max(1,2,3)  # 3
f = max     # given max is a built-in function, f would be the alias for that built-in function
f(1,2,3)    # 3

max = 7     # we want a user-defined max; f makes it easy for us to not confuse ourself with the max()
f(1,2,max)  # 7
max         # 7

max = f     # reassign out built-in function back to max

```
ex.1
```python
radius = 10
area, circ = pi*radius*radius, 2*pi*radius
area    # 314.159-
circ    # 62.831-
radius = 20
area    # 314.159-; notice how there is no update to the area, since it was not redefined
```

- An import statemnet can make name and function availablie
ex.
from math import pi, sin
    - allow pi name and sine function availble
  