# R, RStudio and R Packages

This folder contains manuals on the R environment for statistical computing, RStudio as its frontend, and a number of recommended R packages. Not all of the latter have been developed strictly for data analysis purposes, but in the broadest sense, they all serve the purpose of a reproducible data analysis.

So far, there are manuals on the following R packages you should have installed:

## Helper packages

- [`here`](here/here.md) flags some project folder as root so that all data and code of that folder can easily be accessed
- [`renv`](renv/renv.md) enables you to create a reproducible R environment
- [`targets`](targets/targets.md) is a pipeline toolkit that learns how your pipeline fits together, monitors your pipeline, skips costly runtime for tasks that are already up to date, and runs only the necessary computations
 
## Power analysis 

- [`effectsize`](effectsize/effectsize.md) lets you calculate or convert effect sizes
- [`pwr`](pwr/pwr.md) provides the most common routines for power analysis
  
## Statistical analysis

- [`BayesFactor`](BayesFactor/BayesFactor.md) lets you do Bayesian statistics for a number of tests including correlation analysis, *t*-tests or ANOVA
- [`lavaan`](lavaan/lavaan) is the package to go for when you want to do structural equation modeling, latent state-trait analysis, latent growth curve or latent change score modeling or or even simple path analysis including mediation analysis
- [`psych`](psych/psych) offers a lot of functions for individual differences research including calculating reliability and running factor analysis
