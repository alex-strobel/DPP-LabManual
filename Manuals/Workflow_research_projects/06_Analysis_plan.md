# Analysis plan

## Develop an analysis plan! 

Take your time and choose the most appropriate and *state of the art* analysis routines to answer your research questions or test your hypotheses. Also try to foresee all obstacles that may arise during data analysis such as deviations from uni-/multivariate normality or the need to correct for multiple testing and decide on how to proceed in such a case (ideally by discussing with your colleagues, at least with your [Research Transparency Advisor](01_Research_question.md/#Research-transparency-advisor)). You may also consider to run a specification curve analysis (aka forking path or multiverse analysis)<!--add Wiki entry --> where you define a main analysis path, but for for all analysis steps decide (ideally together with your collaborators) on all reasonable alternative options how to proceed and then run all these reasonable analysis paths to check whether your main analysis path leads to similar conclusions as the majority of reasonable alternative analysis paths.

Your analysis plan should ideally be fully scripted and the analysis script(s) should be provided with your [preregistration](09_Preregistration.md). You could use data from a pilot study for that purpose. If you do not have pilot data, you might want to simulate variables to develop your analysis routines. In R, you can do this quite easily for a number of assumed distributions of your data, and for correlation analysis, you may want to resort to the R script [`randcorr.R`](https://github.com/alex-strobel/DPP-LabManual/blob/main/Functions/randcorr.R). 

In the end, it will really pay to have considered how to exactly test your hypotheses (and they should have been formulated with the statistical tests in mind right from the start, see [Formulation of hypotheses](01_Research_question.md/#Formulation-of-hypotheses)). In an ideal world, you should have written your manuscript using [R Markdown](https://github.com/alex-strobel/DPP-LabManual/wiki/R-Markdown) so that when the data are collected and preprocessed, you simply have to click the `knit` button in RStudio to have the Results part ready for getting published.   

## Prefer open analysis software (e.g. R, JASP)!

R is certainly the most frequently used open software environment for (not only) statistical computing and graphics. It comes with several pre-installed packages for basic statistical routines and plotting, but one can also install dedicated packages for more advanced statistics (e.g., psych, lavaan, lme4) and graphics (e.g., ggplot2). The downside is that it has no GUI. Yet, working with R is considerably facilitated if you run it with RStudio. Just install [R](https://www.r-project.org) and [RStudio](https://www.rstudio.com) and read the [R-Intro](https://cran.r-project.org/manuals.html).

JASP is an open-source project developed by Eric-Jan Wagenmakers and his team. It is supported by the University of Amsterdam and the Center for Open Science. It has a user-friendly interface and offers standard analysis routines for both frequentist and Bayesian statistics. Yet, for a number of more advanced statistics such as structural equation modeling or mixed models, you have to rely on integrated modules which often are R-based, so one will still have to learn R. Just install [JASP](https://jasp-stats.org) and make sure to regularly check for updates.

Your analysis plan should ideally be fully scripted. When programming in R, adhere to the [tidyverse style guide](https://github.com/alex-strobel/DPP-LabManual/wiki/R-programming-style-guide)!

## Consider to use Bayesian statistics!

Bayesian statistics are usually more adequate to address a research question than standard (so-called frequentist) statistics because 

- just like the frequentist approach, they allow for quantifying the evidence for the H1 
- unlike the frequentist approach, they allow for quantifying the evidence for the H0

Bayes Factors (BF10) are used for this purpose. A BF10 of less than 1 indicates evidence in favor of the null hypothesis, and values greater than 1 indicate evidence in favor of the alternative hypothesis. As an example, a BF10 of 5 would indicate that the data are five times more probable if the alternative hypothesis was true than if the null model was true.

According to, e.g., [Wetzels et al. (2015)](https://doi.org/10.1002/9781118625392.wbecp453), given a certain BF10, one would conclude …

- BF10 > 100   = extreme evidence for H1
- BF10 > 30    = very strong evidence for H1
- BF10 > 10    = strong evidence for H1
- BF10 > 3 	   = moderate evidence for H1
- BF10 > 1	   = anecdotal evidence for H1 if BF10 < 3 
- BF10 = 1	   = no evidence
- BF10 < 1	   = anecdotal evidence for H0 if BF10 > 1/3
- BF10 < 1/3	 = moderate evidence for H0
- BF10 < 1/10  = strong evidence for H0
- BF10 < 1/30  = very strong evidence for H0
- BF10 < 1/100 = very strong evidence for H0

Sometimes, you might see also a BF01. This is simply 1/BF10, and the above thresholds would reverse, i.e., a BF01 > 10 would be strong evidence for the H0. 
Importantly, you should not take these thresholds as strict rules, they are simply conventions such as *p* < .05. Using Bayesian statistics, we should not make the same mistakes as are often made when employing the frequentist approach. A BF10 = 3.1 is no better BF10 than a BF10 = 2.9 (and never ever state that BF10 = 2.9 is *marginally* moderate evidence for the alternative hypothesis).   

Bayesian analyses can be performed with, e.g., [JASP](https://jasp-stats.org) and the [R package `BayesFactor`](https://github.com/alex-strobel/DPP-LabManual/wiki/R-package-BayesFactor).

[[back](00_How_to_organize_a_research_project.md#organization-of-this-manual)]

