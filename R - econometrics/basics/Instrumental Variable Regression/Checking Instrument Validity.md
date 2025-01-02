#### Instrument Relevance
- Instruments that explain little variation in the endogenous regressor X are called weak instruments.

A Rule of Thumb for Checking for Weak Instruments
- Compute F-statistics which coreposnds to the hypothesis that the coefficients on $Z_1, ..., Z_m$ are all zeros in the first stage regression.  If the  F-statistic is less than 10, the instruments are weak such that the TSLS estimate of the coefficient on X is biased and no valid statistical inference about its true value can be made
- useful package: linearHypothesis()


#### If Instruments are Weak
1. Discard the weak instruments and/or find stronger instruments (difficult to do irl; new data colleciton, new study)

2. Stick with the weak instruments but use methods that improve upon TSLS in this scenario, for example: limited information maximum likelihood estimation (MLE)

#### When the Assumption of INstrument Exogeneity is Violated
- overidentifying restrictions test (also called the  
J-test) is an approach to test the hypothesis that additional instruments are exogenous

Take $\hat{u}_i^{TSLS}, i = 1,..., n$ the residuals of the TSLS estimation of general IV regression model; run the OLS regression

$$\hat{u}_{i}^{TSLS} = \delta_0 + \delta_1 Z_{1i}+...+\delta_{m}Z_{mi}+\delta_{m+1}W_{1i}+...+\delta_{m+r}W_{ri} + e_i$$


and test the joint hypothesis
$$H_0: \de;ta_1 = 0, ..., \delta_m = 0$$

which states that all instruments are exogenous. This can be done using the corresponding  F-statistic by computing

This test is the overidentifying restrictions test and the statistic is called the  J-statistic with

$$J ~ X^{2}_{m-k}$$

in large samples under the null and the assumption of homoskedasticity. The degrees of freedom m -kstate the degree of overidentification since this is the number of instruments m minus the number of endogenous regressors k

note: e_i need to be homoskedatic (variance of residuals is constant)