### Decorator
Decorator function with another function bounded to the name of original fucntion
- Pro: nice to visulaize what decoration has been done to the function 
```python

def trace1(fn):
    """Return a version of fn that first prints before it is called. fn - a function of 1 argument
    """
    def tracend(x):
        print('calling', fn, 'on argument', x)
        return fn(x)
    return tracned

@trace1
def square(x):
    return x*x

square(12) # calling <function square at memoery lcoation > on argument 12
144

# same effect can reproduce with square = trace1(square)

def sum_squares_up_to(n):
    k = 1
    total = 0
    while k <= n:
        total, k = total+square(k), k +1
    return total


```

## Implementing Functions
Refer to a PDF version of notes (requires handdrawing)
### Midterm 1 Review
Refer to a PDF version of notes (requires handdrawing)