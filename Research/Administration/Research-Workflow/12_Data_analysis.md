# Data Analysis

## Table of Contents

- [Data Analysis](#data-analysis)
  - [Table of Contents](#table-of-contents)
  - [Adhere to your analysis plan](#adhere-to-your-analysis-plan)
  - [Carefully consider and discuss potential exploratory analyses](#carefully-consider-and-discuss-potential-exploratory-analyses)

---

> **Summary.** We always adhere to our (ideally preregistered) analysis plan even if it was flawed unless it was so flawed that we would not be able to analyze the data at all. If we deviate from our analysis plan, we mark such analyses as *exploratory*.

---

## Adhere to your analysis plan

More likely than not you will not have foreseen all the issues your data set comes with, and you may want to change some of your preregistered routines. **Don't!** Proceed as preregistered and then perform additional analyses, making clear that these have not been preregistered and therefore must considered as exploratory. As long as you are most transparent about what your are doing, everything is fine. Problems only arise if you later on declare something that you not initially intended to do (or forgot to declare as something you will do) as something you actually *did* intend to do. As an example: You realize that in your preregistration, you forgot to declare that you intend to log-transform your reaction time data (whether this is justified, is another issue <!-- add link to manual on the appropriate treatment of RT data -->). You now might think that everyone else log-transforms RT data, so it would be stupid not doing so just because you forgot to preregister that step. Well, what is stupid is that you forgot to preregister this step, but it is not stupid to live with your error and to proceed as preregistered. In your manuscript, you would point out that error (if it is one, again, see ...) <!-- add link to manual on how to appropriiately deal with RT data -->  and add – and, importantly, *mark!* – the analyses with the log-transformed data as *exploratory analyses*.

## Carefully consider and discuss potential exploratory analyses

When working with the actual data, you will often enough encounter alternative and seemingly more promising ways to analyze your data. You may be right, but you may also be fooled by your way of looking at the data. To be honest, we all have some prior beliefs and are prone to find patterns in data, even if there are none or – having established a mindset that the null hypothesis is more often true than we would want it to be – to prove that there really is no effect whatsoever. So ask yourself (and ask colleagues) whether it is really justified to include another covariate in your regression model; to use robust or Bayesian statistics, although you initially did not intend to do so (you should have, shouldn't you); to correct or not to [correct for multiple testing](https://github.com/alex-strobel/DPP-LabManual/wiki/Correction-for-multiple-testing) and so on ... If your colleagues tell you that your intended exploratory analysis is justified, add it to your manuscript. If they raise doubt, value their opinion more than yours (but make sure to ask colleagues with expertise in your research field and methods). Also, if you aren't a complete novice to a research field or method, what they tell you should intuitively make sense to you and ideally should be backed up with some reference(s).  

...

---

[**Table of Contents**](#README.md) | [back to **Preprocessing**](11_Preprocessing.md) | [next to **Results and Discussion**](13_Results_and_discussion.md)
