### Erros & Tracbacks
pass
### Abstraction
Sometiems, long name do be better for code codumentation
- average_Age = average(age, students) is preferebal to aa = avg(a, st)
With compound expression, it's only thus case, that value derseves a name
```python
# compound expression
if sqrt(square(a) + squar(b)) > 1:
    x = x+ sqrt(square(a)+ square(b))

# reduced version: easier to read
hypotenuse = sqrt(square(a) + square(b))
if hypotenuse > 1:
    x  = x + hypotenuse
```

With naming, you should convey their effect (print), behavior (tirple), or the value returned (abs)
ex. 
- From:  trus_flase
- To: rolled_a_one

- From: d
- To: dice

- From: play_helper
- To: take_turn

Functinoal abstraction is giving a nmae to some computational process, and then referring to that process as a whole without implmenetation detail
```python
def square(x):
    return mul # alternate approach: mul(x, x-1)+ x, pow(x,2)
def sum_square(x,y):
    return square(x)+ square(y) 
'''
What does sum_squares need to know about square?
- Square takes on egaumrnet
- Square does not have the intrinsic name square
- Square computes the square of the number
- Square does not need to know square call mul (implmentation does not matter)
'''
```
### Return (!)
```python
def search(f):
    x = 0
    while not f(x):
        x+=1
    return x
def is_three(x): #brute force search method for is_three?
    return x == 3
def square(x): 
    return x*x
def positive(x): # brute force search method for an x with its square greater than 100 using the fact that 0 is a false value
    return max(0, square(x) - 100)

def inverse(f):
    """Return g(y) such that g(f(x)) --> x"""
    return lambda y: search(lambda x: f(x) == y) 
    # return a lambda function result given y (->256) that is a function of search method (-> x++ until condition met; e.g. f(x) = y) with parameter of a function given an x such that f(x) (->sqaure(x)) is equal to y (->256)

sqrt = inverse(square)
square(16)  # 256
sqrt(256)   # 16

result = search(positive)
print(result)  # Output: 11 (since 11^2 = 121 > 100)

```
A return statement completes the evaluation of a call expression and provides its value f(x) for user-defined function f: switch to a new enviroment; execute f's body

return statement within f: switch back to the previous enviroment; f(x) now has a value

Only one return statement is ever executed while exceuting the body of a function
```python
def end(n, d):
    """Print the final digits of N in reverse order until D is found
    >>> end(34567, 5)
    7
    6
    5
    """
    while n > 0:
        last, n = n %10, n // 10    
        prin(last)
        if d == last:
            return None

# 34567 % 10 -> 7, 34567 / 10  -> 3456.7, 34567// 10 -> 3456
# 3456 % 10 -> 6, 3456 / 10  -> 345.6, 3456 // 10 -> 345
# 345 % 5 -> 6, 345 / 10  -> 34.5, 345 // 10 -> 34

```
### Lamda Funciton Enviroment
```python
# global frame: 
    # a -> 1
    # f -> func f(g) [parent = Global]
# f1: f [parent = Global]:
    # g -> func lambda(y) [parent = Global], line 5
    # a -> 2
    # return value -> func lambda(y) [parent = f1], line 4

# f2 lambda <line 4> [parent = f1]
    # y -> 1
    # return value -> 4

# f3 lambda <line 5> [parent = Global]
    # y -> 1
    # return value -> 2

a = 1   # line 1
def f(g): # line 2
    a = 2   # line 3
    return lambda y: a*g(y) # line 4
f(lambda y:a+y)(a) # line 5

# note f(lambda y:1+y)(2); note the lambda function is in global frame; lambda y:1+y  evaluate to y = y:1 + a:1 becuase y is not specified so only a as the global variable is referred
```