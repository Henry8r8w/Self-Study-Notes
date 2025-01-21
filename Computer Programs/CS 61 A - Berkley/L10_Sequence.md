### List Comprehension
demo
```python
letters = ['a', 'b', 'c', 'd', 'e', 'f', 'm', 'n', 'o', 'p']
result = [letters[i] for i in [3, 4, 6, 8]] # result: ['d','e','m','o']

odds = [1,3,5,7,9]
[x for x in odds if 25 % x == 0] # x: [1, 5]
```

Divisor implementation
```python
def divisors(n):
    return [1] + [x for x in range(2, n) if n % x == 0] 
divisors(8) # [1, 2, 4]

```

### Ranges
- def (simple ver.): a sequence of consecutive integers
    - inclusivitivity:[inclusive_index:exclusive_index]
    - length: ending value - starting value
```python
>>> list(range(-2,2)) 
[-2,-1,0,-1]
>>> range(5,8)
range(5,8)
```

Say, you want to do somethign within a number of times; indexing does not matter
```python
for _ in range(3):
    print("happy new year")
happy new year
happy new year
happy new year

```

### For Statement
```python
def count(s, value):
""" Count the number of times value in sequence s appear
>>> count([1,2,3,4,5,6,1,8,1],1)
3
"""
    index, total= 0,0
    while index < len(s): # 0:N-1; 0...len(s) - 1
        digit = s[index]
        if digit == value:
            total = total +1
        index = index +1
    return total

# Convert the while to for
def count(s, value):
""" Count the number of times value in sequence s appear
>>> count([1,2,3,4,5,6,1,8,1],1)
3
"""
    total= 0
    for index in len(s): 
        if s[index] == value:
            total = total +1
    return total
```
For statement execution procedure
- for <name> in <expression>: <suite>
    - the expression must be an iterable value (str, list, dict, etc)
    - name binds to the current element in the frame, then execute in the suite

Sequence unpacking in for statement
```python
pairs = [[1,2], [2,2], [3,2], [4,4]]
same_count = 0
for x,y in pairs:
    if x == y:
        same_count = same_count +1
print(same_count) # 2
```
### Container
- we got a built-in operator to test whether an element appears in compound value
```python
digits = [1,8,2,8]
1 in digits # True
5 not in digits # True
not(5 in digits) # True; note: not() is a negation to the 5 in digits boolean statement of False; it evaluates the same as not in
[1,8] in digits # False; the built-in operator does not look for sub-sequences; it only looks for individual element
[1,2] in [3,4,[1,2], 5,6] # True
[1,2] in [3,4,[[1,2]], 5,6] # True

```

### List
some indexing examples
```python
odds = [41, 43, 47, 49]
odds[3] - odds[2] # return: 2
odds[odds[3] - odds[2]] # return: 47
len(odds) # 4
getitem(odds, 3) # 49
```
some list equivalence
```python
digits1 = [1,8,2,8]
digits2 = [2//2,2+2+2+2,2,2*2*2]
assert (digits1 == digits2) # True
```
concatenation and repetition
```python
digits1 = [1,8,2,8]
digits2 = digits1*2+[2,7] # digits2: [1,8,2,8,1,8,2,8,2,7]
digits2_equiv = add(mul(digits1, 2), [2,7]) # digits2_equiv: [1,8,2,8,1,8,2,8,2,7]
```
Nested List
```python
pairs = [[10, 20],[30, 40]]
pairs[1] # [30,40]
pairs[1][2] # 30


```