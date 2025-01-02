IV with Single Instrument and Regressor
================

#### Introduction

Given the regression model

$$Y_i = \beta_0 + \beta_1 X_i + u_i,\quad i = 1,...,n$$

where $X_i$ is endogenous (variable is correlated to error) such that
$\beta_1$ is unable to determined consistent. In such case, IV
regression can use a single instrumental variable Z to obtain a
consistent estimator for $\beta_1$

Z must satisfy two conditions to be a valid instrument 1. Instrument
relevance condition: - X and its instrument mst be correlated
($\rho_{Z_i,X_i} \neq 0$) 2. Instrument exogeneity condition - The
instrument Z must not be correlated with the error term
$u: \rho_{Z_i, u_i} = 0$

#### The Two-Stage Least Squares Estimator

Def: the variation of regressor X is decomposed into explainable
component depend on instrument Z and unexplainable component correlated
to $u_i$. The explainable variation Z in X will be used to estimate
$beta_1$

First stage regression model:

$$X_i = \pi_0 + \pi_1 Z_i + v_i$$ where $\pi_0 + \pi_1Z_i$ is the
component of $X_i$ that is explained by $Z_i$ and $v_i$ is the
unexplainable component that correlate with $u_i$

In the case of a single instrument, one can show the estimator for
$\beta_1$ to be

$$\hat{\beta_1^{TSLS}} = \frac{s_{ZY}}{s_{ZX}} \frac{\frac{1}{n-1}\sum^{n}_{i = 1}(Y_i - \overline{Y})(Z_i - \overline{Z})}{\frac{1}{n-1}\sum^{n}_{i = 1}(X_i - \overline{X})(Z_i - \overline{Z})}$$

- the equation essentially depicts the sample cov(Y, Z)/ co(X, Z)
- Central limit theorem allows large sampling to be approximated by
  normal distribution, which allow us to use t-statistics

#### Application to the Demand For Cigarettes

Goal: to answer the question ‘how much taxes must be increased to reduce
certain amount of cigarette consumption’

- Note:
  1.  this is an elasticity problem
  2.  we do not know the demand elasticity
  3.  OLS log Q to log P cannot be used for this type of causality
      problem (we fear endogeneity)
- Data Info:
  1.  source: AER package
  2.  observational consumption data across 48 states of US from 1985 to
      1995
  3.  we only want data from 1995
- Code Info:
  1.  we wish to setimate $\beta_1$ for
      $log(Q_i^{cig}) = \beta_0 + \beta_1 log(P_{i}^{cig}) + u_i$
  2.  Our instrument Z will be SalesTax

``` r
### Learn your data
data("CigarettesSW")
summary(CigarettesSW)
```

    ##      state      year         cpi          population           packs       
    ##  AL     : 2   1985:48   Min.   :1.076   Min.   :  478447   Min.   : 49.27  
    ##  AR     : 2   1995:48   1st Qu.:1.076   1st Qu.: 1622606   1st Qu.: 92.45  
    ##  AZ     : 2             Median :1.300   Median : 3697472   Median :110.16  
    ##  CA     : 2             Mean   :1.300   Mean   : 5168866   Mean   :109.18  
    ##  CO     : 2             3rd Qu.:1.524   3rd Qu.: 5901500   3rd Qu.:123.52  
    ##  CT     : 2             Max.   :1.524   Max.   :31493524   Max.   :197.99  
    ##  (Other):84                                                                
    ##      income               tax            price             taxs       
    ##  Min.   :  6887097   Min.   :18.00   Min.   : 84.97   Min.   : 21.27  
    ##  1st Qu.: 25520384   1st Qu.:31.00   1st Qu.:102.71   1st Qu.: 34.77  
    ##  Median : 61661644   Median :37.00   Median :137.72   Median : 41.05  
    ##  Mean   : 99878736   Mean   :42.68   Mean   :143.45   Mean   : 48.33  
    ##  3rd Qu.:127313964   3rd Qu.:50.88   3rd Qu.:176.15   3rd Qu.: 59.48  
    ##  Max.   :771470144   Max.   :99.00   Max.   :240.85   Max.   :112.63  
    ## 

``` r
?CigarettesSW
```

    ## starting httpd help server ... done

``` r
### Check instrument revalence condition

# compute real per capita prices
CigarettesSW$rprice <- with(CigarettesSW, price / cpi)

#  compute the sales tax
CigarettesSW$salestax <- with(CigarettesSW, (taxs - tax) / cpi)

# check the correlation between sales tax and price
cor(CigarettesSW$salestax, CigarettesSW$price)
```

    ## [1] 0.6141228

``` r
#> [1] 0.6141228


# generate a subset for the year 1995
c1995 <- subset(CigarettesSW, year == "1995")
```

The first stage regression is
$$log(P_{i}^{cig}) = \pi_0 + \pi_1 \text{SalesTax}_i  v_i$$, where P
denotes price

``` r
### Perform the first stage regression
cig_s1 <- lm(log(rprice) ~ salestax, data = c1995)

# output regression coeffecients
coeftest(cig_s1, vcov = vcovHC, type = "HC1") # note: parameters are unclear
```

    ## 
    ## t test of coefficients:
    ## 
    ##              Estimate Std. Error  t value  Pr(>|t|)    
    ## (Intercept) 4.6165463  0.0289177 159.6444 < 2.2e-16 ***
    ## salestax    0.0307289  0.0048354   6.3549 8.489e-08 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

``` r
#> 
#> t test of coefficients:
#> 
#>              Estimate Std. Error  t value  Pr(>|t|)    
#> (Intercept) 4.6165463  0.0289177 159.6444 < 2.2e-16 ***
#> salestax    0.0307289  0.0048354   6.3549 8.489e-08 ***
#> ---
#> Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```

This makes the first stage regression to be

$$log(P_{i}^{cig}) = 4.62 + 0.031\text{SalesTax}_i $$

To understand how much of the log P is explained by SalesTax, we can use
R square

``` r
# R^2 for first stage regression
summary(cig_s1)$r.squared
```

    ## [1] 0.4709961

``` r
#> [1] 0.4709961 
# this means that only 47% of variation in after tax prices is explained by the variation of the sales tax across states
```

We now store the estimated/fitted values of log P\_{i}^{cig} from cig_s1
into a new variable and ask for the regression of log Q on log P to ask
for the coefficients

``` r
# store of estimated/predicted values of log(P)
lcigp_pred <- cig_s1$fitted.values


# run the stage 2 regression
cig_s2 <- lm(log(c1995$packs) ~ lcigp_pred)
coeftest(cig_s2, vcov = vcovHC)
```

    ## 
    ## t test of coefficients:
    ## 
    ##             Estimate Std. Error t value  Pr(>|t|)    
    ## (Intercept)  9.71988    1.70304  5.7074 7.932e-07 ***
    ## lcigp_pred  -1.08359    0.35563 -3.0469  0.003822 ** 
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Now we yield the TSLS of
$$\log(\hat{Q}^{cig}_{i}) = 9.72 - 1.08 \log(P^{cig}_{i})$$

Note: the function `ivreg()` from AER can perform TSLS procedure
automatically, only that you need to use vertical bar to seperate you
instrument

``` r
# perform TSLS using 'ivreg()'
cig_ivreg <- ivreg(log(packs) ~ log(rprice) | salestax, data = c1995)

coeftest(cig_ivreg, vcov = vcovHC, type = "HC1")
```

    ## 
    ## t test of coefficients:
    ## 
    ##             Estimate Std. Error t value  Pr(>|t|)    
    ## (Intercept)  9.71988    1.52832  6.3598 8.346e-08 ***
    ## log(rprice) -1.08359    0.31892 -3.3977  0.001411 ** 
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Note:

- SE from lm() for second-state regression are invalid, for they do not
  account the use of prediction from the first stage; ivreg() helps with
  it

- Just like in multiple regression,it is important to compute
  heteroskedasticity-robust standard errors as using vcovHC()

Now, given the estiamte we have for beta 1, we know that an it is a 1 to
-1.08 relationship of price to cigarette, which is faily elastic.
However, one must note that a single Iv regression is not as robust as
multiple iv regression for there may be ommited variable bias presist.
