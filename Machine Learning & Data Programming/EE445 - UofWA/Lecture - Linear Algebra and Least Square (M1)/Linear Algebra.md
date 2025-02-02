### Chebyshev inequality
 Simple yet useulf ineuqlaity on relation between vector norm and vector entries

Suppsoe that k of the numbers $|x_1|,...|x_n|$ are $\greq$ a
- then k of the numbers $x_1^2,..., x_n^2$ are $\geq a^2$
- so $||x||^2 = \sum_{i}x_i^2 \geq ka^2$, and we have $k \leq ||x||^2 /a$
- number of $x_i$ with $|x_i| \geq a $ is no more than $||x||^2 / a^2$

$$k \leq \frac{||x||^2}{a^2}$$

root-mean square value : rms(x) = $\sqrt{\frac{x_1^2 +... + x_n^2}{n^2}} = \frac{||x||^2}{a^2}$

Given a fraciton of entrey with |x_i| > a, (i.e. k /n ), we can express the chebyshev inequality in terms of rms

$$\frac{||x||^2}{n (a^2)} = \frac{rms(x)}{a}$$
### Norm and distance
Euclidean norm (2-norm): $||x|| = \sqrt{\sum^{n}_{i =1}x_i^2}$

Properties:
- homogeneity: $|\alpha x|| = |\alpha| ||x||$
- triangle inequality: $||x+y|| \leq ||x|| + ||y||$
- nonegativity: $||x|| \geq 0$
- definteness: $||x|| = 0$ only if x = 0

norm of block vectors:
$$||(a,b,c)||^2 = a^{T}a + b^{T}b + c^{T}c = ||a||^2 + ||b||^2 + ||c||^2$$
- dist(a, b) = $||a - b||$
- triangel inquality
    - $||a - c||  = || a- b + b -c|| \leq ||a-b|| + || b -c||$

### Linear functions
- f should share same dimension
    -  $f:R^{n} \to R^$ means f is a function mapping n-vectors to scalars
-f should  satifies superpsotiion ($f(\alpha x+ \beta y) = \alphaf(x)+\betaf(y)$) holds for all scalars $\alpha, beta$ and all $x, y \in R^{n}$

The f is called linear function


**all linear functions are inner products**
- $f(x) = a^{T}x$ can be expression
    - specifically, $a_i = f(e_i)$
$$f(x) = f(x1e_1+...+x_ne_n) = x_1f(e_1)+...+x_nf(e_n) = x_1a_1 +... +x_n a_n = a^{T} x$$

Affine function: a linear function plus a constant, general form:
$$f(x) = a^{T}x + b$$

### Properties of inner product

$$ a^Tb = b^Ta$$
$$  (\gamma a)^Tb = \gamma(a^Tb) $$

$$ (a+b)^TC = a^TC + b^TC$$

Examples:
- $e_i^{T}a = a_i & \quad \text{e_i: ith coordinate vector}$
- $1^T a = \sum^{n}_{i = 1}a_i & \quad \text{1: vector of all ones}$
- $a^{T}a = \sum^{n}_{i = 1}a_i^2 = ||a||^2$

### Inner Product
Aka dot product 
- of n-vectors a abd b is

$$a^{T}b = \sum^{n}_{i = 1}a_ib_i$$
- some other possiblenotation: $ \langle a,b\rangle,\;a\cdot b,\;\langle a|b\rangle$

ex. 
$$ 
[-1 \quad 2 \quad 2] \begin{bmatrix} 1 \\ 0 \\ -3 \end{bmatrix} = (-1)(1) + (2)(0) + (2)(-3) = -7
$$

### Linear Combination
y = $\beta_1 a_1+... + \beta_n a_n$, which is the linear combination of the coeeficientt beta to the a vector
2D example: $b = 0.75a_1 - a_2$

Line and segment: a, b are n-vectors, $c = (1 - \theta)a + \thetab
- when $\theta$ is any scalar: c on line passing through a, b
- when $ 0 \leq \theta \leq 1:c$ on line segment connecting a, b

### Vector Representation Examples
**Location (x_1, x_2)**
- portfolio: entries give shares (or $ value or fraction) held in each of n assets, with
negative meaning short positions
- cash flow: x_i is payment in period i to us
- sampled audio signal: x_i is the acoustic pressure at sample time i
- feature vector: x_i is the value of ith feature or attribute of an entity
- word count vector

**Word count**
Given this shot context: “Word count vectors are used in computer based document analysis. Each entry of theword count vector is the number of times the associated dictionary word appears in the document."

One can encode the in dictionary of regular vector: {word:3, in:2, number:1, flower: 0, the: 4, document:2}


### Vectors: notation
$x \in R^{n}$: n-vector with real entries

$x_i$: ith entry of x

$x^{T}$: transpose

$1_n$ or $1$: vector of all ones
ex. 
$$
\begin{pmatrix}
1 \\
1 \\
\vdots \\
1
\end{pmatrix}
$$

$e_i$: denotes ith coordinate vector (1 in index i, zero elsewhere)

ex. e_1, e_2, e_3

$$
\mathbf{e}_1 = \begin{pmatrix}
1 \\
0 \\
0
\end{pmatrix}
$$


$$
\mathbf{e}_2 = \begin{pmatrix}
0 \\
1 \\
0
\end{pmatrix}
$$

$$
\mathbf{e}_3 = \begin{pmatrix}
0 \\
0 \\
1
\end{pmatrix}
$$


### Reference:
“Vectors, Matrcies, and Least Squares (VMLS)” by Boyd & Vandenberghe (.pdf is online)
“Optimization Models” by Calafiore & El Ghaoui