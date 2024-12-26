## Source: https://cs61a.org/

Evaluate Nested Expressions
    mul(Add(2, mul(4,6)), add(3,5))
        - this is able to be written as expression tree

Anatomy of a Call Expression
    - Ex: Operators (operand_i, operand_j,....)
1. Evaluate the operator and then the operand subexpressions
2. Apply the function that is the value of the operator subexpression to arguments that are the values of the operand subexpression


Call expression
  - Ex: min(a,b) and max(c,d) allow us to return to miniimun and maximunum within the abcd, where the abcd are so called the parameters
  - It is possible to nesting call expressions all together

Library Import
    - from operator import add, mul, mod
      - note: mod(a,b) = b if b is greater than a
    - you are importing add, mul, and mod functions from operator library

To pefromaion math operation
    -  + is addition, - subtraction, * is multipclation, ** is raising to power of, / is division, // is division without remainder, modulo is %

ex.
4 % 2 = 0
5 % 2 = 1
21/5 = 4.reaminder
21 //5 = 4

To activate python in terminal
    - in the dir you wnat to activate, type python3

An expression deschribes a computation and evaluates to a vlaue


