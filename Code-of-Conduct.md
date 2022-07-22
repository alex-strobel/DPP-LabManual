# Code of Conduct <!-- Don't know whether we need this ... -->

[Alexander Strobel](mailto:alexander.strobel@tu-dresden.de)

2022-03-18

---

It should not be necessary to have a file like this because all of us will agree upon what will be outlined below.
Yet, what we might think to agree upon may change over time and who comprises the *all of us* may change as well so that having a written *code of conduct* might be useful in the future.

To put it simple:

1. We are a team and as often as possible make collective decisions.
2. We value credible and trustworthy science.
3. We embrace open science principles and act accordingly.
4. We condemn scientific misconduct and abuse of power.
5. We always comment our code.
6. We adhere to common principles when using language, i.e., everything said and written should be as accessible and inclusive as possible. 
7. ...

To elaborate :

## 1. We are a team and as often as possible will make collective decisions.

Still, for certain projects, it will be most efficient if there is one team member that eventually decides on how to proceed. 
This does not necessarily need but eventually often enough will be Alex.
As Alex tends to postpone decisions, keep him reminded of his duty.
Still, all team members can take part in any decision, but should also be prepared to do so.

## 2. We value credible and trustworthy science.

We value interesting, creative, and informative research. We strive to method and data transparency, analytic reproducibility and robustness, and effect replicability. A study can be seen as credible or "not yet proven wrong" if other (independent) researchers are unable to identify flaws in study design, data processing, statistical analyses, and replicability. To achieve that, we conduct careful analyses and thorough as well as detailed record-keeping and writing.  

To learn in more detail how to do credible and trustworthy science, we attend workshops on topics related to good scientific practice and reproducibility. See also the [DFG Guidelines for Safeguarding Good Research Practice](https://www.dfg.de/en/research_funding/principles_dfg_funding/good_scientific_practice/) and the [DGPs Guidelines on Data Management and Data Sharing in Psychological Science](https://www.dgps.de/schwerpunkte/transparente-wissenschaft/umgang-mit-forschungsdaten/).

## 3. We embrace open science principles and act accordingly.

This means that all team members should adhere to the principles stated in the [OSIP Research Transparency Statement](https://tu-dresden.de/mn/psychologie/die-fakultaet/open-science/osip-research-transparency-statement) devised by the Open Science Initiative of the Faculty of Psychology (and ideally should sign it). 
At its core, this means that whenever possible, we 

- preregister our hypotheses
- provide open data, code, and study materials
- request or remind to adhere to open science principles as reviewers or committee members 

As yet, we have not arrived at a common framework for how to do so, e.g., preregister at [AsPredicted](https://github.com/alex-strobel/DPP-LabManual/wiki/AsPredicted) or at [OSF](https://github.com/alex-strobel/DPP-LabManual/wiki/OSF), provide open data, code and materials via OSF, [OpARA](https://github.com/alex-strobel/DPP-LabManual/wiki/OpARA) or [GitHub](https://github.com/alex-strobel/DPP-LabManual/wiki/GitHub), or how to request open data and code when reviewing papers <!-- add template -->. 
Still, everyone of us should try their best to adhere to the principles outlined above and detailed in the OSIP Statement.  

## 4. We condemn scientific misconduct and abuse of power. 

There are some hierachical structures that we adhere to and which relate to the respective authority to issue directives ("Weisungsbefugnis"). For example, the chairholder is responsible for his/her employees (Postdocs, PhD students) and has the authority to give instructions to them. Postdocs/PhD students, in turn, are authorized to give instructions to students and student assistants. However, we strictly abendom scientific misconduct and abuse of power. We value an open discussion culture: nobody shall be afraid to express dissenting opinions. See this article for fruther information: https://zenodo.org/record/5126637#.YjIV7C_36L4

## 5. We always comment our code.

To elaborate on this issue: *We do!*

To elaborate on this issue a bit further: We do not use sloppy comments like `# get data` or `# run analysis`, but write informative comments such as `# get raw reaction time data` or `# run regression analysis to address hypothesis 2b`. 
Of course, we do not comment on details that are obvious to readers of our code like 

```
# set plot window to one row and two columns
par(mfrow = c(1, 2)
```

except that the code we are writing is intended to be used by R novices. 

Another topic where comments are really helpful is the libraries used in a given script. 
You may need to read an SPSS data file of questionnaire responses (via, e.g., the `haven` package) and an Excel file with reaction time data (via, e.g., the `readxl` package), want to perform *post-hoc* power analysis (eg., via the `pwr` package), and then – having determined deviation from multivariate normality via Mardia's test implemented in the `psych` package - want to run a mediation analysis using the package `lavaan`. 
In such a case, we state in the header of our R script:

```
library(haven)   # for reading SPSS files
library(readxl)  # for reading Excel files
library(psych)   # for Mardia's test
library(lavaan)  # for mediation analysis
```

When using a custom function for, e.g., getting the summary of a `lavaan` fit, this function's purpose might be immediately clear to the knowledgeable user, but not to individuals new to a given procedure, so we write:

```
# function for retrieving the summary of a lavaan fit object
# including fit measures and standardized coefficients
sm <- function(fit) {
  return(summary(fit, fit.measures = T, standardized = T)
}
```

## 6. We adhere to common principles when using language.

These common principles include that everything said and written should be as accessible and inclusive as possible.
Accessibility involves that we should always ask ourselves whether others can understand (correctly) what we want to convey. 
When we write about *Git* and refer to some *repo*, we might already have lost some of our audience. 
I even lost a couple of first year students in my lecture when I used the words *aversive* and *appetitive*. 
Yet, to always express everything in detail may be annoying to others (e.g., when we explain what *aversive* and *appetitive* means). 
Therefore, whenever we think that some expression or concept or whatever might not be immediately accessible to others such as new team members, we explain it, and when we think that most of the team will understand it, but some may not, we write a Wiki entry and refer to it in our main text.   

Inclusivity involves that we usually should use a gender-sensitive or gender-neutral language. 
This is easy in English where we speak of a "project leader" or a "participant". 
Yet, we will have to write informed consent forms or applications for ethical approval in German. 
Then, the gender-sensitive way to do so is (in accordance with the TU Dresden Guidelines) <!-- add link --> to use "Projektleiter:innen" and "Versuchsteilnehmer:innen". 
Details on gender-inclusive language (and also picture content) can be found in the TU Dresden's [Guidelines for Gender-inclusive Communication](https://tu-dresden.de/tu-dresden/organisation/ressourcen/dateien/Gleichstellungsbeauftragte/Unsere-Themen/genderinklusive-kommunikation/leitfaden-genderinklusive-kommunikation-2021).
We all should do our best to adhere to these guidelines.
The use of constructions like "Projektleiter:innen" oder "Studienteilnehmer:innen" most of the time makes communication so much easier. 
Yet, there may be situations in which we fear that the usage of the : may annoy some participants (not so much in student samples, but in samples from the general population) and may prompt them to cancel their participation in a, say, online questionnaire, we may consider to use constructions like "Die Projektleitung liegt bei ..." or "Alle, die an der Untersuchung teilnehmen ...".
This does not mean that we should give in to people who oppose to the usage of gender-inclusive language, but we also should try to include them as well by using gender-neutral language where possible. 
After all, we want to have representative samples.
Yet, where it is impossible to use gender-neutral language, we will of course use the : construction instead of using the generic masculinum.

tbc ...
