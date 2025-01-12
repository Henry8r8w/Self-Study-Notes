### Iteration
```python
# demo
i, total = 0, 0
while i < 3:
    i += 1
    total+=i # total is the sum of i: n(n+1)/2
print('i:',i, 'total:', total)
```

### Conditional Statement
- Execeution of conditional statements:
1. Evaluate the header's expression
2. If it is a true value, execute the suite (the sequence of statement under header) & skip the remaining clases
- A statement is executed by the interpreter to perform an action
```python
def absolute_value(x):
    """Return the absolute value of x."""
    if x < 0:
        return -x
    elif x == 0:
        return 0
    else:
        return x
# notice how the boolean values are evaluated only on the if and elif statements

# note: to initialize the program, cd to the working directory and use python3 -i your_program.py
```
### Miscellanous Python Features
- Default Value
```python
def divide_exact(n,d = 10):
    """Return the quotietn adn the remainder of diviing N by D
    
    >>> q, r = devide_exact(2013,10)
    >>> q
    201
    >>>r
    3
    """
    return n//d, n % d
q, r = devide_exact(2013)   # python knows that d is 10

```
- It is a common practice to write doc string and test it with python3 -m doctest -v yourscript.py where if you gave a wrongly expected output in the string itself, your doctest will tell you so. It's something to tryout during homework problems. FYI: without -v, there will be no visual dispaly, but if nothing appear, that still mean the function works
```python
def divide_exact(n,d):
    """Return the quotietn adn the remainder of diviing N by D
    
    >>> q, r = devide_exact(2013,10)
    >>> q
    201
    >>>r
    3
    """
    return n//d, n % d
```
- / division (from operator import truediv), // integer division (from operator import floordiv)
- % leavs us the remainder