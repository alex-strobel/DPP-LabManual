# Methods Part

## Table of Contents

- [Methods Part](#methods-part)
  - [Table of Contents](#table-of-contents)
  - [Participants](#participants)
  - [Materials](#materials)
    - [Questionnaires and tests](#questionnaires-and-tests)
    - [Experimental paradigms](#experimental-paradigms)
  - [Procedure](#procedure)
  - [Statistical Analysis](#statistical-analysis)
  - [Software Citation](#software-citation)
    - [Citing R, RStudio and R packages](#citing-r-rstudio-and-r-packages)
    - [Citing other software](#citing-other-software)

---

> **Summary.** We use the 21-word solution! Therefore, we need to report how we determined our sample size (ideally, but not necessarily via a power calculation). We also need to report possible data exlusions and therefore need to make sure that they are not done arbitrarily. Furthermore, we need to report al measures in the study such as variables reflecting questionnaire or tests results or indices of performance in experimental paradigms. All measures assessed should be listed even if they are not use of interest in a given manuscript (but assessed for another purpose). The measures of interest should be described in sufficient detail in the Methods section, and the same holds for the study procedure, so that other researchers in principle should be able to replicate our study. Giving as much detail as possible is especially important for our statistical analyses, but if we provide open data and code (what we should always do!), we may skip some of the more specific details, otherwise the Statistical Analyses subsection may become too long. Ah, and we cite all the software we use appropriately!

---

We at AG.DPP always start our Methods part with the [21-word solution](https://github.com/alex-strobel/DPP-LabManual/wiki/21-word-solution), and we make sure that it is correct.

## Participants

The first subsection is the *Participants* section. We ideally start it with our power analysis that informed us about our sample size. 

> We assumed an effect size of *r* = .30. With a power of 1-&beta; = .95, the required sample size was *N* = 138 as determined using the R package *pwr* (Champely, 2020). We oversampled by 10% to account for dropouts, technical errors and outliers and therefore recruitied *N* = 150 participants. Of these, two had to be excluded due to technical reasons (EEG recording failed) and three further participants had to be excluded due to untrustworthy answers (e.g., age = 99 or gender = "Boba Fett"), leaving 145 participants (X percent female) with a mean age of ... years (range Y to Z years).

Or we may have had a convenience sample that for economic reasons was as large as it could be given a limited time to perform your study.  

> Due to time constraints, we recruited as many participants as possible between Oct 2022 and Feb 2023. A total of *N* = 119 participants (67 percent female) took part in our study. With this sample size, we were able to detect a correlation of *r* = .32 with a power of 1-&beta; = .95.  

In any case, we describe your rationale for determining sample size. Ideally, this rationale should be based on power considerations, but sometimes, you will not be able to meet the sample size you ideally should have. Then, be open about it:

> For the within-subjects analyses, a power calculation using G\*Power (Faul et al., 2009) indicated a sample size of *N* = 36 when assuming a medium effect size of *f* = .25, a power of 1-&beta; = .95 and an &alpha;-level of .05. Yet, for the between-subjects analyses, G\*Power indicated a required sample size of *N* = 136 to achive a power 1-&beta; = .95 to detect a medium effect size at the nominal &alpha;-level. Given limited resources to perform our study, we therefore set 1-&beta; to .80 and recruited a sample of *N* = 82, still enabling us to detect a medium effect size with adequate power.

Also, as was already mentioned, consider that there may be data exclusions: for technical reasons or because of missings and outliers. So it is always a good idea 1) to determine criteria for possible data exclusions and 2) to oversample by at least 10%.

## Materials

In this section, all material used in the study is described, e.g., questionnaires, experimental paragdigms or stimuli used.
Ideally, this is done in a detail that enables other researchers to directly replicate our study.
If this is not possible (e.g., because of the word limit of your manuscript), we refer to supplementary methods in the Supplementary Material.
Often enough, we will use material that we already described in an earlier manuscript, and more likely than not it took us some time to arrive the perfect description of our material back then.
While it is generally accepted that authors should omit self-plagiarism, an optimal description of a material or a procedure---at least in our opinion---can and indeed *should* be reused, but a reference should still be given.
So, we may save your standard material descriptions (as Word or text or R Markdown file) and simply copy and paste it in your main manuscript.

### Questionnaires and tests

A good description of a questionnaire or test should contain the following:

- the name and abbreviation of the instrument
- a reference to version used (mostly a German translation of some English instrument that if possible should also be referenced)
- one or two example items (for tests, use the example items given in the test's instructions or describe the task format) 
- the answering format (e.g., a five point scale ranging from -2 = completely disagree to 2 = completely agree)
- how the total scoer is computed (e.g., as sum or as mean)
- information on the instrument's reliability, ideally not only its internal consistency, but also its retest-reliability
- if the word limit allows, a few statements on the validity of the instrument in the present context 

An example for a questionnaire would be:

> *Need for Cognition* (NFC) was assessed with the 16-item short version of the German NFC scale (Bless et al., 1994). Responses to each item (e.g., "Thinking is not my idea of fun", recoded) were recorded on a 7-point Likert scale ranging from -3 (completely disagree) to +3 (completely agree) and were summed to the total NFC score. The scale shows comparably high internal consistency (Cronbach’s &alpha; > .80; Bless et al., 1994, Fleischhauer et al., 2010) and a retest reliability of *r*<sub>tt</sub> = .83 across 8 to 18 weeks (Fleischhauer et al., 2015). It has been shown to positively correlate with academic performance (r &ge; .20; von Stumm & Ackerman, 2015). 

An example for a test would be:

> Two versions of the *Trail-Making Test* (TMT; see, e.g., Lezak et al., 2004) were used to examine mental speed (versions A and B) and task shifting ability (version B only). In version A, the participant is asked to connect 25 numbers scattered across a sheet of paper in ascending order using a pencil. In version B the task is to connect numbers and letters in alternating order (i.e., 1-A-2-B …). The outcome measure is the time for completion of each version in seconds, stopped by the experimenter using a smartphone and rounded downwards. Retest-reliability of the TMT is acceptable to good (part A, *r*<sub>tt</sub> = .75, part B, *r*<sub>tt</sub> = .85; Giovagnoli et al., 1996). The time to complete the TMT positively correlates with age and negatively with fluid intelligence [add ref.].  

### Experimental paradigms

Here, we describe the experimental procedure as detailed as possible inluding

- <!-- someone pls write this part -->

Ideally, we provide the code of our experimental paradigm along with our manuscript. Even if we use proprietary software such as Presentation, the code is plain text, so the important detail is readable to everyone.

## Procedure

...

## Statistical Analysis

We describe our analysis steps in the order they were performed (and that order should also match the order in which the results are reported in the Results section). We describe them in a detail that in principle should enable other researchers to reproduce them. This will not always be fully possible, which makes the provision of our data and code all the more necessary. Some minor detail may also be out-sourced to a Supplementary Methods section.

...
## Software Citation

We always cite the software we use for data acquisition and analysis for at least two reasons:

- **Reproducibility.** When others want to reproduce our analyses, they need to know which software and software version we used for data analysis. If using R, this includes also the R packages you employed including their version. This may not always ensure reproducibility (but see [R package `renv`](https://github.com/alex-strobel/DPP-LabManual/wiki/R-package-renv)), but at least gives a hint on why someone failed to reproduce our results.
- **Giving credit.** Software developers invest a lot of time in the development and maintenance of their software. Especially when using open software such as [R and RStudio](https://github.com/alex-strobel/DPP-LabManual/wiki/R-and-RStudio) or certain [R packages](https://github.com/alex-strobel/DPP-LabManual/wiki/Recommended-R-packages), it is just matter of respect for the authors an R package to cite them.

### Citing R, RStudio and R packages

To get the appropriate citation for R and RStudio, we type on the command line:

```
# R
citation()
# RStudio
rstudioapi::versionInfo()$citation
```

The nice thing here is that this will also return the respective BibTeX entry for use in our [R Markdown](https://github.com/alex-strobel/DPP-LabManual/wiki/R-Markdown) or [LaTeX](https://github.com/alex-strobel/DPP-LabManual/wiki/LaTeX) documents. Yet, this does not give us the respective version numbers. We can retrieve them via:

```
# R
R.Version()
# RStudio
RStudio.Version()
```

For a given R package, say, `lavaan`, we type:

```
citation("lavaan")
packageVersion("lavaan")
```

Yet, if we use a large number of R packages, citing them all might blow our Methods section and perhaps our word limit. In this case, we can first try to limit the packages we use and/or report only the really essential ones in the text and list the remaining packages (that we may have used only for one special procedure) in the supplement. For most if not all research reports, we will have a supplement anyway. As an example, here's a sentence from a manuscript I wrote in 2019:
  
"We used *RStudio* (version 1.1.463; RStudio Team, 2016) with *R* (version 3.5.2; R Core Team, 2018) for statistical analyses, with the main analyses carried out using the packages *psych* (version 1.8.12; Revelle, 2018) and *lavaan* (version 0.6.5; Rosseel, 2012), see Supplementary Methods for all packages employed." 

The respective references would look like this:

- R Core Team. (2018). *R: A language and environment for statistical computing.* Vienna, Austria: R Foundation for Statistical Computing. Retrieved from https://www.R-project.org/
- Revelle, W. (2018). *Psych: Procedures for psychological, psychometric, and personality research.* Evanston, Illinois: Northwestern University. Retrieved from https://CRAN.R-project.org/package=psych
- Rosseel, Y. (2012). lavaan: An R package for structural equation modeling. *Journal of Statistical Software, 48*(2), 1–36. Retrieved from http://www.jstatsoft.org/v48/i02/
- RStudio Team. (2016). *RStudio: Integrated development environment for R.* Boston, MA: RStudio, Inc. Retrieved from http://www.rstudio.com/

### Citing other software

For other, especially commercial software bundles, you cite the software including its version as well as the company including its location. Here a few examples of commercial software commonly used in our lab, incl. their citations as suggested by the developers:

<!-- 
pls someone add examples of how to provide this information in the text and how the reference would look like 
--> 

- BrainVision Analyzer
> In text: BrainVision Analyzer, Version 2.2.0, Brain Products GmbH, Gilching, Germany
> In the reference section: BrainVision Analyzer (Version 2.2.0) [Software]. (2019). Gilching, Germany: Brain Products GmbH.
- BrainVision Recorder
> In text: BrainVision Recorder, Version 1.23.0001, Brain Products GmbH, Gilching, Germany
> In the reference section: BrainVision Recorder (Version 1.23.0001) [Software]. (2020). Gilching, Germany: Brain Products GmbH.
- jamovi
> In the reference section: The jamovi project (2021). jamovi (Version 1.6) [Computer Software]. Retrieved from https://www.jamovi.org.
- JASP
> In the reference section: JASP Team (2021). JASP (Version 0.16) [Computer software].
- MATLAB
> In the reference section: MATLAB. (2018). 9.7.0.1190202 (R2019b). Natick, Massachusetts: The MathWorks Inc.
- SPSS
> In the reference section: IBM Corp. Released 2020. IBM SPSS Statistics for Windows, Version 27.0. Armonk, NY: IBM Corp.

Not to forget MATLAB plugins such as:

- EEGLAB
> Delorme, A. & Makeig, S. EEGLAB: An open source toolbox for analysis of single-trial EEG dynamics including independent component analysis. J. Neurosci. Methods 134, 9–21 (2004).
- SPM

---

[**Table of Contents**](#README.md) | [back to **Analysis Plan**](06_Analysis_plan.md) | [next to **Ethical Approval**](08_Ethical_approval.md)
