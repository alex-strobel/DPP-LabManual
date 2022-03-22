# R, RStudio and R Packages

## Table of Contents

- [R, RStudio and R Packages](#r-rstudio-and-r-packages)
  - [Table of Contents](#table-of-contents)
  - [R and RStudio](#r-and-rstudio)
  - [Recommended R packages](#recommended-r-packages)
    - [Helper packages](#helper-packages)
    - [Effect size estimation and power analysis](#effect-size-estimation-and-power-analysis)
    - [Statistical analysis](#statistical-analysis)

## R and RStudio

R is a software environment that is mainly used for statistical computing, but in fact, it is an all-purpose computing environment that is quite similar to MATLAB although the syntax is somewhat but not entirely different. 
That is, you can do a lot of other things than statistical computing with R. 
Yet, *if* you mainly want to do statistical computing, R will in most cases outperform MATLAB (plus, the community is nicer to newbies) because for literally every purpose you can imagine for statistical computing, there is at least one R package (there is even one for [playing a beep](https://cran.r-project.org/web/packages/beepr/index.html) which is nice for analysis routines that take some time so that meanwhile you can do something else but get notified when the analyses are done). 

Also, R enables you to use [R Markdown](https://github.com/alex-strobel/DPP-LabManual/wiki/R-Markdown) for writing dynamic reports.
It can be linked to [GitHub](https://github.com/alex-strobel/DPP-LabManual/wiki/GitHub) for version control.
And among a vast number of other possibilities that R offers, it enables you to use the [`renv` package](https://github.com/alex-strobel/DPP-LabManual/wiki/R-package-renv) for having a common R environment for a given project so that you can easily share your data and code with others. This will greatly improve reproducibility of your results.

R is best used together with RStudio as frontend that comes with a number of benefits that stand-alone R may not provide (I cannot tell because I have never used stand-alone R). 
To install R and RStudio, go to: 

- [The R Project for Statistical Computing](https://www.r-project.org)
- [RStudio](https://www.rstudio.com/products/rstudio/download/) 

The R Project provides an _Introduction to R_, but it is not a short read. For a denser overview on the basics of R, you may want to use the cheat sheet below:

- [Introduction to R](https://cran.r-project.org/doc/manuals/r-release/R-intro.pdf)
- [Base R Cheat Sheet](https://iqss.github.io/dss-workshops/R/Rintro/base-r-cheat-sheet.pdf)

So far, I could not find a both useful *and* visually appealing introduction to RStudio, just ask the internet if you do not find RStudio's GUI self-explaining.

## Recommended R packages

This folder contains manuals on a number of recommended R packages. Not all of the latter have been developed strictly for data analysis purposes, but in the broadest sense, they all serve the purpose of a reproducible data analysis.

So far, there are manuals on the following R packages you should have installed:

### Helper packages

- [`here`](here/here.md) flags some project folder as root so that all data and code of that folder can easily be accessed
- [`renv`](renv/renv.md) enables you to create a reproducible R environment
- [`targets`](targets/targets.md) is a pipeline toolkit that learns how your pipeline fits together, monitors your pipeline, skips costly runtime for tasks that are already up to date, and runs only the necessary computations
 
### Effect size estimation and power analysis 

- [`effectsize`](effectsize/effectsize.md) lets you calculate or convert effect sizes
- [`pwr`](pwr/pwr.md) provides the most common routines for power analysis
  
### Statistical analysis

- [`BayesFactor`](BayesFactor/BayesFactor.md) lets you do Bayesian statistics for a number of tests including correlation analysis, *t*-tests or ANOVA
- [`lavaan`](lavaan/lavaan) is the package to go for when you want to do structural equation modeling, latent state-trait analysis, latent growth curve or latent change score modeling or or even simple path analysis including mediation analysis
- [`psych`](psych/psych) offers a lot of functions for individual differences research including calculating reliability and running factor analysis

