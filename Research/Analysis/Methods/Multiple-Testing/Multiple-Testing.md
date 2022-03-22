# Multiple Testing

[Alexander Strobel](alexander.strobel@tu-dresden.de)<br>
Faculty of Psychology, TU Dresden

2022-02-14

---

## Table of Contents

- [Multiple Testing](#multiple-testing)
  - [Table of Contents](#table-of-contents)
  - [Introduction](#introduction)
  - [Correction methods](#correction-methods)
    - [Bonferroni correction](#bonferroni-correction)
    - [Matrix spectral decomposition](#matrix-spectral-decomposition)
    - [Holm correction](#holm-correction)
    - [FDR correction](#fdr-correction)
    - [Other correction methods](#other-correction-methods)
    - [Correction for multiple testing if using confidence intervals](#correction-for-multiple-testing-if-using-confidence-intervals)
  - [Suggested correction methods](#suggested-correction-methods)

## Introduction

When we test a hypothesis using the frequentist approach, we typically say that the test was significant, if *p* < .05.
Yet, if we test the same hypothesis multiple times, 5% of these tests will produce significant results per chance.
As an example: You hypothesise that Neuroticism is negatively correlated with overall well-being.
You assess the former using the NEO-PI-R and the later via the WH0-5 self-report questionnaire.
If you now correlate the six Neuroticism facts with the WHO-5 total score, you need to correct for multiple testing because you test the same hypothesis six times (for each facet).
This page will outline the most commonly used correction methods in our group and will close with a general recommendation.

## Correction methods

### Bonferroni correction

The most often (and most often inappropriately) used method to correct for multiple testing is the Bonferroni method:

<center>&alpha;' = 0.05/k</center>

where *k* is the number of tests performed on the same hypothesis.
This method is very conservative (i.e., tends to over-correct) because it requires that the tests performed are independent from each other.
For the Neuroticism facets, this is clearly not the case, because they naturally correlate.
So what correction would be more appropriate here?

### Matrix spectral decomposition

The best way in such a case is to determine the number of independent variables in your data set via so-called *matrix spectral decomposition*.
This method was proposed by [Nyholt (2004)](https://doi.org/10.1086/383251) in the context of molecular genetic association studies and resembles *Principal Components Analysis (PCA)*.
To determine the number of independent variables constituting your correlation matrix, you can use the [`mspd`](https://github.com/alex-strobel/DPP-LabManual/blob/main/Functions/mspd.R) function:

```R
mspd <- function(corr.mat) {
  # corr.mat is a correlation matrix
  V    = nrow(corr.mat)
  EV   = eigen(corr.mat)$values
  Veff = 1 + (V - 1) * (1 - (var(EV) / V))
  return(Veff)
}
```

In our example, the six Neuroticism facets plus the WHO-5 scale would correlate to about *r* = .50. 
After having sourced the [`randcorr`](https://github.com/alex-strobel/DPP-LabManual/blob/main/Functions/randcorr.R) function, 
we employ the `mspd` function above to determine how many independent variables underlie our correlation matrix.

```R
set.seed(242)
df = randcorr(.5,256,6)
mspd(cor(df))
```

This gives us 4.73 as Bonferroni-correction factor (instead of 6), the resulting adjusted &alpha;-level would be .0105 (instead of .0083) which can make a difference.
Yet, while I believe that this method is the most straightforward, it is not that common in other fields than molecular genetics.
Therefore, you would need to describe the method and its advantages, but still you might leave the impression that you employed some odd correction method where more common methods might have been used.

### Holm correction

The `corr.test` function of the *psych* package per default gives you Holm-corrected *p*-values and it does so for a reason: 
It is just a not-so-conservative-but-still-valid version to control for multiple testing.
With the so-called *Bonferroni-Holm correction*, you sort the *p*-values from the lowest to the highest.
If the lowest *p*-value survives the Bonferroni-corrected level (in our example &alpha;' = .05/6 ~ .008), the next higher *p*-value is evaluated via &alpha;' = .05/5 = .01, and if it survives that threshold, the next higher *p*-value is evaluated via &alpha;' = .05/4 = .0125 and so on.
That way, you progressively become more liberal in evaluating your *p*-values.

### FDR correction

This method aims to control the *False Discovery Rate*.
Similarly to the *Holm* method, the *p*-values are sorted, but this time in descending order.
The highest *p*-value is compared against the conventional &alpha;-level and if it is significant, testing is stopped and all smaller *p*-values are significant as well.
If the largest *p*-value is not significant, then the next lower *p*-value is compared against &alpha;/2, and if it is significant, again testing is stopped and all smaller *p*-values are significant as well.
If it is not significant, then the next lower *p*-value is compared against &alpha;/3, and so forth.

### Other correction methods

The `p.adjust` function of the base R *stats* package provides you with a number of common methods to correct for multiple testing.
Unfortunately, the help-page of this function isn't helpful at all when it comes to understand how these methods work and how they differ.
Yet, you might want to see this as a learning opportunity to find out by yourself ...

### Correction for multiple testing if using confidence intervals

More and more journals discourage the use of *p*-values and request the reporting of confidence intervals (CI), usually the 95% CI.
If we need to correct for multiple testing, the only way to do so is to adjust the CI accordingly.
In the above example, our CI would be 1-.05/6 = .99167, i.e., a 99.167 CI (or round up to a 99.2 CI to be even more conservative or round down to a 99% CI to account for the too conservative nature of the Bonferroni correction when measure correlate).

## Suggested correction methods

Of the described correction procedures, the Bonferroni is the most conservative, FDR the least, Holm falling somewhere in between, and for matrix spectral decomposition, it depends on how highly the variables intercorrelate.
So which one to choose?

- Depending on how transparent you want to be about your correction for multiple testing, consider the following:
Occam's razor suggests that among several explanations for a phenomenon, the simpler one is more likely to be true.
Transferring this principle to multiple testing, one could assume that the simpler one is most likely the most appropriate.
While I am really fond of the *matrix spectral decomposition* method because it made sense for most of my correction for multiple testing issues in the past, I acknowledge that it does not come as a simple method in the sense that it can easily be explained.
Hence, if you already have a lot to explain in your *Statistical analysis* section, *matrix spectral decomposition* might not be the correction method to go for.
- Depending on the audience you want to address, you may want to choose the *Holm* method for correlational research and alike and the *FDR* method for neuroscientific research because these methods are known in the respective fields, so it will be less likely that some reviewer raises doubt on your correction method.
- Depending on how conservative you want to be in your correction, *Holm* would be the method of choice unless your tests are independent from each other (i.e., the variables in question do not correlate), then *Bonferroni* would be the method of choice.

In any case, *make your choice in advance* and do not decide after you know the results.
Also consider the multiple testing issue in your power analysis!
As you do not know the *p*-values in advance, you need to rely on either *Bonferroni* or (if you have some notion on the intercorrelation of the variables in question) *matrix spectral decomposition* to do so.
In your preregistration, you could write something like:

> For power calculation, we used a Bonferroni-corrected *p*-value of &alpha;' = .05/6 ~ .008 which together with an assumed effect size of *r* = .30 and a power of 1-&beta; = .95 yielded a sample size of *N* = 196.
>  However, given that the variables in question are correlated, Bonferroni-correction is not appropriate for our correlation analysis, which is why we will use the Holm method to correct for multiple testing in the actual study.
