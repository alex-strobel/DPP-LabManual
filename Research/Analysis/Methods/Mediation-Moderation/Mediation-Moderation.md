# Mediation and Moderation

[Alexander Strobel](alexander.strobel@tu-dresden.de)<br>
Faculty of Psychology, TU Dresden

2022-04-12

---

## Abstract

Mediation and moderation analyses are widely used regression-based techniques in psychological and individual differences research, yet they address fundamentally different research questions. This article provides a concise conceptual and practical introduction to both approaches, clarifying their distinct purposes and typical implementations.

Mediation analysis examines whether the association between an independent variable (*X*) and a dependent variable (*Y*) can be explained, in part or in full, by a third variable (*M*). The core idea is to decompose the total effect of *X* on *Y* into a direct effect and an indirect effect transmitted via the mediator. This is achieved through a series of regression models estimating paths *a*, *b*, *c*, and *c′*, with the indirect effect defined as the product of paths *a* and *b*. Mediation analysis is particularly useful for theory-driven questions about underlying mechanisms, but its interpretation relies on strong assumptions about causal ordering and omitted variables.

Moderation analysis, in contrast, tests whether the strength or direction of the relationship between *X* and *Y* depends on the level of a third variable (*M*). After mean-centering the predictor and moderator, moderation is evaluated by including an interaction term in a regression model. Significant interactions are further examined using simple slope analyses to characterize the relationship between *X* and *Y* at low and high levels of the moderator.

Together, these analyses offer complementary tools: mediation focuses on explanatory pathways, whereas moderation addresses conditional effects and boundary conditions.

---

## Table of Contents

- [Mediation and Moderation](#mediation-and-moderation)
  - [Table of Contents](#table-of-contents)
  - [Introductory remarks](#introductory-remarks)
  - [Mediation analysis](#mediation-analysis)
  - [Moderation analysis](#moderation-analysis)

## Introductory remarks

Mediation and moderation analysis are often used tools (not only) in individual differences research.
Apart from being regression-based techniques, these analysis approaches do not have much in common.
Still, both techniques are often taught together, perhaps because the authors that introduced (or elaborated on) them are the same, perhaps it is due to the fact that the relationship of two variables *X* and *Y* is to be considered differently when accounting for a third variable *Z*, but perhaps it is simply because both techniques start with an *M*.

## Mediation analysis

In *mediation* analysis, one wants to determine the extent to which the relationship of an independent variable *X* and a dependent variable *Y* can be (partly or fully) explained by a third *mediating* variable *M*.
One standard example is that the relation between the number of storches and the number of births in a given region can be explaied by the urbanization of that region.

To test for such a mediation, one simply runs a series of regressions:

1) *Y* is regressed on *X*, which gives the direct relationship between the independent and the dependent variable. This path is usually denoted as path *c*.
2) *M* is regressed on *X*, which gives the direct relationship between the independent vaiable and the mediator. This path is usually denoted as path *a*.
3) *Y* is regressed on both *X* and *M*. This gives the relationship of *X* and *Y* when controlling for *M* (denoted as path *c'*) as well as the relationship of *M* and *Y* when controlling for *X* (denoted as path *b*).

In R notation, this would boil down to:

```R
lm(Y ~ X)      # path c
lm(M ~ X)      # path a
lm(Y ~ X + M)  # paths b and c' 
```

This series of regressions informs you about the *direct* relationship between *X* and *Y* *without* considering the mediator *M* (i.e., path *c*) and *with* considering the mediator *M* (i.e., path *c'*) as well as on the indirect relationship of *X* and *Y* via the mediator *M*, which is the product of paths *a* and *b*. It follows that:

```R
cprime = c - a * b
```

For details on mediation analysis, see:

- [David A. Kenny: Mediation](https://davidakenny.net/cm/mediate.htm) <!-- link updated Jan 19 2026 -->

## Moderation analysis

In *moderation* analysis, one wants to determine whether a relation between an independent variable *X* and a dependent variable *Y* differs depending on the levels of a third *moderating* variable *M*.
One example would be that the relationship between the time invested in learning and a test result is moderated by intelligence: individuals with a low level of intelligence need to invest more time to yield good test results than individuals with a high level of intelligence.

To test for moderation, one first needs to mean-center (not standardize!) *X* and *M*. Then, a regression analysis with an interaction term is performed:

```R
X = scale(X, scale = F)
M = scale(M, scale = F)
lm(Y ~ X + M + X:M)
```

A significant interaction effect `X:M` means evidence for a moderation effect.
Yet, we still do not know exactly how this interaction looks like.
We therefore perform a simple slope analysis, i.e., we compare the regression slopes at low vs. high levels of *M* (for a continuous moderator typically one standard deviation below or above the mean). To do so, we need to perform a highly counterintuitive calculation:

```R
M_lo = M + sd(M)
M_hi = M - sd(M)
```

If we now include these newly calculated variables into our regressions, we get the simple slopes for low vs. high levels of the moderator:

```R
# slope for X gives simple slope for low levels of moderator
lm(Y ~ X + M_lo + X:M_lo) 

# slope for X gives simple slope for high levels of moderator
lm(Y ~ X + M_hi + X:M_hi) 
```

The result could look like this:

<img align = "middle" src="Resources/moderation.jpg" width = "400">


For details on moderation analysis, see:

- [David A. Kenny: Moderation](https://davidakenny.net/cm/moderation.htm)

