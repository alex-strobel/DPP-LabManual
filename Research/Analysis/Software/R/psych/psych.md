# R Package `psych`

## Table of Contents

- [R Package `psych`](#r-package-psych)
  - [Table of Contents](#table-of-contents)
  - [Useful functions](#useful-functions)
    - [Descriptives via `describeBy()`](#descriptives-via-describeby)
    - [Internal Consistencies via `alpha()`](#internal-consistencies-via-alpha)
    - [PCA via `principal()`](#pca-via-principal)
    - [Factor Analysis via `fa()`](#factor-analysis-via-fa)
    - [Parallel Analysis via `fa.parallel()`](#parallel-analysis-via-faparallel)
  - [Outlook](#outlook)


The `psych` package is authored by William Revelle, personality psychologist and - among others -  former president of the International Society for the Study of Individual Differences (ISSID) and the Association for Research in Personality (ARP). Check out his webpage at:

- https://personality-project.org/revelle.html

The `psych` package is highly recommended for almost every purpose one can imagine in individual differences research. It comes with a lot of very useful functions, a few of which will be highlighted here.

## Useful functions

### Descriptives via `describeBy()`

Consider you have some data.frame with the continuous variable *X* and the dichotomous variable *group*. You want to have descriptives for *X* grouped by *group*. Here is the R code for achieving this via the R console:

```R
# install and source psych
install.packages("psych")
library(psych)

# set seed for reproducible results
set.seed(242)

# generate data.frame with some continuous variable "X" and some dichotomous variable "group" 
df <- data.frame(X = rnorm(100), group = rep(0:1,50)) 

# load psych package
library(psych)

describeBy(df$X, group = df$group, mat = TRUE)
```

This will give you the following output:

```txt
    item group1 vars  n       mean        sd     median    trimmed       mad       min      max    range       skew   kurtosis        se
X11    1      0    1 50 -0.1428919 0.9418498 -0.2234637 -0.1214808 0.9369305 -2.360981 2.126402 4.487383 -0.1215498 -0.2916319 0.1331977
X12    2      1    1 50 -0.2204230 0.9321934 -0.4040389 -0.2456682 0.8360715 -2.295117 1.900494 4.195611  0.2387270 -0.3427044 0.1318321
```

Not all of that may actually be of interest for you, so you would rather write:

```R
describeBy(df$X, group = df$group, mat = TRUE)[c("n", "mean", "sd", "min", "max")]
```

returning the following output:

```txt
     n       mean        sd       min      max
X11 50 -0.1428919 0.9418498 -2.360981 2.126402
X12 50 -0.2204230 0.9321934 -2.295117 1.900494
```

Or you may be interested in skew and kurtosis instead, so adjust the above code accordingly. 

### Internal Consistencies via `alpha()`

This function calculates a number of measures of internal consistency (Cronbach's alpha and other indices) as well as item-total correlations etc. To try out this function, you need some set of more or less correlated variables that are located in some data.frame *df*. To generate these data, you may want to use the [`randcorr` function](https://github.com/alex-strobel/DPP-LabManual/blob/main/Functions/randcorr.R) and source it in R. Then proceed as follows:

```R
# set seed for reproducible results
set.seed(242)

# generate a set of 10 variables that correlate with each other at about r = .30 in N = 200
df <- randcorr(.3, 200, 10)
alpha.df <- alpha(df)
```

This function will return a list of which the most interesting entries may be Cronbach's alpha and the item-total correlation. To extract this information, type 

```R
alpha.df$total$raw_alpha   # for Cronbach's alpha
alpha.df$item.stats$r.drop # for the corrected item-total correlation
```
  
### PCA via `principal()`

This function lets you do a principal components analysis (PCA). PCA is often confused with factor analysis (for a short read about the issue, see [here](https://www.theanalysisfactor.com/the-fundamental-difference-between-principal-component-analysis-and-factor-analysis/)). To put it plain, PCA is used to decompose the variance in your data into several components that your data are composed of. For example, you might want to use PCA on EEG data to decompose individual event-related potential components such as P1, N1, P2, N2 and so forth. Factor analysis is used to infer latent variables underlying your data, e.g. when measuring one construct with a set of questionnaire items. The difference between PCA and factor analysis is thus first a conceptual one, but second, PCA differs from factor analysis also computationally, but we will not go into detail about that).

To perform a PCA on the data.frame just created and see the results, type

```R
pca.df <- principal(df)
pca.df
```

### Factor Analysis via `fa()`

This function lets you do a factor analysis. Per default, the following will be done using the so-called `minres` approach to factor analysis:

```R
fa.df <- fa(df)
fa.df
```

Instead of `minres` you could have also told the fa() function that you want to use *principal axis analysis* via the argument fm = "pa". Anyway, you will notice some differences in the results of `pca.df` and `fa.df`, but for now, we will not elaborate on this issue.

### Parallel Analysis via `fa.parallel()`

For now, you have only performed PCA or factor analysis without telling your procedure how many factors you want to extract. If there is no theory-grounded reason to assume a given number of factors, you need to determine the number of components (for PCA) or factors (for factor analysis). The Eigenvalues > 1 criterion is often used to decide on this question, but you should not use it because (insert reference why it is inferior). The so called Scree or Elbow test that relies on the inspection of the progression of Eigenvalues is not recommended. Rather, perform a parallel analysis to determine how many components or factors would be suggested given that you had random data. Plotting the empirical Eigenvalues together with that obtained using random data gives you an impression on how many components or factors to extract: You should extract as many components or factors that have Eigenvalues greater than that obtained when using random data.  

```R
pa.df <- fa.parallel(df)
pa.df
```

In this case, parallel analysis suggests exactly one component or factor should be extracted (you can see this in the plot and read it in the report generated by the function). You could also use the Very Simple Structure criterion to validate this choice (see the `psych` function vss(), but this is not the place to further elaborate on this criterion. 


## Outlook

This manual should have given you a first impression on the capabilities of the `psych` package. To learn more, simply type

```R
?psych
```

or read the `psych` user manual.

- https://personality-project.org/r/psych/psych-manual.pdf 
