# Outliers

[Alexander Strobel](alexander.strobel@tu-dresden.de)<br>
Faculty of Psychology, TU Dresden

2022-02-09

---

## Table of Contents

- [Outliers](#outliers)
  - [Table of Contents](#table-of-contents)
  - [Introduction](#introduction)
  - [Outliers vs. extreme values](#outliers-vs-extreme-values)
  - [A priori definition of outliers](#a-priori-definition-of-outliers)
  - [A posteriori definition of outliers](#a-posteriori-definition-of-outliers)
  - [Excluding multivariate outliers done "properly"](#excluding-multivariate-outliers-done-properly)
    - [General procedure](#general-procedure)
  - [Not excluding multivariate outliers done "properly"](#not-excluding-multivariate-outliers-done-properly)
    - [Use robust statistics](#use-robust-statistics)
    - [Run your analyses twice](#run-your-analyses-twice)
  - [Situations where outlier exclusion might be necessary](#situations-where-outlier-exclusion-might-be-necessary)
  - [Take-home message](#take-home-message)

---

> **Summary.** In what follows, it is argued that it is often enough difficult to define whether a measurement point is an outlier. There may be rational reasons to context-dependently define measurements as outliers, and there are statistical methods to define univariate or multivariate outliers. Both approaches always imply some subjective decision-making, so we usually refrain from excluding outlier for various the outlined below and rather use robust statistical methods or run our analyses twice, one (for the paper) with all data points and one (for the supplement) with outliers excluded. An exception from this general rule may be made if outlier exlusion results in the convergence of a statistical model that otherwise would not converge.  

---
## Introduction

We will often have to deal with data sets that contain participants that in some measure or another exhibit values that we consider as outliers or extreme values.
And here begins the confusion, as, e.g., SPSS marks values as outliers (with a circle) if they are &plusmn; 1.5 \* the interquartile range (IQR) below or above the box (i.e., the 25th or the 75th quantile), while it marks (with a +) as extreme values such cases that are &plusmn; 3.0 \* the IQR.
Other sources <!-- add reference, see Michael Höfler's OSIP talks on the issue --> define outliers as individuals that come from a different population, while extreme values are from individuals coming from the same population as the remainder of the participants of our study.
Statistically, we cannot distinguish between the former and the latter, even though the SPSS plots seem suggests that.
So how to define some participant or participant's measurement as outlier/extreme value?

## Outliers vs. extreme values

Because we cannot know whether values that are more extreme than that of others in our sample come from individuals of the same or a different population, we – for the time being until we know better - will not distinguish between outliers and extreme values.
We will simply call all extreme values *outliers*.

## A priori definition of outliers

Ideally, we have some means to define improbable values of some measurement as outliers.
In, e.g., reaction time (RT) based research, RTs faster than, e.g., 100-200 ms are improbable.
Still, the exact limits for what is improbably fast will always be subject to discussion.
If you have an extended time for a decision of, e.g., to accept or reject an offer in an Ultimatum Game, an RT of around 100 ms is not as improbable as in a setting that requires continuous responses within a short time frame, such as in an oddball task.
In the former setting, participants may have had 2000 ms to deliberate and then, upon prompted to act, may have locked in their responses quite fast, because they decided to do so way ahead of the prompt and simply had their already implemented motor program to be executed, so RTs of < 100 ms cannot considered as outliers.
In the latter setting, participants cannot anticipate whether an oddball would be presented, no motor program can be send to the motor cortex to be ready to be executed, and RTs < 100 ms are rather improbable.
So, the lower bound of which RTs to denote as improbable will always depend on your paradigm and will need to be discussed with colleagues.
Importantly, in any case, these discussions should be take place ahead of gathering the data.

The upper bound of improbable values, at least for RT-based research, is easier to define.
Most of the time, we will have some response deadline, e.g., 1000 ms.
In this case, all responses made after 1000 ms will be recorded as outliers.
This approach is also not undisputed because we may have simply set our response deadline too tightly.
Still, as is was predefined, we cannot fall back to some other criterion (and therefore should not record any RT later than the response deadline so that we are not tempted to extend the deadline on empirical grounds, except for pilot studies).

In questionnaire- or test-based research, there are no such a priori upper and lower bounds.
For tests, we could maybe assume that, e.g., a standardized IQ score of < 70 (i.e., - 2 standard deviations below the mean) would be rather improbable when examining psychology students.
But what about a standardized IQ score of  > 130 (i.e., + 2 standard deviations above the mean)?
And what about participants that scored at the extremes of some personality questionnaire?
Would it be improbable that someone scores at the absolute lower end of a Neuroticism scale?

## A posteriori definition of outliers

In such cases, we may want to refer to some deviation measure that informs us whether someone scored, e.g., &plusmn; 2 or 3 standard deviations from the mean of the respective sample (or &plusmn; 1.5 or 3 IQR from the boxes of a boxplot).
Still, this would only be valid for the univariate case, and if you exclude someone who scores extremely on some variable, then there may be another one or two participants who after exclusion of this case score extremely based on a new range of deviation from some central tendency.
So exclusion of participants based on univariate outliers should be avoided in any case unless their values are improbable by plain sight (e.g., age = 146 or -13).
Rather, as we most often will run tests that rely on multivariate (and not univariate) normality anyway, we could exclude multivariate outliers.
If we want to do so (and it will remain to be discussed whether we should), we should run our test of multivariate normality not based on the total of variables in the dataset, but only on the variables we enter into some statistical procedure.
If we have the dependent variable Y and want to run a regression analysis with X1 to X5 as predictors and the another one with X6 to X10 as predictors, we do a Mardia test for deviation from multivariate normality twice via `psych::mardia(data.frame(Y, X1, X2, X3, X4, X5))` and `psych::mardia(data.frame(Y, X6, X7, X8, X9, X10))`.
Depending of the results, we may want to exclude cases from the former analysis (more on how to decide on exclusion below), but not from the latter.
But still, such an exclusion of multivariate outliers may be done arbitrarily, so if we think, we must exclude outliers, we proceed as follows.

## Excluding multivariate outliers done "properly"

### General procedure

We exclude them based on Mahalanobis distances.
What exactly that means will most certainly be subject of another manual, but for now, it is safe to say that this is the most appropriate way of excluding multivariate outliers (reference missing).
The following function will help to do so:

```R
outliers <- function(df, threshold = .001) {
  m = psych::mardia(df, plot = FALSE)
  p = 1 - pchisq(m$d^2, df = ncol(df))
  o = which(p < threshold)
  return(list(mardia = m, D.square = m$d^2, p.values = p, outliers = o))
}
```

This - not only poorly, but not at all documented - function first calculates the Mahalanobis distances (`m`).
Then, for the the squared distances `m$d^2`, it calculates p-values  (`p`) based on a &chi;<sup>2</sup>-distribution with as many degrees of freedom as there are variables under study (`ncol(df)`) and compares them against a given threshold, which in this function is per default &alpha; = .001, which means a rather stringent criterion to exclude outliers (returned in vector `o`).
One may want to use more liberal thresholds such as &alpha; = .01 or &alpha; = .05, which results in more "outliers" to be identified as such, but then you may loose a considerable number of participants.
In any case, **we define your threshold for outlier exclusion in advance**.

## Not excluding multivariate outliers done "properly"

Or we do not exclude outliers at all, because given the degrees of freedom you have to do so and all the other imponderables outlined above, doing so may be a source of bias.
If we do not exclude outliers, there are two ways of doing so "properly" (and by setting the *properly* in quotes, it is meant that this is not the only and universally agreed-upon way to do so, just the way I/we recently often did it and were happy with it).

### Use robust statistics

If there are outliers, the assumptions of standard statistical tests may be violated, limiting the validity of their results.
Therefore we use *robust* statistics to account for such violations, including but not limited to:

- Spearman instead of Pearson correlations
- bootstrapped mean differences instead of a two-sample *t*-test
- robust instead of linear regression (e.g., via the `lmrob()` function of the `robust base` package)
- robust instead of standard Maximum Likelihood estimation in case if structural equation modeling or path analysis

Generally speaking, bootstrapping is an option for almost all statistical tests, so you might want to go for it instead of having to install yet another R package for solely one purpose.
My advice would be to *always use robust statistics*.
In my point of view, there are no arguments for not using robust statistics per default (although there certainly are such arguments such as superior power if there are no violations of assumptions).
Also, it may also spare us to test for a violation of assumptions in the first place (what we nevertheless always should do, but sometimes, this matter might complicate our even complicated manuscript even further).

### Run your analyses twice

We may also consider - e.g., in case there are no robust alternatives to your statistical test, but I would doubt there aren't - to run your analysis with and without outliers (as determined as described above) to show that our results do not change when in/excluding outliers.
The drawback here is that your manuscript gets longer or we need a supplemental material (but we will need it anyway in most cases).

## Situations where outlier exclusion might be necessary

We should always be aware that some statistical procedures (such as structural equation models, mixed linear models and the like) may surprise us with an error message stating that the model did not converge.
In such cases, exclusion of outliers may be a solution, while simply normalizing the variables included in our analysis may do as well (but the benefits and pitfalls of data normalization are another story that will be told another time).
In our data analysis plan/preregistration, we therefore need to consider this necessity and would, e.g., write:

> Deviations from univariate and multivariate normality as assessed using Shapiro-Wilk and Mardia tests will be documented, but no outlier exclusion will be performed unless the mixed linear models employed for hypothesis testing may not converge. If so, we will first try to normalize the variables involved in our models via the RANKIT algorithm <!-- add ref. --> and if our models still do not converge, we will exclude multivariate outliers based on Mahalanobis distances with a cut-off *p*-value = .001.

## Take-home message

In our data, there will most likely be some participants that will qualify to count as outliers for one reason or another, making it likely that our statistical approach is less valid. We can remove them based on criteria outlined above, but because

1. we often cannot know whether they are real outliers or just extreme cases
2. often there are no objective criteria to define cases as outliers, and
3. we can always use robust statistics that ameliorate possible distortions due to outliers

it is suggested here to *not exclude* them unless it is clear that their values of some variables are improbable (see the above example for age) or they seem not trustworthy otherwise (such as gender = "Boba Fett", ).
