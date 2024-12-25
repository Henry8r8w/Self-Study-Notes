
---

### Example 5.1.1

Let  
```math
f(t) =
\begin{cases} 
0, & -\pi < t \leq 0, \\
t, & 0 \leq t < \pi.
\end{cases}
```

To find the Fourier coefficients, evaluate:

```math
a_0 = \frac{1}{\pi} \int_{-\pi}^{\pi} f(t) dt = \frac{1}{\pi} \int_{0}^{\pi} t \, dt = \frac{\pi}{2}
```

```math
a_n = \frac{1}{\pi} \int_{0}^{\pi} t \cos(nt) \, dt = \frac{1}{\pi} \left[ \frac{t \sin(nt)}{n} + \frac{\cos(nt)}{n^2} \right]_{0}^{\pi} = \frac{\cos(n \pi) - 1}{n^2 \pi} = \frac{(-1)^n - 1}{n^2 \pi}
```

Note: `L = \pi`, `t = u`, and `\cos(nt) = dv` were used for integration by parts.

---

### Dirichlet's Theorem

If, for the interval `[-L, L]`, the function `f(t)` satisfies:  
1. It is single-valued.  
2. It is bounded.  
3. It has at most a finite number of maxima and minima.  
4. It has only a finite number of discontinuities (piecewise continuous).  
5. `f(t + 2L) = f(t)` for values of `t` outside of `[-L, L]`.  

Then,  
```math
f(t) = \frac{a_0}{2} + \sum_{n=1}^\infty \left( a_n \cos\left(\frac{n \pi t}{L}\right) + b_n \sin\left(\frac{n \pi t}{L}\right) \right)
```
converges to `f(t)` as `N \to \infty` at values of `t` where `f(t)` is continuous, and to  
```math
\frac{1}{2} \left[ f(t^-) + f(t^+) \right]
```
at points of discontinuity. Here, `f(t^-)` is the value of the function infinitesimally to the left of `t`, and `f(t^+)` is the value infinitesimally to the right of `t`.

---

### 5.1 Fourier Series

The Fourier series is given by:  
```math
f(t) = \frac{a_0}{2} + \sum_{n=1}^\infty \left( a_n \cos\left(\frac{n \pi t}{L}\right) + b_n \sin\left(\frac{n \pi t}{L}\right) \right)
```

- The function converges between `[-L, L]` (a period: `2L`) with possible exceptions at some discontinuities and endpoints.  
- The **fundamental periodic function** (`f`) is at `n = 1`, while the **harmonics** are the remaining terms whose frequencies are integer multiples of the fundamental.  
- **Goal**: Find `a_n` and `b_n` for `f(t)`.

---

### First Attempt

Integrate the terms from `-L` to `L`:  

- The `\cos` and `\sin` terms disappear because their oscillations result in zero:  
```math
\frac{1}{2L} \int_{-L}^L f(t) \, dt = \frac{a_0}{2}
```

- Therefore, `a_0` is twice the mean value of `f(t)` over one period.

---

### Further Evaluation

Multiply the equation by `\cos\left(\frac{m \pi t}{L}\right)` and integrate over `[-L, L]`:  
```math
\int_{-L}^L f(t) \cos\left(\frac{m \pi t}{L}\right) dt = 
\int_{-L}^L \left[ \frac{a_0}{2} + \sum_{n=1}^\infty \left( a_n \cos\left(\frac{n \pi t}{L}\right) + b_n \sin\left(\frac{n \pi t}{L}\right) \right) \right] \cos\left(\frac{m \pi t}{L}\right) dt
```

- Note that `a_0` and `b_n` vanish by direct integration, and `a_n` vanishes when `m \neq n`.  

```math
\int_{-L}^L f(t) \cos\left(\frac{n \pi t}{L}\right) dt = a_n \int_{-L}^L \cos^2\left(\frac{n \pi t}{L}\right) dt
```

Where:  
```math
\int \cos^2(x) dx = \int \frac{1}{2} [1 + \cos(2x)] dx = \frac{T}{2} + \frac{\sin(4T)}{4}
```

```math
\int_{-L}^L f(t) \cos\left(\frac{n \pi t}{L}\right) dt = a_{n=m} L
```

---

### Final Formulation

Using the same treatment for `a_n`, we get `b_n`:  
```math
b_n = \frac{1}{L} \int_{-L}^L f(t) \sin\left(\frac{n \pi t}{L}\right) dt
```

The interval can be generalized to `[\tau, \tau + 2L]`, where `\tau` is any real number:  
```math
a_0 = \frac{1}{L} \int_{\tau}^{\tau + 2L} f(t) \, dt
```  
```math
a_n = \frac{1}{L} \int_{\tau}^{\tau + 2L} f(t) \cos\left(\frac{n \pi t}{L}\right) \, dt
```  
```math
b_n = \frac{1}{L} \int_{\tau}^{\tau + 2L} f(t) \sin\left(\frac{n \pi t}{L}\right) \, dt
```

---

### Questions to ask

1. What types of functions contain Fourier series?  
2. What happens at discontinuities?  

To answer these, refer to Dirichlet's theorem.

