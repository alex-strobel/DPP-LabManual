# Effect Sizes

[Alexander Strobel](alexander.strobel@tu-dresden.de)<br>
Faculty of Psychology, TU Dresden

2022-01-28

---

## Table of Contents

- [Effect Sizes](#effect-sizes)
  - [Table of Contents](#table-of-contents)
  - [Introduction](#introduction)
  - [Recommendation](#recommendation)
  - [References](#references)

## Introduction

At AG.DPP, the effect sizes of interest are most often correlations *r*, sometimes also explained variance (partial) &eta;<sup>2</sup>, and even less often Cohen's *d*. To classify effect sizes, researchers often refer to Cohen's guidelines given in [Cohen (1988)](#references). This has been criticised in recent years, and efforts have been made to provide empirically informed classification schemes, mainly based on the percentiles of correlations (and in some instances also Cohen's *d*) that can be found in meta-analyses in subdisciplines of psychology. Table 1 provides a (non-exhaustive) list of such studies.

**Table 1.** Classification of correlations according to different sources

| Source                                     |         Field          |    Type     |  small  | medium  | large |
| :----------------------------------------- | :--------------------: | :---------: | :-----: | :-----: | :---: |
| [Cohen (1988)](#references)                |       statistics       |  notional   | .10-.30 | .30-.50 | > .50 |
| [Hemphill (2003)](#references)             |   treatment/therapy    |  empirical  |  < .20  | .20-.30 | > .30 |
| [Bosco et al. (2015)](#references)         |   applied psychology   |  empirical  |  < .09  | .09-.26 | > .26 |
| [Gignac & Szodorai (2016)](#references)    | individual differences |  empirical  | .10-.20 | .20-.30 | > .30 |
| [Brydges (2019)](#references)              |      gerontology       |  empirical  |   .12   |   .20   |  .32  |
| [Funder & Ozer (2019)](#references)        |        general         | integrative |   .10   |   .20   |  .30  |
| [Lovakov & Agadullina (2021)](#references) |   social psychology    |  empirical  |   .12   |   .24   |  .41  |
| [Feng et al. (2022)](#references)          |        imaging         |  empirical  |   .13   |   .29   |  .48  |

The study by [Feng et al. (2022)](#references) deserves particular mention. Examining 821 effect sizes from 120 imaging studies that investigated correlations between brain activation and affective symptoms, they observed the 25th, 50th, and 75th quantiles of the correlations being .13, .29, and .48 (see Table 1). When significant effects were contrasted with insignificant ones, the respective correlations were .37, .47, and .61 for significant results as compared to .07, .15, and .24 for insignificant results. This shows quite nicely that in fields with notoriously small sample sizes (e.g., *N* ~ 20-30 for imaging studies, [Szucs & Ioannidis, 2017](#references)), effect sizes appear to be larger than in fields with larger sample sizes (e.g., *N* ~ 100 for social and personality psychology, [Fraley & Vazire, 2014](#references)), which may simply reflect publication bias, as the figures from the insignificant (yet in this case at least published) effects in [Feng et al. (2021)](#references) nicely illustrate.

In another highly interesting study, [Schäfer and Schwarz (2019)](#references) compared effect sizes from preregistered studies with effect sizes from studies without preregistration and found that the median effect size of the former studies was *r* = .16 as compared to *r* = .36 for the latter studies. Also, there were considerable differences between subdisciplines: studies from experimental and biological psychology had a median effect size way over .40, while studies from social psychology had a median of around .30. The authors discuss this as follows: "The largest effects come from disciplines such as experimental and biological psychology where the use of more reliable instruments and devices is common ([Schäfer & Schwarz, 2019](#references), p. 8)". Yet, given that at least in self-regulation research, experimental tasks have a far lower reliability than questionnaires (.31 vs. .67, [Enkavi et al., 2019](#references)) and that task-fMRI measures are also far from being reliable (.40, [Elliott et al., 2020](#references)), sample size in concert with publication bias seems a better explanation: in the analysis of [Schäfer and Schwarz (2019)](#references), studies from experimental and biological psychology had a median sample size of *N* = 32, and *N* = 42 participants, respectively, while the median sample size in social psychological studies was *N* = 150 (and preregistered studies had a median sample size of *N* = 268!). Still, the possibility of between-discipline differences in effect sizes remains, and a final important observation of [Schäfer and Schwarz (2019)](#references) that between-subjects designs produced smaller effect sizes than within-subjects designs, median *r* .34 vs. .38 for studies without preregistration and .12 vs. .31 for preregistered studies, lead the authors to the conclusion that general benchmarks are not useful.

## Recommendation

Given this evidence, if we *must* classify an effect, we at AG.DPP use the thresholds **.10**, **.20**, and **.30** to classify correlations as **small**, **medium**, and **large**, and cite [Gignac and Szodorai (2016)](#references) as reference because they derive their classification from studies from individual differences research. Table 2 gives the sample sizes needed to detect correlations of this size with 80%, 90%, and 95% power (analyses done with the [`pwr` package](https://github.com/alex-strobel/DPP-LabManual/wiki/R-package-pwr)).

**Table 2.** Sample sizes needed to detect small, medium, and large correlations

| Power<br>1-&beta; | small<br>.10 | medium<br>.20 | large<br>.30 |
| :---------------: | :----------: | :-----------: | :----------: |
|        .80        |     782      |      194      |      85      |
|        .90        |     1046     |      258      |     112      |
|        .95        |     1293     |      319      |     138      |

Expressed in terms of Cohen's *d* and explained variance, these figures would roughly translate into a *d* of .20, .40, and .60 and an explained variance (but not necessarily a partial &eta;<sup>2</sup>) of .01, .04, and .09.

## References

- Bosco, F. A., Aguinis, H., Singh, K., Field, J. G., & Pierce, C. A. (2015). Correlational effect size benchmarks. *Journal of Applied Psychology, 100*(2), 431–449. https://doi.org/10.1037/a0038047
- Brydges, C. R. (2019). Effect size guidelines, sample size calculations, and statistical power in gerontology. *Innovation in Aging, 3*(4), 1–8. https://doi.org/10.1093/geroni/igz036
- Cohen, J. (1988). *Statistical power analysis for the behavioral sciences* (2nd ed.). Hillside, NJ: Lawrence Erlbaum Associates.<br>
- Enkavi, A. Z., Eisenberg, I. W., Bissett, P. G., Mazza, G. L., MacKinnon, D. P., Marsch, L. A., & Poldrack, R. A. (2019, Mar 19). Large-scale analysis of test-retest reliabilities of self-regulation measures. *Proceedings of the National Academy of Sciences of the United States of America, 116*(12), 5472-5477. https://doi.org/10.1073/pnas.1818430116
- Feng, C., Thompson, W. K. & Paulus, M. P. (2022). Effect sizes of associations between neuroimaging measures and affective symptoms: A meta-analysis. *Depression and Anxiety, 39*, 19–25. https://doi.org/10.1002/da.23215
- Fraley, R. C. & Vazire, S. (2014). The N-pact factor: Evaluating the quality of empirical journals with respect to sample size and statistical power. *PLoS ONE, 9*(10), e109019. https://doi.org/10.1371/journal.pone.0109019
- Funder, D. C., & Ozer, D. J. (2019). Evaluating effect size in psychological research: Sense and nonsense. *Advances in Methods and Practices in Psychological Science, 2*(2), 156–168. https://doi.org/10.1177/2515245919847202
- Gignac, G. E., & Szodorai, E. T. (2016). Effect size guidelines for individual differences researchers. *Personality and Individual Differences, 102*, 74–78. https://doi.org/10.1016/j.paid.2016.06.069
- Hemphill, J. F. (2003). Interpreting the magnitudes of correlation coefficients. *American Psychologist, 58*(1), 78–79. https://doi.org/10.1037/0003-066X.58.1.78
- Lovakov, A. & Agadullina, E. R. (2021). Empirically derived guidelines for effect size interpretation in social psychology. *European Journal of Social Psychology, 51*, 485–504. https://doi.org/10.1002/ejsp.2752
- Schäfer, T. & Schwarz, M. A. (2019). The meaningfulness of effect sizes in psychological research: Differences between sub-disciplines and the impact of potential biases. *Frontiers in Psychology, 10*, 813. https://doi.org/10.3389/fpsyg.2019.00813
- Szucz, D. & Ioannidis, J. P. A. (2017). Sample size evolution in neuroimaging research: An evaluation of highly-cited studies (1990–2012) and of latest practices (2017–2018) in high-impact journals. *NeuroImage, 221*, 117164. https://doi.org/10.1016/j.neuroimage.2020.117164
