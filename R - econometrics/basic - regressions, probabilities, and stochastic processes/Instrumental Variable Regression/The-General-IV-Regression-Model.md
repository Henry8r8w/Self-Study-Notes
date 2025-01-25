The General IV Regression Model
================

#### Introduction

The general IV Regression Model can be broken down to four parts: 1. the
dependent variable 2. the exogenous variables 3.the endogenous variables
4. the instrumental variables

Using the general form, we can extend from single IV regression model to
multiple IV regression model

$$Y_i = \beta_0 + \beta_1 X_{1i} + \cdots + \beta_k X_{ki} + \beta_{k+1} W_{1i} + \cdots + \beta_{k+r} W_{ri} + u_i$$

with $i = 1,..., n$ , is the general instrumental variables regression
model where:

- \$Y_i \$: the dependent variable.
- $\beta_0, \ldots, \beta_{k+1}$: \$ 1 + k + r\$ unknown regression
  coefficients.
- $X_{1i}, ..., X_{ki}: k$ endogenous regressors.
- $W_{1i}, ..., W_{ri}: r$ exogenous regressors, uncorrelated with
  $u_i$.
- \$u_i \$: the error term.
- \$Z\_{1i}, …, Z\_{mi} : m \$ instrumental variables.

The coefficients are overidentified if \$m \> k \$. If \$m \< k \$, the
coefficients are underidentified. When \$m = k \$ (# of instrument var =
\# of endgenous var), they are exactly identified. For estimation of the
IV regression model, we require exact identification or
overidentification.

Assume you want to estimate the model

$$Y_i = \beta_0 + \beta_1 X_{1i} + \beta_2 X_{2i} + W_{1i} + u_i$$ we
can input our variables with `ivgreg` using y~ x1 + x2 + w1 \|w1 + z1 +
z2 + z3

- we have m of 3 with k of 2; \# of IV \> \# of EV
- since w1 is exogenous, we use w1 as a instrument to itself

One shorthand to write IV is .-, which to exclude all endogenous
variable in the instrumental variable

#### Two-Stage Least Squares (procedure)

pass \#### Two Conditions for Valid Instrument pass

#### The IV Regression Assumptions

- The assumptions that allow use to compute t-Test, F-test and
  Confidence Interval for model coefficients

1.  $E(u_i|W_{1i},...,W_{ri}) = 0$
2.  $(X_{1i}, ..., X_{ki}; W_{1i}, ..., W_r{i}, Z_{1i},..., Z_{mi})$ are
    independent and identically distributed draw from their joint
    distribution

#### Application to the Deand for Cigarettes

$$\log(Q^{cig}_{i}) = \beta_0 + \beta_1 \log(P^{cig}_{i}) + \beta_2 \log(\text{income}_i)+u_i$$

``` r
data("CigarettesSW")
# compute real per capita prices
CigarettesSW$rprice <- with(CigarettesSW, price / cpi)

#  compute the sales tax
CigarettesSW$salestax <- with(CigarettesSW, (taxs - tax) / cpi)


# add rincome to the dataset
CigarettesSW$rincome <- with(CigarettesSW, income / population / cpi)

c1995 <- subset(CigarettesSW, year == "1995")

# estimate the model
cig_ivreg2 <- ivreg(log(packs) ~ log(rprice) + log(rincome) | log(rincome) + salestax, data = c1995)

coeftest(cig_ivreg2, vcov = vcovHC, type = "HC1")
```

    ## 
    ## t test of coefficients:
    ## 
    ##              Estimate Std. Error t value  Pr(>|t|)    
    ## (Intercept)   9.43066    1.25939  7.4883 1.935e-09 ***
    ## log(rprice)  -1.14338    0.37230 -3.0711  0.003611 ** 
    ## log(rincome)  0.21452    0.31175  0.6881  0.494917    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

``` r
#> 
#> t test of coefficients:
#> 
#>              Estimate Std. Error t value  Pr(>|t|)    
#> (Intercept)   9.43066    1.25939  7.4883 1.935e-09 ***
#> log(rprice)  -1.14338    0.37230 -3.0711  0.003611 ** 
#> log(rincome)  0.21452    0.31175  0.6881  0.494917    
#> ---
#> Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```

We obtain
$$\log(Q^{cig}_{i}) = 9.42 - 1.14 \log(P^{cig}_{i}) + 0.21 \log(\text{income}_i)$$

``` r
# add cigtax to the data set
CigarettesSW$cigtax <- with(CigarettesSW, tax/cpi)

c1995 <- subset(CigarettesSW, year == "1995")

# estimate the model
cig_ivreg3 <- ivreg(log(packs) ~ log(rprice) + log(rincome) | 
                    log(rincome) + salestax + cigtax, data = c1995)

coeftest(cig_ivreg3, vcov = vcovHC, type = "HC1")
```

    ## 
    ## t test of coefficients:
    ## 
    ##              Estimate Std. Error t value  Pr(>|t|)    
    ## (Intercept)   9.89496    0.95922 10.3157 1.947e-13 ***
    ## log(rprice)  -1.27742    0.24961 -5.1177 6.211e-06 ***
    ## log(rincome)  0.28040    0.25389  1.1044    0.2753    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

``` r
#> 
#> t test of coefficients:
#> 
#>              Estimate Std. Error t value  Pr(>|t|)    
#> (Intercept)   9.89496    0.95922 10.3157 1.947e-13 ***
#> log(rprice)  -1.27742    0.24961 -5.1177 6.211e-06 ***
#> log(rincome)  0.28040    0.25389  1.1044    0.2753    
#> ---
#> Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```

We obtain
$$\log(Q^{cig}_{i}) = 9.89 - 1.28 \log(P^{cig}_{i}) + 0.28 \log(\text{income}_i)$$ -
this is a better model in term of standard error

However, when it comes to instrument variable, there is a validity
issues. One should know how to verify instrument, which it will be
discussed in another markdown
