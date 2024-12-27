Source: https://courses.cs.washington.edu/courses/cse369/24au/schedule.html

### Practice Problem
Simplify $X = \overline{A+B} + A\overline{B} + \overline{CD}$
- By DegMorgan $\to\overline{AB} + A\overline{B} + \overline{CD}$
- By distribution of NOT(B) and X dot NOT(X) law $\to\overline{B} + \overline{C+D}$
- By DeMorgan $\to\overline{B(C+D)}$
Then, implement the cirucit with NAND gates
1. NAND((C OR D) B)
2. NAND((NAND(NOT(C) NOT(D))) B)
3. NAND((NAND(NAND(C, C) NAND(C, C))) B)

### DeMorgan's Law
- $\overline{X + Y} = \overline{X} \cdot \overline{Y}$
- $\overline{X \cdot Y} = \overline{X} + \overline{Y}$
At gate level, one can convert from AND/OR to NAD/NOR gate by having the inputs  or output negated based on complications
### Are Logic Gates Created Equal?
Unfortunately, no
- which makes our design harder

However, we can create gates using only NAND or only NOR gate to ensure the consistency in our design/ analysis
- Degmorgan law may help
- Called 'universal' gates

### Why are the properties and laws useful?
- Logic minimization: reduce complexity at gate level 
	- Allows us to build smaller and faster hardware 
	- Care about both # of gates, # of literals (gate inputs), # of gate levels, and types of logic gates
---

### Practice Problem
F  = NOT(X)YZ + XZ
- Simplification: XZ + YZ or (X+Y)Z , the lateral one is more cost-effective (3 gates vs. 2 gates)
	- Distribute Z ->(NOT(X)Y + X)Z
	- Absorb (NOT(X)Y + X) -> (X+Y)Z
	- Distribute X and Y -> XZ + YZ
	
| X   | Y   | Z   | F   |
| --- | --- | --- | --- |
| 0   | 0   | 0   | 0   |
| 0   | 0   | 1   | 0   |
| 0   | 1   | 0   | 0   |
| 0   | 1   | 1   | 1   |
| 1   | 0   | 0   | 0   |
| 1   | 0   | 1   | 1   |
| 1   | 1   | 0   | 0   |
| 1   | 1   | 1   | 1   |

### Advanced Laws (Absorption)
- X + XY = X
- XY + X NOT(Y) = X
- X+ NOT(X)Y = X+Y
- X(X+Y) = X
- (X+Y)(X+ NOT(Y)) = X
- X(NOT(X) + Y) = XY
### Basic Boolean Identities and Laws
- X+ 0 = X
- X+1 = 1
- X+X = X
- X+ NOT(X) = 1
- NOT(NOT(X)) = X
- X dot 1 = X
- X dot 0 = 0
- X dot X = X
- X dot NOT(X) = 0

Commutative law: X+Y = Y + X, X dot Y  = Y dot X
Associative Law: X + (Y + Z) = (X+ Y) + Z, X dot (Y dot Z) = (X dot Y) dot Z
Distributive Law: X dot (Y+Z) = X dot Y + X dot Z, X + Y dot Z = (X+Y) dot (X +Z)

Now, to prove $(A+B)\cdot (\overline{A}+ \overline{B}) = \overline{A}B + \overline{B}A$
- Use distributive property, then you're good to go
### Truth Table to Boolean Expression
| A     | B     | C     |
| ----- | ----- | ----- |
| 0     | 0     | 0     |
| ==0== | ==1== | ==1== |
| ==1== | ==0== | ==1== |
| 1     | 1     | 0     |
- Read off of table
	- For 1, write variable name
	- For 0, write complement of variable
- Sum of Products (SOP)
	- Take rows with 1's in output column, sum products  of inputs
	- $C =\overline{A}B + \overline{B}A$
- Product of Sums (POS)
	- Take rows with 0’s in output column, product the sum of the complements of the inputs 
	- $C = (A+B)\cdot (\overline{A}+ \overline{B})$
	
### Boolean Algebra
- Plus (+) is 2-input OR: 'Logical sum'
- Product ($\cdot$) is 2-input AND: 'Logical product'
- All other gates and logical expressions can be built from combinations of these
	- e.g. $\text{A XOR B} = A \oplus B = \overline{\text{A}}B + \overline{\text{B}}A$
	
### More Complicated Truth Table
1-bit Adder

| A   | B   | Carry | Sum |
| --- | --- | ----- | --- |
| 0   | 0   | 0     | 0   |
| 0   | 1   | 0     | 1   |
| 1   | 0   | 0     | 1   |
| 1   | 1   | 1     | 0   |

$\text{Carry: } A \cdot B \quad \text{Sum: } A \oplus B$

### Logic Names and Symbols
pass

### CL General Forms
$a \to; b \to; c \to; d \to [F] -y \to$
- 4 inputs (abcd) into F system with a single output (y)
- 2^4 F(a,b,c,d) combinations will exist 
### Example: Simple Car Electronics
- Door Ajar (Driver Door Open, Passenger Door Open)
	- DA  = DDO + PDO = DDO or PDO
- High Beam INdicator (Lights On, High Beam On)
	- HBL = LO $\cdot$ HBO = LO AND HBO
- Seat Belt Light (Driver Belt In, Passenger Belt In, Passenger)
	- SBL = $\overline{\text{DBI}}$ + (P $\cdot\overline{\text{PBI}}$) = NOT(DBI) + (P $\cdot$ NOT(PBI))
### Combinational vs. Sequential Logic
- CL: 1. Network of logic gates without feedback 2. Outputs are functions only of inputs
- SL: 1. The presence of feedback introduces the notion of “state” 2. Circuits that can “remember” or store information

---
### Digital Design: What's It All About?
- An implementation using a set of primitives given a functional description and constraints (e.g. Performance, Power, and Cost)
- An art , it's design; use creative spirits with your primitives to achieve a desired function

To learn digital design, you need
- to know the primitives
- to know the design representations
- to learn the formal methods and tool to manipulate representations
- to look into various design sample
- to perform trial and error - using a CAD tools for prototyping and practices
### Digital vs. Analog Systems
**Digital**
- Representation: binary values -> T/F, 0/1
- Use cases: CPU, memory, I/O
- Property: reliable and less error, rejects significant amount of errors
**Analog**
- Representation: varying values over a continuous range
- Use cases: interface circuits with real word (i.e. sensors and actuators)
- Property: slight error can cascade

Note: the course materials of 369 is about logic design, not system design (processor architecture), and not circuit design (transistor level)
