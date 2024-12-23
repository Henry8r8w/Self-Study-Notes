### Curying
- Defintion: Transofmring a multi-argumetn function intoa single-argument, higher order function
  - Discovered by Moses Schoenfikel and re-discovereed by Haskell Curry
```python
def make_adder(n):
    return lambda k: n + k
add(2,3)
make_adder(2)(3)
# General relationship beween the functions: make_adder(2)(3)...add(2,3)

def curry2(f):
    def g(x):
        def h(y):
            return f(x, y)
        return h
    return g
from operator import add
m = curry2(add)
add_three = m(3)
add_three(20)   # 23

curry2 = lambda f: lambda x: lambda y: f(x,y) # curry2 can be rewirtten as a lambda function f: a function that takes x, which is also still a function that takes y, which is still a function but now return f(x,y) 
```
### Lambda Expressions
```python
x = 10
sqaure = x*x
x # 10
square # 100
square = lambda x: x*x
square(10) # 1000

(lambda x: x*x)(3) # a direct call on the lambda function

#note: lambda function has no return keyword, must be a single expression (its limit)
```

### Function Composition
```python
def make_adder(n):
    def adder(k):
        return k + n
    return adder

def square(x):
    return x*x
def triple(x):
    return 3*x
def compose1(f,g):
    def h(x):
        return f(g(x))
    return h

square(5)
triple(5)
squiple = compose1(square, triple)(5) # (5*3)^2
compose1(square, make_adder(2))(3) # (2+3)^2
```

### Local Names
```python
def f(x,y):
    return g(x)

def g(a):
    return a + y
f(1, 2)     # Error: global name y is not defined
```
### Enviroment for Nested Definitions
```python
def make_adder(n):
    def adder(k):
        return k + n
    return adder
add_three = make_adder(3)
add_three(4) # 7
```

### Enviroment Enable Higher-Order Functions
Higher-order function: A function that takes a function as an argument value or returns a function as a return value
- Enviroment Diagram handle the case of higher-order functions

```python
def apply_twice(f, x):
    return f(f(x))
def square(x):
    return x*x
apply_twice(square, 3)  # 81
```
