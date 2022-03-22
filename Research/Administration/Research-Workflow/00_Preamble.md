# Preamble

[Alexander Strobel](mailto:alexander.strobel@tu-dresden.de)<br>
Faculty of Psychology<br>
TU Dresden

Credits go to<br>
All members of AG.DPP (TU Dresden)

2022-03-22

---

We, the AG.DPP team at the Faculty of Psychology at the TU Dresden are strongly committed to open, transparent and reproducible research. Therefore, each step in every research project is expected to be open, transparent and reproducible - for researchers worldwide, other members of AG.DPP and (most notably) our future selves. Consider yourself working all night and eventually find the solution at 2 am. Your documentation of your work (we shall refer to every piece of work as code henceforth) should ideally inform your future self (at, say, 2 pm the same day) what you were doing, what you came up with and why and what for. So, the *Primary Directive* at AG.DPP is

**We always comment our code!**

We do not intend to eventually comment our code sometime in the future! We do not expect our code to be comprehensible anyway! We comment what we are about to do even ahead of doing it! We make our work as accessible as it could possibly be, assuming that everyone in this world - including our future self – is a moron!

**We aim to be as FAIR as possible!**

Being committed to open, transparent and reproducible research means that all pieces of your work should be FAIR in the sense that they are [*Findable, Accessible, Interoperable, and Reusable*](https://www.go-fair.org/fair-principles/).

- **Findable** means that we provide our work on a trustworthy repository with a globally unique and persistent identifier, usually a Digital Object Identifier (DOI)
- **Accessible** means that we provide our work in a way that makes it possible to access it.
- **Interoperable** means that our work can be used in other workflows than that we used ourselves.
- **Reusable** means that our work are appropriately licenced and described in a detail sufficient to make sense of it.

The AIR in FAIR implies (among other isssues) that our work is accessible even if one is using another machine, operating system and software. We cannot assume that if we are using a PC with Windows 10 and run our analyses with the latest versions of SPSS and MPlus, that someone in, say, Aachen, Boston, or Colombo can reproduce your results, even when they run our code on a PC with Windows 10 and the latest versions of SPSS and MPlus.

There may be users with Mac or Linux machines, there may be STATA or LISREL users ... therefore, we provide our data, code and materials platform-independent and without having other researchers to install or even buy proprietary software, either (if we are using proprietary software for some reason) by meaningfully commenting our code (see the *Primary Directive*) or by using free software such as [R and RStudio](https://github.com/alex-strobel/DPP-LabManual/wiki/R-and-RStudio). We also aim to create a reproducible einvironment, e.g., via the [R package `renv`](https://github.com/alex-strobel/DPP-LabManual/blob/main/Research/Administration/GitHub/GitHub_and_renv_long.md) or a virtual machine (e.g., via [Docker](https://hub.docker.com/_/r-base)).

For statistics, there are free alternatives to R such as [JASP](https://jasp-stats.org) or [jamovi](https://www.jamovi.org), which (having a GUI) are more accessible, especially to students. Yet, in the end, even these alternatives boil down to R, so we should be using R right from the start!

Also, we always give our shared work a licence (and make sure that we ourselves have a licence for reused work of others). Ideally, this should be a [CC 0 licence](https://creativecommons.org/publicdomain/zero/1.0/deed.en), except if we reuse work that was otherwise licenced. If we share work with important intellectual content that shall be attributed to us, we use a [CC 4.0 BY](https://creativecommons.org/licenses/by/4.0/deed.en) licence. We usually refrain from using a [CC 4.0 BY-NC](https://creativecommons.org/licenses/by-nc/4.0/deed.en) licence, not only because the Deutsche Forschungsgemeinschaft does not regard such a licence eligible for funding. There may be rare exceptions, however, where we may want to prohibit that our work is used for commercial purposes.

Finally, we always describe our work in a detail sufficient to make sense of it, including, but not limited to, a codebook.

---

[**Table of Contents**](#README.md) | [next to **Research question**](01_Research_question.md)