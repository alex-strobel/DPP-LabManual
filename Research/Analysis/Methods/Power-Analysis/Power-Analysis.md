# Power Analysis

[Alexander Strobel](mailto:alexander.strobel@tu-dresden.de)<br>
Faculty of Psychology, TU Dresden

2022-02-14

| This manual is work in progress. Contribute to make it more comprehensive (and comprehensible). |
| ----------------------------------------------------------------------------------------------- |

---

## Table of Contents

- [Power Analysis](#power-analysis)
  - [Table of Contents](#table-of-contents)
  - [Introduction](#introduction)
  - [Effect size estimation](#effect-size-estimation)
  - [Software to use for power analysis](#software-to-use-for-power-analysis)
  - [Simple (and not so simple) power analysis](#simple-and-not-so-simple-power-analysis)
  - [Power analysis for special analysis types](#power-analysis-for-special-analysis-types)
    - [Power for mediation analysis](#power-for-mediation-analysis)
    - [Power for structural equation modeling](#power-for-structural-equation-modeling)
      - [Satorra and Saris (1985)](#satorra-and-saris-1985)
      - [MacCallum, Browne and Sugawara (1996)](#maccallum-browne-and-sugawara-1996)
      - [Muthén and Muthén (2002)](#muthén-and-muthén-2002)
  - [Concluding remark](#concluding-remark)
  - [References](#references)

---

## Introduction

At AG.DPP, it is mandatory that you perform power calculations (or at least elaborate on power considerations) in any study that leaves the lab. If you feel insecure on this issue, please consult the following presentation:

- [Power Analyses](/Research/Administration/Workflow_research_projects/Resources/PowerAnalyses/DPP_LM_PowerAnalyses.pdf)

Ideally, we use power analyses to determine sample size *a priori*. Sometimes, however, we have to rely on convenience samples and can calculate power only *post hoc*. Both approaches are appropriate, but must be named as such. In the former case, we would state in our manuscript:

> Sample size was determined *a priori* based on a meta-analytically derived effect size for the effect of interest of *r* = .28. With a power of 1-&beta; = .80 and an &alpha; = .05 (two-tailed), the required sample size was *N* = 97 as determined using the R package [`pwr`](https://github.com/alex-strobel/DPP-LabManual/wiki/R-package-pwr).

In the later case, we would write something like:

> For our online survey, we set out to collect as many participants as possible within a time window of one month. We eventually had complete datasets of *N* = 348 participants. With this sample size, we were able to detect correlations of *r* ≥ .15 at a power of 1-&beta; = .80 and an &alpha; = .05 (two-tailed) as determined using the R package [`pwr`](https://github.com/alex-strobel/DPP-LabManual/wiki/R-package-pwr).  

## Effect size estimation

If the literature tells you what effect size to expect, this effect size is most likely inflated due to publication bias. Evidence from replication research (e.g., [Open Science Collaboration, 2015](https://doi.org/10.1126/science.aac4716)) suggests that even replicable effects are about half of the size as those originally reported. It may thus be wise to divide the effect size you found in the literature by two. This may be too conservative if you ground your power calculation on meta-analytically derived effect sizes and use that estimate for your power analysis. Yet, also [meta-analyses suffer from publication bias](Research/Analysis/Methods/Meta-Analysis/Meta_Analysis.md#assessing-publication-bias) and may overestimate effect sizes. Thus, it is perhaps a good idea to use the lower bound of the confidence interval of the effect size in question as estimate for your power analysis. Calculate the required sample size with a desired power of at least 80% and a significance level that accounts for possible [multiple testing](https://github.com/alex-strobel/DPP-LabManual/wiki/Correction-for-multiple-testing).

If you have no idea what effect size to expect, Cohen‘s classification most likely will not reflect the typical effect sizes in your area of research. If there are no established guidelines (such as those of [Gignac & Szodorai, 2016](http://dx.doi.org/10.1016/j.paid.2016.06.069), for individual differences research), assume a correlation of *r* = .20 (or any derivative such as an explained variance of .04, see [Fraley & Vazire, 2014](https://doi.org/10.1371/journal.pone.0109019)). A small to medium effect is more likely than a large one.

## Software to use for power analysis

The software used for power analysis makes no difference. Yet, [G\*Power](https://www.psychologie.hhu.de/arbeitsgruppen/allgemeine-psychologie-und-arbeitspsychologie/gpower) is more powerful than other software such as jamovi or the [R package `pwr`](https://github.com/alex-strobel/DPP-LabManual/wiki/R-package-pwr) under R. If there is no power analysis software for your specific effect size, run simulations.

## Simple (and not so simple) power analysis

In the basic case, you want to determine the sample size needed to detect a small to medium effect (which is most likely the size an effect in our field will have) *a priori* given a desired level of power (usually 1-&beta; = .80) and significance level (usually &alpha; = .05. Or you want to determine the power you had to detect the effect observed in a convenience sample given the sample size and the effect size (and a given &alpha;-level). Let us assume your effect size is a correlation, and you have no idea of its size in the population, Then, it is wise to assume a correlation of *r* = .20 and calculate the sample size needed to detect this effect using G\*power or the `pwr`package, in the latter case like this:

```R
ceiling(pwr::pwr.r.test(r = .20, power = .80, sig.level = .05)$n)
```

The rounding via `ceiling` is necessary because if the output tells you that you need an *N* = 181.25 to detect this effect, having only *N* = 181 participants would give you a power somewhat below .80. Therefore, we strive for at least *N* = 182, and ideally oversample by 10% to account for technical dropouts, missing values, and outliers (although it is another question [how to treat outliers](/Research/Analysis/Methods/Outliers/Outliers.md)). So, in this case, we would aim at an *N* ≥ 200.

Or, having had only a limited time window to collect data for a 3 hours experimental study involving EEG, you may have managed to recruit *N* = 112 participants. Here, you would determine either the effect size you were able to detect with this sample size and a given level of &alpha; and 1-&beta; or the achieved power given the observed effect size (say *r* = .23), your sample size and a given level of &alpha; like this:

```R
# required effect size, given sample size
pwr::pwr.r.test(n = 112, power = .80, sig.level = .05)$r)

# achieved power, given effect size
pwr::pwr.r.test(n = 112, r = .23, sig.level = .05)$power)
```

In the former case, you would write in the *Methods* part of your manuscript:

> Given our sample size of *N* = 112, we had a power of 1-&beta; = .80 to detect correlations of *r* ≥ .26 at an &alpha; = .05 (two-tailed).

In the latter case, you  would state in the *Discussion* part of your manuscript (in the *Limitations* section):

> Yet, given our sample size of *N* = 112, we only achieved a power of 1-&beta; = .69 for the observed effect size of *r* = .23 at &alpha; = .05 (two-tailed).

Yet, if you preregistered the direction of the effect in question, i.e., a positive correlation, you may also calculate *post hoc* power using a one-tailed &alpha;-level via:

```R
pwr::pwr.r.test(n = 112, r = .23, sig.level = .05, alternative = "greater")$power
```

In this case, you could write in your manuscript:

> Given that we preregistered a directed hypothesis on the relationship between our variables of interest, we achieved a power of 1-&beta; = .79, given our sample size of *N* = 112 and an observed effect size of *r* = .23 at &alpha; = .05 (one-tailed).

Don't be afraid of one-sided tests! If you pre-specified the direction, this is not only perfectly fine, but the appropriate way to run the test.

Yet, often, your analysis type isn't as simple as a correlation or a *t*-test. You may want to run a repeated-measures ANOVA with within-between interactions. Then the `pwr` package may not be useful anymore, and G\*Power will ask many questions on assumptions you have (such as the correlation between the repeated measures and/or the amount of nonsphericity correction). Such cases are a toughie, so ask you're colleagues, one or another may have come across such a case and knows how to tackle the problem. Or rely on G\*Power's defaults, they are usually set quite reasonably.

## Power analysis for special analysis types

As said, if there are no established routines for power analysis of your desired analysis routine, simulations may be the way to go. Yet, before we go at great lengths to program such simulations, we should always refer to the literature whether meanwhile there are published and perhaps even approved (i.e., frequently cited) routines for the analysis type we want to apply. Such analysis routines include:

1. mediation analysis
2. structural equation modeling
3. ...

Approaches for these types of analyses are outlined below.

### Power for mediation analysis

...<!-- insert link -->

### Power for structural equation modeling

There seem to be three commonly accepted approaches to run a power analysis for structural equation modeling (SEM) or any derivative of such as a more complex path analysis, the power of which cannot be determined in terms of regression analysis:

1. Satorra and Saris (1985)
2. MacCallum, Browne and Sugawara (1996)
3. Muthén and Muthén (2002)

#### Satorra and Saris (1985)

This approach is suitable for situations in which you are interested in a specific parameter. You compare two models: one with a parameter of interest (e.g., a regression weight) set free (the alternative model) vs. one with the respective parameter fixed to zero (the null model). Using, e.g., the function [`semTools::SSpower`](https://www.rdocumentation.org/packages/semTools/versions/0.5-5/topics/SSpower), you provide two models in `lavaan` syntax: the `powerModel` is the null model with the parameter of interest fixed to zero (or any other reasonable value) and the `popModel` with this parameter set free. I must admit that I do not really understand this method/function, so I will not go into further detail for now and will come to the suggested method for power calculation for SEM.  

#### MacCallum, Browne and Sugawara (1996)

The second approach, suggested by MacCallum et al. (1996), determines power based on the root mean square error of approximation (RMSEA). As far as I understand, this approach sets out to estimate the power to detect misspecification of your structural equation model. Basically, you state an RMSEA for the null hypothesis (H0) and another for the alternative hypothesis (H1). The MacCallum et al. paper is not very precise on what grounds you should choose the values for RMSEA<sub>H0</sub> and RMSEA<sub>H1</sub>. In one part if their paper, they compare an RMSEA of .05 vs. .08, in another part an RMSEA of .00 vs. .05. The nice thing is that there is an R package called [`semPower`](https://github.com/moshagen/semPower) that implements the MacCallum et al. approach. It was written by Morten Moshagen (professor for Psychological Research Methods at Ulm University) and Edgar Erdfelder (professor for Cognitive Psychology and Individual Differences who also contributed to G\*Power). So we can be quite confident that this package will do its job properly. As compared to other packages you could employ to run a power analysis based on the MacCallum et al. (1996) approach such as [`WebPower`](https://cran.r-project.org/web/packages/WebPower/index.html), with `semPower` you do not have to specify RMSEA<sub>H0</sub>, but only RMSEA<sub>H1</sub>. RMSEA<sub>H0</sub> seems to be zero per default. So the only question you have to deal with is what value to choose for RMSEA<sub>H1</sub>. I suggest to employ RMSEA<sub>H1</sub>=.06 for *a priori* power analysis, as this is the suggested cut-off value in Hu and Bettler (1999), and we usually refer to this paper when defining cut-off values to evaluate the fit of our structural equation models. For *post hoc* power analysis, you would of course use the RMSEA you achieved with your model.

As an example for an *a priori sample* size determination, you would state:

```R
required_n = semPower.aPriori(effect         = .06, 
                              effect.measure = 'RMSEA',
                              alpha          = .05, 
                              power          = .80, 
                              df             = df)$requiredN
```

You see that you need to know the degrees of freedom of you model (i.e., argument `df`). You can calculate the degrees of freedom from the number of (co)variances in your data (i.e., the lower triangle and the diagonal of a covariances matrix) minus the number of estimated parameters in your model (you may want to read a valuable blog post by Fred Clavel on [the issue of the degrees of freedom in SEM](https://fredclavel.org/2014/05/03/disentangling-degrees-of-freedom-for-sem/)) or simply specify your model using `lavaan` syntax and use the function `semPower.getDf(model)` to get the degrees of freedom of you model.

As an example for a *post hoc* power calculation, you would use the *N* and the *df* of your fitted model. For a sample size of *N* = 321 and *df* = 24, *post hoc* power would be:

```R
posthoc_power = semPower.postHoc(effect         = .06, 
                                 effect.measure = 'RMSEA', 
                                 alpha          = .05, 
                                 N              = 321, 
                                 df             = 24)$power
```

The power here is 1-&beta; = .90 to detect misspecification of your model at RMSEA = .06 (our cut-off). If we entered our actually achieved RMSEA, say RMSEA = .04, we would have had a power of only 1-&beta; = .46 to detect such a low level of misspecification with this sample size and model *df*. As a rule of thumb, the higher the *df*, the lower is the sample size needed to have adequate power to detect misspecification (see Tables 4 and 5 in MacCallum et al., 1996).

#### Muthén and Muthén (2002)

The third approach involves Monte Carlo simulations, which sounds too fancy for our mainly rather plain purposes, so we discard this method for now (but see [Muthén & Muthén, 2002](http://www.statmodel.com/bmuthen/ED231e/RelatedArticles/Article_097.pdf))

## Concluding remark

...

---

## References

- Hu, L. T. & Bentler, P. M. (1999). Cutoff criteria for fit indexes in covariance structure analysis: Conventional criteria versus new alternatives. *Structural Equation Modeling: A Multidisciplinary Journal, 6*(1), 1–55. <https://doi.org/10.1080/10705519909540118>

- MacCallum, R. C., Browne, M. W., & Sugawara, H. M. (1996). Power analysis and determination of sample size for covariance structure modeling. *Psychological Methods, 1*(2), 130–149. <https://doi.org/10.1037/1082-989X.1.2.130>

- Moshagen, M., & Erdfelder, E. (2016). A new strategy for testing structural equation models. *Structural Equation Modeling: A Multidisciplinary Journal, 23*(1), 54–60. <https://doi.org/10.1080/10705511.2014.950896>

- Muthén, L. K. & Muthén, B. O. (2002) How to use a Monte Carlo study to decide on sample size and determine power. *Structural Equation Modeling: A Multidisciplinary Journal, 9*(4), 599-620, <https://doi.org/10.1207/S15328007SEM0904_8>

- Satorra, A., & Saris, W. E. (1985). Power of the likelihood ratio test in covariance structure analysis. *Psychometrika, 50*(1), 83–90. <https://doi.org/10.1007/BF02294150>
