# How to organize a research project

[Alexander Strobel](mailto:alexander.strobel@tu-dresden.de)<br>
Faculty of Psychology<br>
TU Dresden

Credits go to<br>
All members of AG.DPP (TU Dresden)

2022-01-24

---

## Preamble

We, the AG.DPP team at the Faculty of Psychology at the TU Dresden are strongly committed to open, transparent and reproducible research. Therefore, each step in every research project is expected to be open, transparent and reproducible - for researchers worldwide, other members of AG.DPP and (most notably) our future selves. Consider yourself working all night and eventually find the solution at 2 am. Your documentation of your work (we shall refer to every piece of work as code henceforth) should ideally inform your future self (at, say, 2 pm the same day) what you were doing, what you came up with and why and what for. So, the *Primary Directive* at AG.DPP is

| **We always comment our code!** |
| ------------------------------- |

Don't intend to eventually comment your code sometime in the future! Don't expect your code to be comprehensible anyway! Comment what you are about to do even ahead of doing it! Make your work as accessible as it could possibly be and assume that everyone in this world is a moron! Someone who won't understand that you are about to provide a boxplot when you do not comment - ahead of the boxplot command - that you are exactly about to provide a boxplot. It's as simple as that: Always comment your code, because everyone in the world including your future self is a moron!

Also, being committed to open, transparent and reproducible research means that all pieces of your work should be open in the sense that it is accessible even if one is using another machine, operating system and software. You cannot assume that if you are using a PC with Windows 10 and run your analyses with the latest versions of SPSS and MPlus, that someone in, say, Aachen, Boston, or Colombo can reproduce your results, even when they run your code on a PC with Windows 10 and the latest versions of SPSS and MPlus.

There may be users with Mac or Linux machines, there may be STATA or LISREL users ... So provide your data and code platform-independent and without having other researchers to install or even buy proprietary software, either (if you are using proprietary software for some reason) by meaningfully commenting your code (see the *Primary Directive*) or by using free software such as [R and RStudio](https://github.com/alex-strobel/DPP-LabManual/wiki/R-and-RStudio) including R packages such as [lavaan](https://github.com/alex-strobel/DPP-LabManual/wiki/R-package-lavaan). In this case, create a reproducible einvironment, e.g., via the [R package `renv`](https://github.com/alex-strobel/DPP-LabManual/blob/main/Research/Administration/GitHub/GitHub_and_renv_long.md) or create a virtual machine (e.g., via [Docker](https://hub.docker.com/_/r-base)).

For statistics, there are free alternatives to R such as [JASP](https://jasp-stats.org) or [jamovi](https://www.jamovi.org), which (having a GUI) are more accessible, especially to students. Yet, in the end, even these alternatives boil down to R, so you could be using R right from the start!

## Organization of this manual

This manual is organized in a way that it reflects the typical work flow of a research project. After having pondered and discussed your research idea, you have to

1.  [Pinpoint your research question and formulate your hypotheses](01_Research_question.md)
2.  [Write the theoretical part of your manuscript](02_Theoretical_part.md)
3.  [Develop and refine the study design](03_Study_design.md)
4.  [Create a REDCap project](04_REDCap_project.md)
5.  [Create a GitHub project](05_GitHub_project.md)
6.  [Develop an - ideally fully scripted - analysis plan](06_Analysis_plan.md)
7.  [Write the methods part of your manuscript](07_Methods_part.md)
8.  [Apply for ethical approval](08_Ethical_approval.md)
9.  [Preregister your hypotheses and analysis plan](09_Preregistration.md)
10. [Collect data](10_Data_collection.md)
11. [Preprocess and merge data](11_Preprocessing.md)
12. [Run your analysis scripts](12_Data_analysis.md)
13. [Write the results and discussion part of your manuscript](13_Results_and_discussion.md)
14. [Openly provide all data, analysis scripts and ideally material](14_Open_data_and_code.md)
15. [Submit your manuscript along with a preprint](15_Manuscript_submission.md)
16. [Revise your manuscript](16_Manuscript_revision.md)
17. [Archive your project](17_Project_archiving.md)

This list roughly reflects the steps that are to be taken throughout a research project, although not necessarily in exactly that order. In the following, decisions to be made, things to do and issues to consider at each step are outlined and - where necessary - elaborated on. Just click on any of the elements of the list to go directly to the respective section.
