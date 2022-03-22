# R package `lavaan`

Whether you want to do path analysis or structural equation modeling or want to model latent change scores or growth curves: The `lavaan` package is *the* tool for these purposes. Its use is quite straightforward: Consider you want to fit the model depicted in Figure 1. 

![](https://github.com/alex-strobel/DPP-LabManual/blob/main/Images/Wiki/model.jpg)

**Figure 1.** Example of a model to fit

You define and fit the model like this:

```R
# install and source lavaan
install.packages("lavaan")
library(lavaan)

# define model
model <- '
# estimate latent from manifest variables
X ~= x1 + x2 + x3
Y ~= y1 + y2 + y3

# regression of Y on X
Y ~ X

# correlated error variances
x1 ~~ x2
'

# fit model
fit <- sem(model, data)

# get summary of model and model fit
summary(fit, standardized = TRUE, fit.measures = TRUE)
```

This gives you a number of measures of model fit (including those we typically use for evaluating fit, i.e., the chi-square statistic, CFI, RMSEA or SRMR) and an overview of the estimates for the model parameters. You save the parameter estimates via 

```R
# retrieve parameter estimates
fitParameterEstimates <- parameterEstimates(fit, standardized = TRUE)
```

and can also save the factor scores of the latent variables via

```R
# extract factor scores
fitFactorScores <- lavPredict(fit)
```

There is a large number of options on how to exactly fit a model, i.e., which estimator to use (default is Maximum Likelihood, ML), whether to bootstrap standard errors, how to treat missing (e.g., impute them using Full Information Maximum Likelihood, FIML) and so on. All of this and more is very comprehensibly described in the `lavaan` tutorial:  

- [The lavaan project](https://lavaan.ugent.be)

With this tutorial, you will be able to perform, say, structural equation modeling in short time. Still, you need to know what you are doing, so get involved with the technique you want to apply (links will be inserted soon):

- Path Analysis
- Mediation Analysis
- Structural Equation Modeling
- Latent Change Score Modeling
- Latent Growth Curve Modeling
- Latent State-Trait Modeling