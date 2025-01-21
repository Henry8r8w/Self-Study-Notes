### Recursion and Iteration
Notice how recursion's return sum_function(param) + last_sum can be interpret as return of 'what's left to sum' + 'partially summed'

Iteration is a special case of recursion
- Idea: figure out what state must be maintained by the iterative function

```python
def split(n):
    return n// 10, n %10 # ex. 3, 2 = split(32)
def sum_digits(n):
    """Return the sum of the digits of positive integer n"""
    if n < 10:
        return n
    else:
        all_but_last, last = split(n) 
        return sum_digits(all_but_last) + last 

# Since iteration is a special case of recursion, it should be simple or one to convert an iteration into a recusion
def sum_digits_iter(n):
    digit_sum = 0
    while n > 0:
        n, last = split(n)
        digit_sum = digit_sum +last
    return digit_sum

def sum_digits_rec(n, digit_sum):
    if n ==0:
        return digit_sum
    else:
        n, last = split(n)
        return sum_digits_rec(n, digit_sum + last)
# notice how the arguments in the recursive call are the updated assignments (states) in the iterative method
```


### Mutual Recursion
- mutual recursion occurs when two recurve function referring each other
The Luhn Algorithm
1. From the rightmost digit, which is the check digit, moving left, double the value of every second digit; if product of this doubling operation is greater than 9 (e.g., 7*2 = 14), then sum the digits of the product(e.g., 10: 1+ 0 = 1, 14: 1 + 4 = 5)
2. Sum of all the digits and check if it is equal to expected digit

The luhn sum of a valid credit card number is a multiple of 10
```python
def split(n):
    return n// 10, n %10 # ex. 3, 2 = split(32)
def sum_digits(n):
    """Return the sum of the digits of positive integer n"""
    if n < 10:
        return n
    else:
        all_but_last, last = split(n) # n// 10, n %10
        return sum_digits(all_but_last) + last # adding the partial sum, which is the sum of the digits themselves
def luhn_sum(n):
    if n < 10:
        return n
    else:
        all_but_last, last = split(n)
        return luhn_sum_double(all_but_last) + last
        
def luhn_sum_double(n):
    all_but_last, last = split(n)
    luhn_digit = sum_digits(2*last) # double the digit
    if n < 10:
        return luhn_digit
    else: 
        return luhn_sum(all_but_last) + luhn digit

```
### Verifying Recursive Functions
- It's all leap of faith when you write recursion; but your base case is one of the first thing to verify 
1. Verify base case (know how you expect the last step of the function)
2. treat fact as a functional abstraction (think in english, less math and programming)
3. assume that fact(n-1) is correct
4. verify that fact(n) is correct, assuming that fact(n -1) is correct
```python
def fact(n):
    if n == 0:
        return 1
    else:
        return n * frac(n-1) 
fact(3)
```

### Recursion in Environment Diagram
```python
# Global_Frame:                                     Object:
    fact ptr1                                       ptr1..N: func fact(x) [parent = Global]
f1: fact [parent:Global] (x:3, return: 3*2*1 = 6)
f2: fact [parent:Global] (x:2, return: 2*1 = 2)
f3: fact [parent:Global] (x:1, return: 1*1 = 1)
f3: fact [parent:Global] (x:0, return: 1*1 = 1)

# recursion reduces the variables to track the computation; less names in environment diagram
def fact(n):
    if n == 0:
        return 1
    else:
        return n * frac(n-1) # names: n, fact
fact(3)
'''
fact(3)
    -> 3*fact(2)
fact(2)
    -> 3*(2*fact(1)) 
fact(1) 
    -> 3*(2*(1*(fact(0))))
fact(0)
    -> 3*(2*(1*(1)))

let [] denote next step functional expression exclusion
(fact)(3)* n:[3])((fact(2)* n: [2] (((fact(1)* n: [1])(n:[0 -> 1] ))))
'''

def fact_iter(n):
    total, k = 1, 1
    while k <= n:
        total,k = total*k,  k+1
    return total # names: total, k, n, fact_iter
```
The math: 
- while loop: $ n! = \prod^{N}_{i}$
- recursion:
$$  n! = \begin{cases}
1 & \text{ if n = 0}
n*(n-1)! & \text{ otherwise}
$$

### Recursive Functions
**Sum Digits Without a While Statement**
```python
def split(n):
    """Split positive n into all but its last digit and its last digit"""

    return n//10, n %10
def sum_digits(n):
    """Return the sum of the digits of positive integer n."""
    if n < 10: # base case
        return n # non-recursive call
    else: # recursive call
        all_but_last, last = split(n)
        return sum_digits(all_but_last) + last
sum_digits(1234) # 10
'''
sum_digits(1234)
    -> 123, 4 = split(1234)
sum_digits(123) + last: 4
    -> 12, 3 = split(123)
sum_digits(12) + last: 3
    -> 1, 2 = split(12)
sum_digits(1) + last: 2
    -> n:1 

let [] denote next step functional expression exclusion
sum_digits(123)(sum_digits(12) + last: [3] (sum_digits(1) + last: [2] (n:[1] ))) + last: [4]

'''
```

**Digit Sums**
- If a number a is divisible by 9, then digit_sum(a) is also divisible by 9
- Useful for type detection
  - recall: multiplication is a form of repeated addition
    - ex. 18 (any combo) is multiple of 3 and we want a remainder of 3 in the digit sum -> 21, for 21 // 3 = 6 and 21 % 3 = 3
  
Definition: a function is called recursive if the body of that function calls itself, either directly or indirectly

### Self-Reference
```python
# Global_Frame:                                     Object:
    print_all ptr1                                  ptr1..N: func print_all(x) [parent = Global]
f1: print_all [parent:Global] (x:1, return: ptr2)
f2: print_all [parent:Global] (x:2, return: ptr3)
f3: print_all [parent:Global] (x:3, return: ptr4)


def print_all(x):
    print(x)
    return print_all    # due to the return of the  print_all function, each of the reference to the global frame print_all(x) has been asked
print_all(1)(2)(3) 
1
2
3
def print_sums(x):
    print(x)
    def next_sum(y)
        return print_sum(x+y)
    
print_sums(1)(3)(5)
1
4
9
# all the print statement was done by print(x), but x gets updated each time
```
