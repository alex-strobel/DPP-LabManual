# How to organize a research project

## Preamble

We, the AG.DPP team at the Faculty of psychology at the TU Dresden are strongly committed to open, transparent and reproducible research. Therefore, each step in every research project is expected to be open, transparent and reproducible - for researchers worldwide, other members of AG.DPP and (most notably) your future self. Consider yourself working all night and eventually find the solution at 2 am. Your documentation of your work (we shall refer to every piece of work as code henceforth) should ideally inform your future self (at, say, 2 pm the same day) what you were doing, what you came up with and why and what for. So, the *Primary Directive* at AG.DPP is

**Always comment your code!**

Don't intend to eventually comment your code sometime in the future! Don't expect your code to be comprehensible anyway! Comment what you are about to do even ahead of doing it! Make your work as accessible as it could possibly be and assume that everyone in this world is a moron! Someone who won't understand that you are about to provide a boxplot when you do not comment - ahead of the boxplot command - that you are exactly about to provide a boxplot. It's as simple as that: Always comment your code, because everyone in the world including your future self is a moron!

Also, being committed to open, transparent and reproducible research means that all pieces of your work should be open in the sense that it is accessible even if one is using another machine, operating system and software. You cannot assume that if you are using a PC with Windows 10 and run your analyses with the latest versions of SPSS and MPlus, that someone in, say, Aachen, Boston, or Colombo can reproduce your results, even when they run your code on a PC with Windows 10 and the latest versions of SPSS and MPlus.

There may be users with Mac or Linux machines, there may be STATA or LISREL users ... So provide your data and code platform-independent and without having other researchers to install or even buy proprietary software, either (if you are using proprietary software for some reason) by meaningfully commenting your code (see the *Primary Directive*) or by using free software such as [R and RStudio](https://github.com/alex-strobel/DPP-LabManual/wiki/R-and-RStudio) including R packages such as [lavaan](https://github.com/alex-strobel/DPP-LabManual/wiki/R-package-lavaan). In this case, create a reproducible einvironment, e.g., via the [R package `renv`](https://github.com/alex-strobel/DPP-LabManual/blob/main/Routines/GitHub-and-renv-short.md) or create a virtual machine (e.g., via [Docker](https://hub.docker.com/_/r-base)).

For statistics, there are free alternatives to R such as [JASP](https://jasp-stats.org) or [jamovi](https://www.jamovi.org), which (having a GUI) are more accessible, especially to students. Yet, in the end, even these alternatives boil down to R, so you could be using R right from the start!

## Organization of this manual

This manual is organized in a way that it reflects the typical work flow of a research project. After having pondered and discussed your research idea, you have to

1.  [Pinpoint your research question and formulate your hypotheses](#Research-question)
2.  [Write the theoretical part of your manuscript](#Theoretical-part)
3.  [Develop and refine the study design](#Study-design)
4.  [Create a REDCap project](#REDCap-project)
5.  [Develop an - ideally fully scripted - analysis plan](#Analysis-plan)
6.  [Write the methods part of your manuscript](#Methods-part)
7.  [Apply for ethical approval](#Ethical-approval)
8.  [Preregister your hypotheses and analysis plan](#Preregistration)
9.  [Collect data](#Data-collection)
10. [Preprocess and merge data](#Preprocessing)
11. [Run your analysis scripts](#Data-analysis)
12. [Write the results and discussion part of your manuscript](#Results-and-discussion)
13. [Openly provide all data, analysis scripts and ideally material](#Open-data-and-code)
14. [Submit your manuscript along with a preprint](#Manuscript-submission)
15. [Revise your manuscript](#Manuscript-revision)
16. [Archive your project](#Project-archiving)

This list roughly reflects the steps that are to be taken throughout a research project, although not necessarily in exactly that order. In the following, decisions to be made, things to do and issues to consider at each step are outlined and - where necessary - elaborated on. Just click on any of the elements of the list to go directly to the respective section.

## Workflow of a research project

### Research Question

You may have some research interest and perhaps already some research idea, but it is essential that before you really start engaging in planning and conducting a study you have to have a specific research question that ideally allows you to derive hypotheses. *How does Need for Cognition (NFC) develop?* is a research interest, and *life events may shape NFC* is a research idea. So you could go on, use some life event questionnaire together with the NFC scale in a convenience sample and correlate the resulting scores with each other. You may find that NFC is positively correlated with the number of positive life events reported, but not with the number of negative life events. Does this result confirm your notion that life events shape NFC? Or couldn't it be that NFC shapes the experience or the recall of specific life events? Your research design does not allow to decide for or against any of these alternative explanations.

Therefore, it pays to ponder your research idea over and over, to carefully read the literature on the relationship of life events and NFC, perhaps even to write a short review that you can submit as a stand-alone paper or that can be of use for the theoretical part of your manuscript. Also present your idea to colleagues - be it in your lab or at other occasions such as conferences - and discuss your thoughts on the matter! This will also help to identify potential collaborators and/or co-authors. During this process, you should also find someone who will act as what we provisionally call here *Research Transparency Advisor (RTA)*: Someone who is double-checking your routines and your code. It is strongly recommended that you have a RTA for every project you run! It not only reassures you that you are still on the right path, it also supports the transparency and reproducibility of your research.

The RTA will put considerable effort in your paper, so co-authorship of the RTA is justified by all means. But what essentially does define authorship? A discussion of this issue can be found in our [Wiki entry on authorship](https://github.com/alex-strobel/DPP-LabManual/wiki/Authorship), for the present purpose it may be sufficient to state

Authors are persons who ...

1. contribute substantially to conception and design and data collection or analysis and interpretation; and
2. participate in manuscript preparation or revise a manuscript critically and with significant intellectual contribution; and
3. give their final approval of the manuscript version submitted for publication.

These desiderata may be subject to discussion and change, so inform about possible updates at your relevant institution (APA, DFG, DGPs etc.)

To put it simple: *There is no honorary authorship at AG.DPP*! Yet, it is important to keep in mind that all who in principle qualify for authorship - be it students, junior or senior collaborators - should have at least the *opportunity* to contribute according to the points 1. to 3. above. **This means that they are to be informed when a manuscript on a research project they were involved in substantially is about to be written.** If they want to be involved in writing the manuscript and all other collaborators agree, then they are also to be involved if 

- significant changes are made to the study design and/or analysis plan
- further persons are to be involved in the project (e.g. because of methodological expertise or similar)
- content-related and formal aspects of the manuscript preparation are affected (e.g. focus of the manuscript)

[[up](#Organization-of-this-manual)]

### Theoretical part

Take care of clarity and conciseness and get comments of your co-authors! ...

### Study design

Parallel to writing down the rationale of your study, develop a study plan and a protocol. Try to anticipate as many details as possible! Specifically, follow the points below:

**Consider only variables that are really necessary and assess them in a detail that is justified!**

Regarding what variables are really neccesary ...

- those relevant to characterize your sample (age, gender, education) to enable an estimation of the level of generalizability
- those relevant to answer your research question
- potential confounders

Regarding the detail of assessment ...

- for gender, male, female, diverse will do
- for education, most often two (Abi or not) or three levels (Hauptschule, Realschule, Abi) will do
- job is mostly irrelevant, if not: (un)/employed/student

When planning a study with a large sample you may be tempted to assess as many variables you can in order to exploit the data set for a number of publications. What sounds like a good idea, may haunt you later on because

- you will need to report all measures in the study in every article based on the study (because we always use the 21-word solution ([Simmons et al., 2012](http://dx.doi.org/10.2139/ssrn.2160588)), which may be tiresome
- reviewers will ask why you only used a certain portion of the data for a given paper or may even suspect piecemeal publication
- having so many variables at hand may also be confusing and may tempt you run exploratory analyses or use covariates that were not planned to be included in the analysis

It is therefore most of the time wise to reduce the number of potential outcome variables and *a priori* covariates to a minimum **or** to write a Data/Project paper ahead of beginning data collection where you describe the larger project, the data collected and the intended use for different research questions and, thus, different research papers. 

**Prefer open materials (e.g. questionnaires, stimuli) and/or ask for permission!**

...

**Estimate required sample size!^[For details see presentation DPP_LM_PowerAnalyses.pptx]**

If the literature tells you what effect size to expect, this effect size is most likely inflated due to publication bias, so divide it by 2^[This may be too conservative if you ground your power calculation on meta-analytically derived effect sizes and use that estimate for your power analysis. Yet, also meta-analyses suffer from publication bias and may overestimate effect sizes. Thus, it is perhaps a good idea to use the lower bound of the confidence interval as estimate for your power analysis.] and calculate the required sample size with a desired power of at least 80% and a significance level that accounts for possible multiple testing.

If you have no idea what effect size to expect, Cohen‘s classification most likely will not reflect the typical effect sizes in your area of research. If there are no established guidelines (such as those of [Gignac & Szodorai, 2016](http://dx.doi.org/10.1016/j.paid.2016.06.069), for individual differences research), assume a correlation of r = .20 (or any derivative such as an explained variance of .04, see [Fraley & Vazire, 2014](https://doi.org/10.1371/journal.pone.0109019)). A small to medium effect is more likely than a large one.

The software used for power analysis makes no difference. Yet, [G*Power](https://www.psychologie.hhu.de/arbeitsgruppen/allgemeine-psychologie-und-arbeitspsychologie/gpower) is more powerful than other software such as jamovi or the [*pwr* package](https://cran.r-project.org/web/packages/pwr/index.html) under R. If there is no power analysis software for your specific effect size, run simulations.

**Run a pilot study!**

A pilot study does not only help in estimating the effect size you can expect, it also helps to streamline the study protocol, detect unforeseen obstacles, develop an analysis plan using real data etc. Yet, to really get a glimpse what you might expect from the final data set, you should have enough pilot data. Collect as many participants as feasible, as a rule of thumb: at least 16 for experiments, at least 64 for questionnaire studies!

**Consider to use Bayesian sequential testing!**

Bayesian sequential testing allows you to collect your data most effectively. Basically, one regularly checks the incoming data using Bayesian statistics and stops data collection if some prespecified Bayes Factor is achieved. For details, see [Schönbrodt et al. (2018)](https://osf.io/w3s3s/).


### REDCap project

...

### Analysis plan

Develop analysis plan (ideally fully scripted)! Prefer open analysis software (e.g. R, JASP)!

R is certainly the most frequently used open software environment for (not only) statistical computing and graphics. It comes with several pre-installed packages for basic statistical routines and plotting, but one can also install dedicated packages for more advanced statistics (e.g., psych, lavaan, lme4) and graphics (e.g., ggplot2). The downside is that it has no GUI. Yet, working with R is considerably facilitated if you run it with RStudio. Just install [R](https://www.r-project.org)
and [RStudio](https://www.rstudio.com) and read the [R-Intro](https://cran.r-project.org/manuals.html).

JASP is an open-source project developed by Eric-Jan Wagenmakers and his team. It is supported by the University of Amsterdam and the Center for Open Science. It has a user-friendly interface and offers standard analysis routines for both frequentist and Bayesian statistics. Yet, for a number of more advanced statistics such as structural equation modeling or mixed models, you have to rely on integrated modules which often are R-based, so one will still have to learn R. Just install [JASP](https://jasp-stats.org) and make sure to regularly check for updates.


### Methods part

...

### Ethical approval

...

### Preregistration

...

### Data collection

...

### Preprocessing

...

### Data analysis

...

### Results and discussion

...

### Open data and code

...

### Manuscript submission

...

### Manuscript revision

...

### Project archiving {#project-archiving}

...
