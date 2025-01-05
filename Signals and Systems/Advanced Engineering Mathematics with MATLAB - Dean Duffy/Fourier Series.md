
### Example 5.1.1

Let
$$
f(t) =
\begin{cases}
0, & -\pi < t \leq 0, \\
t, & 0 \leq t < \pi.
\end{cases}
$$

To find the Fourier coefficients, evaluate:  
$$
a_0 = \frac{1}{\pi} \int_{-\pi}^{\pi} f(t) dt = \frac{1}{\pi} \int_{0}^{\pi} t \, dt = \frac{\pi}{2}
$$

$$
a_n = \frac{1}{\pi} \int_{0}^{\pi} t \cos(nt) \, dt = \frac{1}{\pi} \left[ \frac{t \sin(nt)}{n} + \frac{\cos(nt)}{n^2} \right]_0^{\pi} = \frac{\cos(n \pi) - 1}{n^2 \pi} = \frac{(-1)^n - 1}{n^2 \pi}
$$

**Note:** \(L = \pi\), and substitution \(t = u\), \(\cos(nt) = dv\) was used for integration by parts.

---

### Dirichlet's Theorem

For the interval \([-L, L]\), if the function \(f(t)\) satisfies the following conditions:  
1. It is single-valued.  
2. It is bounded.  
3. It has at most a finite number of maxima and minima.  
4. It has only a finite number of discontinuities (piecewise continuous).  
5. \(f(t + 2L) = f(t)\) for values of \(t\) outside of \([-L, L]\).  

Then,  
$$
f(t) = \frac{a_0}{2} + \sum_{n=1}^\infty \left( a_n \cos\left(\frac{n \pi t}{L}\right) + b_n \sin\left(\frac{n \pi t}{L}\right) \right)
$$  
converges to \(f(t)\) as \(N \to \infty\) at values of \(t\) where \(f(t)\) is continuous. At points of discontinuity, it converges to:  
$$
\frac{1}{2} \left[f(t^-) + f(t^+)\right]
$$  
where \(f(t^-)\) is the value of the function infinitesimally to the left of \(t\), and \(f(t^+)\) is the value of the function infinitesimally to the right of \(t\).

---

### 5.1 Fourier Series

The Fourier series is:  
$$
f(t) = \frac{a_0}{2} + \sum_{n=1}^\infty \left( a_n \cos\left(\frac{n \pi t}{L}\right) + b_n \sin\left(\frac{n \pi t}{L}\right) \right)
$$

- The function converges between \([-L, L]\) (a period of \(2L\)), with possible exceptions at discontinuities and endpoints.  
- The **fundamental periodic function** (\(n=1\)) defines the base frequency, while the **harmonics** are terms with frequencies that are integer multiples of the fundamental.  
- **Goal:** Find \(a_n\) and \(b_n\) for \(f(t)\).

---

### First Attempt

Integrate the terms from \(-L\) to \(L\):  
- The \(\cos\) and \(\sin\) terms disappear due to their oscillations resulting in zero:  
$$
\frac{1}{2L} \int_{-L}^L f(t) \, dt = \frac{a_0}{2}
$$

Thus, \(a_0\) is twice the mean value of \(f(t)\) over one period.

---

### Further Evaluation

Multiply the equation by \(\cos\left(\frac{m \pi t}{L}\right)\) and integrate over \([-L, L]\):  
$$
\int_{-L}^L f(t) \cos\left(\frac{m \pi t}{L}\right) \, dt =
\int_{-L}^L \left[ \frac{a_0}{2} + \sum_{n=1}^\infty \left( a_n \cos\left(\frac{n \pi t}{L}\right) + b_n \sin\left(\frac{n \pi t}{L}\right) \right) \right] \cos\left(\frac{m \pi t}{L}\right) \, dt
$$

- The \(a_0\) and \(b_n\) terms vanish due to orthogonality, and \(a_n\) vanishes when \(m \neq n\).  
$$
\int_{-L}^L f(t) \cos\left(\frac{n \pi t}{L}\right) \, dt = a_n \int_{-L}^L \cos^2\left(\frac{n \pi t}{L}\right) \, dt
$$

Using:  
$$
\int \cos^2(x) \, dx = \int \frac{1}{2} [1 + \cos(2x)] \, dx
$$

Thus,  
$$
\int_{-L}^L f(t) \cos\left(\frac{n \pi t}{L}\right) \, dt = a_n L
$$

---

### Final Formulation

Using the same method for \(a_n\), we find \(b_n\):  
$$
b_n = \frac{1}{L} \int_{-L}^L f(t) \sin\left(\frac{n \pi t}{L}\right) \, dt
$$

To generalize for an arbitrary interval \([\tau, \tau + 2L]\):  
$$
a_0 = \frac{1}{L} \int_{\tau}^{\tau + 2L} f(t) \, dt
$$
$$
a_n = \frac{1}{L} \int_{\tau}^{\tau + 2L} f(t) \cos\left(\frac{n \pi t}{L}\right) \, dt
$$
$$
b_n = \frac{1}{L} \int_{\tau}^{\tau + 2L} f(t) \sin\left(\frac{n \pi t}{L}\right) \, dt
$$

---

### Questions to Consider

1. What types of functions can be represented by Fourier series?  
2. What happens at points of discontinuity?  

To answer these, refer to Dirichlet's theorem.

