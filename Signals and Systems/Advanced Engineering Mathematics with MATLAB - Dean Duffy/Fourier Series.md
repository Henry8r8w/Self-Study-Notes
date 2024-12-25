### Example 5.1.1
Let 
$$
f(t) =
\begin{cases}
0, & -\pi < t \leq 0, \\
t, & 0 \leq t < \pi.
\end{cases}
$$

if we want to try the fourier coefficients, evaluate

$$a_0 = \frac{1}{\pi} \int_{\pi}^{\pi}f(T) = \frac{1}{\pi}\int^{\pi}_{0}t dt = \frac{\pi}{2}$$

$$a_n = \frac{1}{\pi}\int^{\pi}_{0}t cos(nt) = \frac{1}{\pi} \left [\frac{t\sin(nt)}{n} + \frac{cos(nt)}{n^2}]|^{\pi}_{0} \right = \frac{cos(n \pi)-1}{n^2 \pi} = \frac{(-1^n)-1}{n^2 \pi}$$


note: $L = \pi$ and $t = u, cos(nt) = dv$ for the Integration by Parts



### Dirichlet Theorem
If for the interval $[−L,L]$ the function f(t) (1) is single-valued,(2) is bounded, (3) has at most a finite number of maxima and minima, and (4) has only a finite number of discontinuities (piecewise continuous), and if (5) f(t + 2L) = f(t) for values of t outside of $[−L,L]$, then

$$f(t) = \frac{a_0}{2}+ \sum^{\infty}_{n = 1}a_n \cos(\frac{n \pi t}{L}) + b_n \sin(\frac{n \pi t}{L})$$

converges to f(t) as $N \to \infty$ at values of t for which $f(t)$ is continuous and to $1/2 [f(t^−) +f(t^+)]$ at points of discontinuity. Here $f(t^−)$ equals the value of the function at a point that is located infinitesimally to the left of t while $f(t^+)$ equals the value of the function at a point that is located infinitesimally to the right of t

### 5.1 Fourier Seires
$$f(t) = \frac{a_0}{2}+ \sum^{\infty}_{n = 1}a_n \cos(\frac{n \pi t}{L}) + b_n \sin(\frac{n \pi t}{L})$$
- the function convereges  between $[-L, L]$ (a period: 2L) with possible exceptions at some discontinuoties and end points
- fndemental periodic function (f) is at n = 1, while the harmonics are the remaining terms whose frequencies are integer multiples of the fundemental
- goal: to find $a_n$ and $b_n$ for $f(t)$



**First Attempt**: Integrate the terms from -L to L
- the cos and sin disappears because the osccilations resulted zero
$$ \frac{1}{2L}\int^{L}_{-L}f(t)dt = \frac{a_0}{2}$$
- now we can tell that $a_0$ is the 2x mean value of f(t) over one period

**To further evaluate**: try multiply our whole equation by $cos(m \pi t / L)$ from $[-L, L]$
$$\int_{-L}^L f(t) \cos (\frac{m \pi t}{L})  dt = 
\int_{-L}^L [ \frac{a_0}{2} + \sum_{n=1}^\infty ( a_n \cos(\frac{n \pi t}{L}) + b_n \sin (\frac{n \pi t}{L}) )] \cos(\frac{m \pi t}{L})  dt$$

- note that a_0 and b_n vanish by direct integration and a_n would vanish when m != n

$$\int_{-L}^L f(t) \cos(\frac{n\pi t}{L} ) dt = a_n \cos^2(\frac{n \pi t}{L})dt$$ where
$$ \int cos^2(x) dt = \int 1/2 [1+ cos(2x)] \to 2T/2 + sin(4T)/2$$
$$ \int_{-L}^L f(t) \cos(\frac{n\pi t}{L} ) dt = a_{n = m}L$$

**In the end**
Using the same treatment to a_n, we get b_n
$$b_n = \frac{1}{L}\int_{-L} f(t) sin(\frac{n \pi t}{L})$$

And now, a better formulation of the interval that show us infromation about the period should be $[\tau, \tau, +2L]$ where tau is any real number, therefore

$$a_0 = \frac{1}{L}\int_{\tau}^{\tau +2L}f(t)dt$$
$$a_n = \frac{1}{L}\int_{\tau}^{\tau +2L}f(t)cos(n \pi t/ L)t$$
$$b_n = \frac{1}{L}\int_{\tau}^{\tau +2L}f(t)sin(n \pi t/ L)t$$

Now, there are two question beg:
1. what are the types of function containing fourier series
2. what happens at the discontinuity

To answer toe quetions, we must refer to dirichlet's theorem