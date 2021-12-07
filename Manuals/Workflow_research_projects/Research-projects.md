# How to organize a research project

## Preamble

We, the AG.DPP team at the Faculty of Psychology at the TU Dresden are strongly committed to open, transparent and reproducible research. Therefore, each step in every research project is expected to be open, transparent and reproducible - for researchers worldwide, other members of AG.DPP and (most notably) your future self. Consider yourself working all night and eventually find the solution at 2 am. Your documentation of your work (we shall refer to every piece of work as code henceforth) should ideally inform your future self (at, say, 2 pm the same day) what you were doing, what you came up with and why and what for. So, the *Primary Directive* at AG.DPP is

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
5.  [Create a GitHub project](#GitHub-project)
6.  [Develop an - ideally fully scripted - analysis plan](#Analysis-plan)
7.  [Write the methods part of your manuscript](#Methods-part)
8.  [Apply for ethical approval](#Ethical-approval)
9.  [Preregister your hypotheses and analysis plan](#Preregistration)
10. [Collect data](#Data-collection)
11. [Preprocess and merge data](#Preprocessing)
12. [Run your analysis scripts](#Data-analysis)
13. [Write the results and discussion part of your manuscript](#Results-and-discussion)
14. [Openly provide all data, analysis scripts and ideally material](#Open-data-and-code)
15. [Submit your manuscript along with a preprint](#Manuscript-submission)
16. [Revise your manuscript](#Manuscript-revision)
17. [Archive your project](#Project-archiving)

This list roughly reflects the steps that are to be taken throughout a research project, although not necessarily in exactly that order. In the following, decisions to be made, things to do and issues to consider at each step are outlined and - where necessary - elaborated on. Just click on any of the elements of the list to go directly to the respective section.

## Workflow of a research project

### Research Question

#### Starting point

You may have some research interest and perhaps already some research idea, but it is essential that before you really start engaging in planning and conducting a study you have to have a specific research question that ideally allows you to derive hypotheses. *How does Need for Cognition (NFC) develop?* is a research interest, and *life events may shape NFC* is a research idea. So you could go on, use some life event questionnaire together with the NFC scale in a convenience sample and correlate the resulting scores with each other. You may find that NFC is positively correlated with the number of positive life events reported, but not with the number of negative life events. Does this result confirm your notion that life events shape NFC? Or couldn't it be that NFC shapes the experience or the recall of specific life events? Your research design does not allow to decide for or against any of these alternative explanations.

Therefore, it pays to ponder your research idea over and over, to carefully read the literature on the relationship of life events and NFC, perhaps even to write a short review that you can submit as a stand-alone paper or that can be of use for the theoretical part of your manuscript. Also present your idea to colleagues - be it in your lab or at other occasions such as conferences - and discuss your thoughts on the matter! This will also help to identify potential collaborators and/or co-authors. 

#### Research Transparency Advisor

During this process, you should also find someone who will act as what we provisionally call here *Research Transparency Advisor (RTA)*: Someone who is double-checking your routines and your code. It is strongly recommended that you have a RTA for every project you run! It not only reassures you that you are still on the right path, it also supports the transparency and reproducibility of your research.

#### Authorship

The RTA will put considerable effort in your paper, so co-authorship of the RTA is justified by all means. But what essentially does define authorship? A discussion of this issue can be found in our [Wiki entry on authorship](https://github.com/alex-strobel/DPP-LabManual/wiki/Authorship). In short:

Authorship requires that someone has contributed *substantially* to

- the development and conception of the research project or
- the development, collection, acquisition, provision of the data, software, sources or
- the analysis/evaluation or interpretation of the data, sources and the conclusions drawn therefrom, or
- in the development of scientific results, or
- in the writing of the manuscript

and gave final approval to the submission of a manuscript and bears joint responsibility for the work. In addition,

- all who have substantially contributed along the lines above must be considered in the decision who will be credited as author or who will be acknowledged for their contribution
- there are no honorary authorships
- obstruction of the publication of scientific results (be it intentionally or just out of laziness such as when not responding to the main author's mail that asks for final approval of the manuscript) is against the rules of good scientific practice

Already early in any research project conducted at AG.DPP, all who are or get to be involved should be asked if they want to be authors of an eventually resulting publication. And if they do, they should do their best to make their contribution substantial.

[[up](#Organization-of-this-manual)]

### Theoretical part

Take care of clarity and conciseness and get comments of your co-authors! ...

[[up](#Organization-of-this-manual)]

### Study design

Parallel to writing down the rationale of your study, develop a study plan and a protocol. Try to anticipate as many details as possible! Specifically, follow the points below:

[[up](#Organization-of-this-manual)]

#### Consider only variables that are really necessary and assess them in a detail that is justified!

Regarding what variables are really neccesary ...

- those relevant to characterize your sample (age, gender, education will in most cases do) to enable an estimation of the level of generalizability
- those relevant to answer your research question
- potential confounders (read this [interresting blog post on confounders](https://towardsdatascience.com/get-a-grip-when-to-add-covariates-in-a-linear-regression-f6a5a47930e5))

Regarding the detail of assessment ...

- for gender, male, female, diverse will do
- for education, most often two (Abi or not) or three levels (Hauptschule, Realschule, Abi) will do
- job will be mostly irrelevant for us

When planning a study with a large sample you may be tempted to assess as many variables you can in order to exploit the data set for a number of publications. What sounds like a good idea, may haunt you later on because

- you will need to report all measures in the study in every article based on the study (because in line with the [OSIP Research Transparency Statement](https://tu-dresden.de/mn/psychologie/die-fakultaet/open-science/osip-research-transparency-statement), we always use the 21-word solution ([Simmons et al., 2012](http://dx.doi.org/10.2139/ssrn.2160588)), which may be tiresome
- reviewers will ask why you only used a certain portion of the data for a given paper or may even suspect piecemeal publication
- having so many variables at hand may also be confusing and may tempt you run exploratory analyses or use covariates that were not planned to be included in the analysis

It is therefore most of the time wise to reduce the number of potential outcome variables and *a priori* covariates to a minimum **or** to write a Data/Project paper ahead of beginning data collection where you describe the larger project, the data collected and the intended use for different research questions and, thus, different research papers. 

[[up](#Organization-of-this-manual)]

#### Prefer open materials!

To foster replicability of our studies, we try to provide open materials, e.g. questionnaires, stimuli etc. This is much easier if we use open materials. For questionnaires and tests, a useful resource for open material is:

- [ZIS](https://zis.gesis.org)

Commercially available materials must not be used for teaching and research unless one has acquired a license to do so, i.e., has bought enough test books/answering sheets for the number of participants in a given study. If you want to use, say, the [*NEO Five Factor Inventory (NEO-FFI)*](https://www.testzentrale.de/shop/neo-fuenf-faktoren-inventar-nach-costa-und-mc-crae.html) in a study where you aim at *N* = 500 participants: Even if you have bought the test from Hogrefe for about 200 €, you cannot simply make 500 copies of the questionnaire. You need to buy the respective number of copies of the questionnaire as well, amounting (as of end 2021) to about 1000 €. For third-party funded research, you should therefore always apply for funding of the respective number of copies of a commercially availabe questionnaire or test. Or, as said, go for free material. 

You might say "Well, I do not use commercially available questionnaires, all questionnaires I use have been provided openly in scientific publications." I wish you would be right, but in most cases you won't. Read here about the respective regulations for Germany (**strongly reccomended reading**):

- [Tests in Lehre und Forschung](https://www.bdp-verband.de/binaries/content/assets/beruf/testrezensionen/dtk_tests_in_lehre_und_forschung.pdf)

So if you want to use some questionnaire that has been published in a journal, the copyright still lies either with the authors or the publisher (or both). In this case, contact both the author(s) and the publisher to ask for permission to use this questionnaire. Ideally, you ask for a broad permission to use the questionnaire in your research and teaching, hopefully, it is granted.

To avoid buying material or asking for permission, open materials can be an option, given, there are some that are appropriate for your research question (see above at ZIS).

[[up](#Organization-of-this-manual)]

#### Estimate required sample size!

If the literature tells you what effect size to expect, this effect size is most likely inflated due to publication bias. Evidence from replication research (e.g., [Open Science Collaboration, 2015](https://doi.org/10.1126/science.aac4716)) suggests that even replicable effects are about half of the size as those originally reported. It may thus be wise to divide the effect size your found in the literature. This may be too conservative if you ground your power calculation on meta-analytically derived effect sizes and use that estimate for your power analysis. Yet, also meta-analyses suffer from publication bias and may overestimate effect sizes. Thus, it is perhaps a good idea to use the lower bound of the confidence interval of the effect size in question as estimate for your power analysis. Calculate the required sample size with a desired power of at least 80% and a significance level that accounts for possible multiple testing.

If you have no idea what effect size to expect, Cohen‘s classification most likely will not reflect the typical effect sizes in your area of research. If there are no established guidelines (such as those of [Gignac & Szodorai, 2016](http://dx.doi.org/10.1016/j.paid.2016.06.069), for individual differences research), assume a correlation of r = .20 (or any derivative such as an explained variance of .04, see [Fraley & Vazire, 2014](https://doi.org/10.1371/journal.pone.0109019)). A small to medium effect is more likely than a large one.

The software used for power analysis makes no difference. Yet, [G\*Power](https://www.psychologie.hhu.de/arbeitsgruppen/allgemeine-psychologie-und-arbeitspsychologie/gpower) is more powerful than other software such as jamovi or the [R package `pwr`](https://github.com/alex-strobel/DPP-LabManual/wiki/R-package-pwr) under R. If there is no power analysis software for your specific effect size, run simulations.

For details on power analysis, see the following presentation:

- [Power Analyses](https://github.com/alex-strobel/DPP-LabManual/blob/main/Manual/Presentations/DPP_LM_PowerAnalyses.pdf)

[[up](#Organization-of-this-manual)]

#### Run a pilot study!

A pilot study does not only help in estimating the effect size you can expect, it also helps to streamline the study protocol, detect unforeseen obstacles, develop an analysis plan using real data etc. Yet, to really get a glimpse what you might expect from the final data set, you should have enough pilot data. Collect as many participants as feasible, as a rule of thumb: at least 16 for experiments, at least 64 for questionnaire studies!

[[up](#Organization-of-this-manual)]

#### Consider to use Bayesian sequential testing and Bayesian statistics!

Bayesian sequential testing allows you to collect your data most effectively. Basically, one regularly checks the incoming data using Bayesian statistics and stops data collection if some prespecified Bayes Factor is achieved. For details, see [Schönbrodt et al. (2018)](https://osf.io/w3s3s/).

Bayesian statistics are usually more adequate to address a research question than standard (so-called frequentist) statistics because 

- just like the frequentist approach, they allow for quantifying the evidence for the H1 
- unlike the frequentist approach, they allow for quantifying the evidence for the H0

Bayes Factors (BF10) are used for this purpose. A BF10 of less than 1 indicates evidence in favor of the null hypothesis, and values greater than 1 indicate evidence in favor of the alternative hypothesis. As an example, a BF10 of 5 would indicate that the data are five times more probable if the alternative hypothesis was true than if the null model was true.

According to, e.g., [Wetzels et al. (2011)](http://dx.doi.org/10.1177/1745691611406923), given a certain BF10, one would conclude …

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

[[up](#Organization-of-this-manual)]

### REDCap project

...

- Create new project in development mode and ask for approval
- Use templates either in REDCap data base or custom questionnaire collection
- Review project setup and test functionality 
- Check all possible combinations of data
- Test data export and data labelling
- Switch to production mode!

[[up](#Organization-of-this-manual)]

### GitHub project

...

- https://github.com/alex-strobel/DPP-LabManual/wiki/GitHub
- https://github.com/alex-strobel/DPP-LabManual/blob/main/Routines/GitHub-and-renv-long.md

[[up](#Organization-of-this-manual)]

### Analysis plan

Develop an analysis plan! Prefer open analysis software (e.g. R, JASP)!

R is certainly the most frequently used open software environment for (not only) statistical computing and graphics. It comes with several pre-installed packages for basic statistical routines and plotting, but one can also install dedicated packages for more advanced statistics (e.g., psych, lavaan, lme4) and graphics (e.g., ggplot2). The downside is that it has no GUI. Yet, working with R is considerably facilitated if you run it with RStudio. Just install [R](https://www.r-project.org) and [RStudio](https://www.rstudio.com) and read the [R-Intro](https://cran.r-project.org/manuals.html).

JASP is an open-source project developed by Eric-Jan Wagenmakers and his team. It is supported by the University of Amsterdam and the Center for Open Science. It has a user-friendly interface and offers standard analysis routines for both frequentist and Bayesian statistics. Yet, for a number of more advanced statistics such as structural equation modeling or mixed models, you have to rely on integrated modules which often are R-based, so one will still have to learn R. Just install [JASP](https://jasp-stats.org) and make sure to regularly check for updates.

Your analysis plan should ideally be fully scripted. When programming in R, adhere to the [tidyverse style guide](https://github.com/alex-strobel/DPP-LabManual/wiki/R-programming-style-guide)!

[[up](#Organization-of-this-manual)]

### Methods part

...

[[up](#Organization-of-this-manual)]

### Ethical approval

...

[[up](#Organization-of-this-manual)]

### Preregistration

In line with the [OSIP Research Transparency Statement](https://tu-dresden.de/mn/psychologie/die-fakultaet/open-science/osip-research-transparency-statement), whenever possible and sensible, we preregister our main hypotheses on a reliable platform (e.g., the [Open Science Framework (OSF)](https://osf.io/prereg) or [asPredicted](https://aspredicted.org)). A very useful resource for learning about why and how to do preregistration is provided by the [SLUB](https://www.slub-dresden.de/):

- [Preregistration of scientifc studies](https://bildungsportal.sachsen.de/opal/auth/RepositoryEntry/31574065165/CourseNode/1628044732527501003)

It's an [OPAL](https://bildungsportal.sachsen.de/opal/shiblogin) course for which you need a login from a university in Saxony (for our team the [ZIH](https://tu-dresden.de/zih) login). There seems to be an option for a guest account, I haven't tried yet because of no need to have one ... 

**At AG.DPP, we usually prefer preregistration via OSF over asPredicted.**

[[up](#Organization-of-this-manual)]

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
