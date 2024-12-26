### Mutual Recursion
The Luhn Algorithm
1. From the rightmost digit, which is the check digit, moving left, dobule the value of eery second digit; if product of this doubling operation is greater than 9 (e.g., 7*2 = 14), then sum the digits of the product(e.g., 10: 1+ 0 = 1, 14: 1 + 14 = 5)
2. Sum of all the digits and check if it is equal to expected digit
```python


```
### Verifying Recursive Functions
- It's all leap of faith when you write recursion; but your base case is one ofthe first thing to verify 
1. Verify base case
2. treat fact as a fucntional absraction
3. assume that fact(n-1) is correct
4. verify that fact(n) is correct, assuming that fact(n -1) is correct
```python
def fact(n):
    if n == 0:
        return 1
    else:
        retunr n * frac(n-1) 
fact(3)
```

### Recursion in Enviroment Diagram
```python
# recurision reduces the variables to track the computation; less names in enviroment diagram
def fact(n):
    if n == 0:
        return 1
    else:
        retunr n * frac(n-1) # names: n, fact
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
'''

def fact_iter(n):
    total, k = 1, 1
    while k <= n:
        total,k = total*k,  k+1
    return total # names: total, k, n, fact_iter

```

### Recursive Functions
**Sum Digits Without a While Statement**
```python
def split(n):
    """Split positive n into all but its last digit and its last digit"""

    return n//10, n %10
def sum_digits(n):
    """Return the sum of the digits of positive integer n."""
    if n < 10: # base case
        reutrn n # non-recusive call
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

let [] denote next step expression exclusion
sum_digits(123)(sum_digits(12) + last: [3] (sum_digits(1) + last: [2] (n:[1] ))) + last: [4]

'''

```
**Digit Sums**
- If a number a is divisible by 9, then digit_sum(a) is also divisible by 9
- Useful for type detection
  - recall: multiplication is a form of repeated addition
    - ex. 18 (any combo) is multiple of 3 and we want a remainder of 3 in the digit sum -> 21, for 21 // 3 = 6 and 21 % 3 = 3
  
Definition: a function is called recusrive if the body of that function calls itself, either directly or indirectly

### Self-Reference
```python
def print_all(x):
    print(x)
    return print_all    # due to the return of the  print_all function, each of the reference to the gloabl frame print_all(x) has been asked
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