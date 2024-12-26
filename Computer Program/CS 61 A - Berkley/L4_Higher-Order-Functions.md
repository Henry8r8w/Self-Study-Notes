### The Purpose of Higher-Order Functions
- Functions are first-class: function can be manipulated as values in our programming lanaguage
- Higher Order Function: a function that takes a function as an argument avlue or return a function as a return value
  - Express general methods of computation
  - remove repetition from programs
  - seperate concerns among functions

### Functions as Return Values
- Funciotns defined within other function bodies are bound to names in a local frame
  - make_adder(n)(k); operator(n)(operand(n))
```python
def make_adder(n):
    """Return a function that takes on K and return K + N
    >>> add_three = make_adder(3)
    >>> add_three(4)
    7
    >>> make_adder(2000)(13)
    2013
    """
    def adder(k):
        return k + (n)  # notice how adder function uses parameter from its parent function and takes on its own function
    return adder    # our param returned is n when adder is created and n + k if it is called and given a k that is customizable


```
Demo on the approximation of pi
```python
from operator import mul
def pi_term(k):
    return 8/ mul(4*k-3, 4*k -1)

summation(1000000, pi_term) #3.14159

def summation(n, term):
    """Sum the first N terms of a sequence.

    >>>summation(5, cube)
    225
    """
    total, k = 0, 1
    while k<=n:
        total, k = total + term(k), k +1    # term() is a term bound to a function that does the evaluation given k
    return total
```
### Higher-Order Functions
- Generalizing Over Computational Processes
```python
def sum_naturals(n):
    """Sum the first N natural numbers.
    >>> sum_naturals(5)
    15
    """
    total, k = 0, 1
    while k <= n:
        total, k = total + k, k + 1
    return total

def sum_cubes(n):
    """Sum the first N cubes of natural numbers
    >>> sum_cubes(5)
    225
    """
    total, k = 0, 1
    while k<=n:
        total, k = total + pow(k,3), k +1
    return total
----------------------
def identity(k):
    return k
def cube(k):
    return pow(k,3)
def summation(n, term):
    """Sum the first N terms of a sequence.

    >>>summation(5, cube)
    225
    """
    total, k = 0, 1
    while k<=n:
        total, k = total + term(k), k +1    # term() is a term bound to a function that does the evaluation given k
    return total
def sum_naturals(n):
    """Sum the first N natural numbers.
    >>> sum_naturals(5)
    15
    """
    return summation(n, identity)
def sum_cub(n):
    """Sum the first N natural numbers.
    >>> sum_naturals(5)
    15
    """
    return summation(n, cube)   # higher order function: function that takes anotehr function as argument
```
- Generalizing Patterns with Arguments
  -  Assert statement
     - assert 3>2, 'math is broken'; assert boolean_statement, else_exrpression
```python
def area(r, shape_constant):
    assert r > 0, 'R length must be positve'
    return r*r*shape_constant
def area_sqaure(r):
    return area(r, 1)
def area_circle(r):
    return area(r,pi)
def area_hexagon(x):
    return area(r, 3*sqrt(3)/2)
```

### Control Expression
- Logical Operators:
    - A and B
    - Eval A first
      - If A is False, the expression evaluate to False
      - If A is True, then evaluate to the value of B
    - A or B
    - Eval A first
      - If A is true, the expression evaluate to True
      - If A is False, the expression evaluates to the value of B
```python
from math import sqrt
def has_big_sqrt(x):
    return x > 0 and sqrt(x)>10 # the adding of x >0 help us not crash the program, and it is obious that - ngative has not real square root

def reasonable(n):  # a convient tool to test the reasonability in the number without crashing
    return n == 0 or 1/n !=0
reasonable(10000000000) # True
reasonable(10**1000)    # False, becuase 1/ (10**1000) would give us 0.0 s.t. it represents of math that can't be evaluated
```
### Control
Structure of if-else clause -->transform into? --> one line call exrepssion if_(header, if suite, else suite)
```python
if____: # if header
    ____    # if suite_1
else:
    ____    # else suit

# implementation of the call expression
from math import sqrt
def if_(c,t,f):
    if c:
        return t
    else:
        return f
def square_root(x):
    if_(x>=0,sqrt(x),0) # but this example creates an error for negative value, becuase call expression does not skip value evaluation; thus, function can be more useful than just call expression in your programming
```
### Iteration Example
```python
def fib(n):
    """Compute the nth Fibonacci number, for N>=1."""
    pred, curr = 0,1    # 0th and 1st Fibonacci numbers
    k = 1               # curr is the kth Fibonacci number (k is a pointer)
    while k<n:
        pred, curr = curr, pred + curr
        k += 1
    return curr
```


