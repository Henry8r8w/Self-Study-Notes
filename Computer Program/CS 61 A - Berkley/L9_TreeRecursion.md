### Exmaple: Counting Partitions
Definition: the number of ways n is able to be parts up to size m, where m < n for always. ex. (n = 3, m = 2)  -> {111, 12}, which makes the partition 2
```python
def count_partitions(n, m):
    if n == 0:
        return 1
    elif n < 0:
        return 0
    elif m == 0:
        return 0
    else:
        with_m = count_partitions(n - m, m)
        without_m = count_partitions(n, m - 1)
        return with_m + without_m
```


### Tree Recursion
```python
from ucb import trace # visualize with the tree
def fib(n):
    if n == 0:
        return 0
    elif n == 1:
        return 1
    else:
         return fib(n-2) + fib(n-1)
```

### Example: Inverse Cascade ?
```python
def inverse_cascade(n):
    grow(n)

    print(n)

    shrink(n)

def f_then_g(f, g, n):
    if n:
        f(n)
        g(n)
grow = lambda n: f_then_g(grow, print, n //10)
shrink = lambda n: f_then_g(print, shrink, n//10)
```

### Order of Recusrive Calls
```python
def cascade(n):
    if n < 10:
        print(n)
    else:
        print(n)
        cascade(n//10)
        print(n) # print the n stored at the cascade frame
# output: 
123
12
1
12
123
#

'''
global frame: cascade(n)
cascade frame: n= 123
print(123) # no reuturn None, b/c we are only reaching the n// 10 part
cascade frame: n= 12
print(12)   # no return None, b/c we are only reaching the n // 10 part
print(1), return None
print(12) - cascade(n = 12) removed, return None
print(123) - cascade(n = 123) removed, return None; global frame cascade points to cascade(n) function
'''

# shorter equivalent
def cascade(n):
    print(n)
    if n > 10:
        cascade(n//10)
        print(n)
'''
print(123)- casade( n: 123 )
print(12) - cascade(n:123 // 10)
print(1)
print(cascade(n:12)) # now remove the cascade(n = 12)
print(cascade(n:123)) # now remove the cascade(n = 123)
'''
```
