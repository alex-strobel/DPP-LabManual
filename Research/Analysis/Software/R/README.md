# R, RStudio and R Packages

## Table of Contents

- [R, RStudio and R Packages](#r-rstudio-and-r-packages)
  - [Table of Contents](#table-of-contents)
  - [R and RStudio](#r-and-rstudio)
  - [Recommended R packages](#recommended-r-packages)
    - [Helper packages](#helper-packages)
    - [Effect size estimation and power analysis](#effect-size-estimation-and-power-analysis)
    - [Statistical analysis](#statistical-analysis)
  - [R Programming Style Guide](#r-programming-style-guide)
  - [R Markdown](#r-markdown)

---

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

### Where have all my packages gone?

If you update R (and/or RStudio?), all the packages that do not come with the R installation are gone and you have to re-install them. While this is certainly to some degree reasonable, it is also extremely annoying. It is therefore recommended to save a list of all the packages installed before any R/RStudio update and then use this list to automatically re-install all your packages. You might want to resort to this code to do so:

```R
# Upgrade R without losing packages -------------------------------------------

# optional: remove all variables in global environment
rm(list = ls())

# path to save package information to
myPath = "/Users/alex/Documents/R"

# before updating R/RStudio, save installed packages
oldPkgs <- installed.packages()
oldPkgs[, 1]
setwd(myPath)
save.image('oldPkgs')

# now update R/RStudio, then open RStudio again and load list of previously installed packages
load('oldPkgs')
setwd(myPath)

# check for differences in prevously and currently installed packages
newPkgs <- installed.packages()
cat(paste0(nrow(oldPkgs) - nrow(newPkgs), ' packages need to be re-installed'), fill = T)
missingPkgs <- setdiff(oldPkgs[, 1], newPkgs[, 1])

# re-install missing packages available on CRAN
install.packages(missingPkgs)
nnewPkgs <- installed.packages()
cat(paste0(nrow(oldPkgs) - nrow(newPkgs), ' packages still missing'), fill = T)
missingPkgs = setdiff(missingPkgs, newPkgs[, 1])

# install still missing packages from GitHub

# install devtools package if necessary
if (!"devtools" %in% rownames(installed.packages()))
install.packages("devtools")

# install the stable papaja development version
devtools::install_github("crsh/papaja")

# install the latest papaja development snapshot
devtools::install_github("crsh/papaja@devel")


## R Programming Style Guide

We use the [tidyverse style guide](https://style.tidyverse.org/index.html) for R programming. Every team member is expected to adhere to this style guide as often as possible, as this will greatly facilitate collaboration on code and code review. It is recommended to use [RStudio's R Diagnostics](https://support.rstudio.com/hc/en-us/articles/205753617-Code-Diagnostics) (best to turn on all options). Then, RStudio will display small diagnostics symbols next to the line number that inform you about style such as `expected whitespace around '=' operator`. Sometimes it might be a bit tedious to put whitespaces around operators, because it is so much easier to code ...

```R
b=boxplot(df,boxwex=.5,staplewex=NA,lty=1,lwd=1.5,outpch=19,outcex=.8,outcol=8)
```

instead of adhering to the tidyverse style guide and write ...

```R
b = boxplot(
  df,
  boxwex = .5,
  staplewex = NA,
  lwd = 1.5,
  outpch = 19,
  outcex = .8,
  outcol = 8
)
```

Yet, one can write code just as in the first example above and then hit `Cmd+Shift+A` (Mac) or `Strg+Shift+A` (Windows), and the code will be reformatted as shown in the second example. RStudio uses [Headley Wickham's style guide](http://adv-r.had.co.nz/Style.html), but this guide is very similar to that of the tidyverse (it's the same author). 

## R Markdown

R Markdown is a simple and easy to learn formatting syntax for authoring HTML, PDF, and MS Word documents. 
R Markdown allows to create updatable and reproducible reports because one analyzes data and reports the results in one instance and in a dynamic manner. 

In principle, having a handful of data from a pilot study, you can write the Introduction and Methods section of a scientific manuscript in R Markdown language (with a little help from LaTeX), all analysis routines in R code, and by placing references to objects generated by this code (such as a linear model) in the text body of the Results section, you can even write up the whole Results section without even having started to collect the actual data. 
Once data collection (and possible preprocessing outside of R) is finished, your report will be ready in an instance, and all that remains to be done is the Discussion. 

But even if you are a novice who does not see oneself fit to anticipate all the possible routines one could take during data analysis, you will benefit from R Markdown.
If you, say, have collected answers to ten variables in a sample of 250 individuals and have performed a correlation analysis only, you will come up with a correlation table with a number of asterisks that denote the level of significance of an individual correlation coefficient. 
You then do a final quality check of the data (you should have done that initially, of course, but sometimes, one forgets ...) and find out that one participant stated *Boba Fett* as gender and *Kauderwelsch* as mother tongue (actually an empirical example, fantasy rarely beats empirical evidence!). 
You need to remove this individual from the analyses, but then every single correlation coefficient will change to some extent. 
Using R for analysis and Word for reporting, you would be required to check every single coefficient in your table and whether the number of asterisks attached to each coefficient is still valid). 
Using R Markdown, you simply update your document, and every coefficient will be the correct one and assigned with the correct number of asterisks.  

Christoph and I have developed a course on how to use R Markdown for writing manuscripts, but there are other courses around:  

- [Our R Markdown Course](https://github.com/alex-strobel/R-Markdown.git)
- [R Markdown for Scientists](https://rmd4sci.njtierney.com)

While we have tried our best to provide you with our knowledge on R Markdown, we consider us still as novices ourselves. 
So, it may pay to read the R Markdown Guide, and often enough, you may want to refer to the R Markdown Cheat Sheet:

- [R Markdown Guide](https://bookdown.org/yihui/bookdown/)
- [R Markdown Cheat Sheet](https://www.rstudio.com/wp-content/uploads/2015/02/rmarkdown-cheatsheet.pdf)

For psychological research reports, there exists a template that renders your R Markdown document in APA style (so far only available for its 6th edition). 
This template is included in the `papaja` package and you need to install it as described on the author's GitHub site. 
It may also pay to familiarize yourself with the manual and take some introductory tutorial.

- [*papaja* Download](https://github.com/crsh/papaja)
- [*papaja* Manual](http://frederikaust.com/papaja_man/)
- [*papaja* Tutorial](https://rpubs.com/izhong/papaja_tutorial)
