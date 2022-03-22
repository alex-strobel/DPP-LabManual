# Study design

Parallel to writing down the rationale of your study, develop a study plan and a protocol.
Try to anticipate as many details as possible!
Specifically, follow the points below:

## Consider only variables that are really necessary and assess them in a detail that is justified!

Regarding what variables are really neccesary ...

- those relevant to characterize your sample (age, gender, education will in most cases do) to enable an estimation of the level of generalizability
- those relevant to answer your research question
- potential confounders (read this [interresting blog post on confounders](https://towardsdatascience.com/get-a-grip-when-to-add-covariates-in-a-linear-regression-f6a5a47930e5))

Regarding the detail of assessment ...

- for gender, male, female, diverse will do
- for education, most often two (Abi or not) or three levels (Hauptschule, Realschule, Abi) will do
- job will be mostly irrelevant for us

When planning a study with a large sample you may be tempted to assess as many variables you can in order to exploit the data set for a number of publications.
What sounds like a good idea, may haunt you later on because

- you will need to report all measures in the study in every article based on the study (because in line with the [OSIP Research Transparency Statement](https://tu-dresden.de/mn/psychologie/die-fakultaet/open-science/osip-research-transparency-statement), we always use the 21-word solution ([Simmons et al., 2012](http://dx.doi.org/10.2139/ssrn.2160588)), which may be tiresome
- reviewers will ask why you only used a certain portion of the data for a given paper or may even suspect piecemeal publication
- having so many variables at hand may also be confusing and may tempt you run exploratory analyses or use covariates that were not planned to be included in the analysis

It is therefore most of the time wise to reduce the number of potential outcome variables and *a priori* covariates to a minimum **or** to write a Data/Project paper ahead of beginning data collection where you describe the larger project, the data collected and the intended use for different research questions and, thus, different research papers. 

## Prefer open materials

To foster replicability of our studies, we try to provide open materials, e.g. questionnaires, stimuli etc.
This is much easier if we use open materials. For questionnaires and tests, a useful resource for open material is:

- [ZIS](https://zis.gesis.org)

Commercially available materials must not be used for teaching and research unless one has acquired a license to do so, i.e., has bought enough test books/answering sheets for the number of participants in a given study. If you want to use, say, the [*NEO Five Factor Inventory (NEO-FFI)*](https://www.testzentrale.de/shop/neo-fuenf-faktoren-inventar-nach-costa-und-mc-crae.html) in a study where you aim at *N* = 500 participants: Even if you have bought the test from Hogrefe for about 200 €, you cannot simply make 500 copies of the questionnaire. You need to buy the respective number of copies of the questionnaire as well, amounting (as of end 2021) to about 1000 €. For third-party funded research, you should therefore always apply for funding of the respective number of copies of a commercially availabe questionnaire or test. Or, as said, go for free material. 

You might say "Well, I do not use commercially available questionnaires, all questionnaires I use have been provided openly in scientific publications." I wish you would be right, but in most cases you won't. Read here about the respective regulations for Germany (**strongly reccomended reading**):

- [Tests in Lehre und Forschung](https://www.bdp-verband.de/binaries/content/assets/beruf/testrezensionen/dtk_tests_in_lehre_und_forschung.pdf)

So if you want to use some questionnaire that has been published in a journal, the copyright still lies either with the authors or the publisher (or both). In this case, contact both the author(s) and the publisher to ask for permission to use this questionnaire. Ideally, you ask for a broad permission to use the questionnaire in your research and teaching, hopefully, it is granted.

To avoid buying material or asking for permission, open materials can be an option, given, there are some that are appropriate for your research question (see above at ZIS).

## Estimate required sample size

If the literature tells you what effect size to expect, this effect size is most likely inflated due to publication bias. Evidence from replication research (e.g., [Open Science Collaboration, 2015](https://doi.org/10.1126/science.aac4716)) suggests that even replicable effects are about half of the size as those originally reported. It may thus be wise to divide the effect size you found in the literature by two. This may be too conservative if you ground your power calculation on meta-analytically derived effect sizes and use that estimate for your power analysis. Yet, also [meta-analyses suffer from publication bias](https://github.com/alex-strobel/DPP-LabManual/blob/main/Manuals/Meta-Analysis/Meta_Analysis.md#assessing-publication-bias) and may overestimate effect sizes. Thus, it is perhaps a good idea to use the lower bound of the confidence interval of the effect size in question as estimate for your power analysis. Calculate the required sample size with a desired power of at least 80% and a significance level that accounts for possible [multiple testing](https://github.com/alex-strobel/DPP-LabManual/wiki/Correction-for-multiple-testing).

If you have no idea what effect size to expect, Cohen‘s classification most likely will not reflect the typical effect sizes in your area of research. If there are no established guidelines (such as those of [Gignac & Szodorai, 2016](http://dx.doi.org/10.1016/j.paid.2016.06.069), for individual differences research), assume a correlation of *r* = .20 (or any derivative such as an explained variance of .04, see [Fraley & Vazire, 2014](https://doi.org/10.1371/journal.pone.0109019)). A small to medium effect is more likely than a large one.

The software used for power analysis makes no difference. Yet, [G\*Power](https://www.psychologie.hhu.de/arbeitsgruppen/allgemeine-psychologie-und-arbeitspsychologie/gpower) is more powerful than other software such as jamovi or the [R package `pwr`](https://github.com/alex-strobel/DPP-LabManual/wiki/R-package-pwr) under R. If there is no power analysis software for your specific effect size, run simulations.

For details on power analysis, see the following presentation:

- [Power Analyses](https://github.com/alex-strobel/DPP-LabManual/blob/main/Manuals/Workflow_research_projects/Ressources/PowerAnalyses/DPP_LM_PowerAnalyses.pdf)


#### Run a pilot study

A pilot study does not only help in estimating the effect size you can expect, it also helps to streamline the study protocol, detect unforeseen obstacles, develop an analysis plan using real data etc. Yet, to really get a glimpse what you might expect from the final data set, you should have enough pilot data. Collect as many participants as feasible, as a rule of thumb: at least 16 for experiments, at least 64 for questionnaire studies!

## Consider to use Bayesian sequential testing

Bayesian sequential testing allows you to collect your data most efficiently. Basically, one regularly checks the incoming data using Bayesian statistics and stops data collection if some prespecified Bayes Factor is achieved. For details, see [Schönbrodt et al. (2018)](https://osf.io/w3s3s/).

---

[**Table of Contents**](#README.md) | [back to **Theoretical Part**](02_Theoretical_part.md) | [next to **REDCap Project**](04_REDCap_project.md)
