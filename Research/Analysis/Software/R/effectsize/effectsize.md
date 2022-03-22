# R Package `effectsize`

The `effectsize` package comes with a number of functions you can use to calculate or convert effect sizes. You can, e.g., easily calculate Cohen's *d* from a *t*-test and then convert it to a correlation.

Example:

```R
# install and source effectsize package
install.packages("effectsize")
library(effectsize)

# generate some data
set.seed(242)
x <- rnorm(100, mean = 0, sd = 1)
y <- rnorm(100, mean = 1, sd = 1) 

# perform t-test for independent samples
tt <- t.test(x, y)

# get Cohen's d
d <- t_to_d(t = tt$statistic, df_error = tt$parameter)

# convert Cohen's d to correlation
d_to_r(d = d$d)
```

Check out the options `effectsize` offers:

```R
?effectsize
```

An ideal complement to `effectsize` is the [R package `pwr`]([pwr/pwr](https://github.com/alex-strobel/DPP-LabManual/blob/main/Research/Analysis/Software/R/pwr/pwr.md)).
