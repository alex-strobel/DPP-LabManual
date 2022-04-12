# Mediation and Moderation

[Alexander Strobel](alexander.strobel@tu-dresden.de)<br>
Faculty of Psychology, TU Dresden

2022-04-12

---

## Table of Contents

- [Mediation and Moderation](#mediation-and-moderation)
  - [Table of Contents](#table-of-contents)
  - [Introductory remarks](#introductory-remarks)
  - [Mediation analysis](#mediation-analysis)

## Introductory remarks

Mediation and moderation analysis are often used tools (not only) in individual differences research.
Apart from being regression-based techniques, these analysis approaches do not have much in common.
Still, both techniques are often taught together, perhaps because the authors <!-- add ref. to Preacher and Hayes --> that introduced (or elaborated on) them are the same, perhaps it is due to the fact that the relationship of two variables *X* and *Y* is to be considered differently when accounting for a third variable *Z*, but perhaps it is simply because both techniques start with an *M*.

## Mediation analysis

In *mediation* analysis, one wants to determine the extent to which the relationship of an independent variable *X* and a dependent variable *Y* can be (partly or fully) explained by a third *mediating* variable *Z*.
The standard case of a *full* mediation would be the often used example of the relationship between the number of storches *X* and birth rates *Y*. Both correlate and would some naive individuals lead to the false assumption that storches bring babies.
In this hypothetical example, this relationship can be fully explained by the urbanization rate *Z*:
The higher the number of storches, the higher the birth rate.
The higher the urbanization rate, the lower the number of storches *and* the birth rate, because storches do not typically inhabit highly urbanized places, and birth rates are typically lower in urban regions (certainly with a few exceptions).

To test for such a mediation, one simply runs a series of regressions:

1) *Y* is regressed on *X*, which gives the direct relationship between the independent and the dependent variable. This path is usually denoted as path *c*.
2) *Z* is regressed on *X*, which gives the direct relationship between the independent vaiable and the mediator. This path is usually denoted as path *a*.
3) *Y* is regressed on both *X* and *Z*. This gives the relationship of *X* and *Y* when controlling for *Z* (denoted as path *c'*) as well as the relationship of *Z* and *Y* when controlling for *X* (denoted as path *b*).

In R notation, this would boil down to:

```R
lm(Y ~ X)      # path c
lm(Z ~ X)      # path a
lm(Y ~ X + Z)  # paths b and c' 
```

This series of regressions informs you about the *direct* relationship between *X* and *Y* *without* considering the mediator *Z* (i.e., path *c*) and *with* considering the mediator *Z* (i.e., path *c'*) as well as on the indirect relationship of *X* and *Y* via the mediator *Z*, which is the product of paths *a* and *b*. It follows that:

```R
cprime = c - a * b
```

which means that the direct (cor)relation of *X* and *Y* is reduced by the amount of the (cor)relations of *X* and *Z* times the (cor)relation of *Y* and *Z*.

