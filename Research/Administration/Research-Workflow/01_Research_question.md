# Research Question

## Table of Contents

- [Research Question](#research-question)
  - [Table of Contents](#table-of-contents)
  - [Starting point](#starting-point)
  - [Research Transparency Advisor](#research-transparency-advisor)
  - [Authorship](#authorship)
  - [Formulation of hypotheses](#formulation-of-hypotheses)

---

> **Summary.** It is absolutely essential to have a well-formulated research question, better think it over and over than to start your project with an ill-specified research question. Also, identify potential collaborators and discuss your question with them. One of them should be assigend to be the so-called Research Transparency Advisor, and all of them (but notnecessarily *only* them) will be potential co-authors of a manuscript that eventually results from your project, so make sure that everyone involved in principle *can* and actually *does* filfil the criteria for athorship.

---
## Starting point

You may have some research interest and perhaps already some research idea, but it is essential that before you really start engaging in planning and conducting a study you have to have a specific research question that ideally allows you to derive hypotheses. *How does Need for Cognition (NFC) develop?* is a research interest, and *life events may shape NFC* is a research idea. So you could go on, use some life event questionnaire together with the NFC scale in a convenience sample and correlate the resulting scores with each other. You may find that NFC is positively correlated with the number of positive life events reported, but not with the number of negative life events. Does this result confirm your notion that life events shape NFC? Or couldn't it be that NFC shapes the experience or the recall of specific life events? Your research design does not allow to decide for or against any of these alternative explanations.

Therefore, it pays to ponder your research idea over and over, to carefully read the literature on the relationship of life events and NFC, perhaps even to write a short review that you can submit as a stand-alone paper or that can be of use for the theoretical part of your manuscript. Also present your idea to colleagues - be it in your lab or at other occasions such as conferences - and discuss your thoughts on the matter! This will also help to identify potential collaborators and/or co-authors.

## Research Transparency Advisor

During this process, you should also find someone who will act as what we provisionally call here *Research Transparency Advisor (RTA)*: Someone who is double-checking your routines and your code. It is strongly recommended that you have a RTA for every project you run! It not only reassures you that you are still on the right path, it also supports the transparency and reproducibility of your research.

## Authorship

The RTA will put considerable effort in your paper, so co-authorship of the RTA is justified by all means. But what essentially does define authorship? A discussion of this issue can be found in out [manual on authorship](https://github.com/alex-strobel/DPP-LabManual/blob/main/Research/Administration/Authorship/Authorship.md). In short:

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

## Formulation of hypotheses

<!-- urgently needs review/revision! -->

All authors should finally agree on the research questions posed and the hypotheses formulated. Hypotheses should be stated clearly and must be translatable into a statistical test. In the above example: you expect that past positive but not negative life events would be related to NFC. So you might think that your hypotheses could read:

- H0: Negative life events do not correlate with NFC.
- H1: Positive life events correlate with NFC.

These hypotheses would translate into a correlation analysis. If *p* < .05, you would *reject* the null hypothesis. However, if *p* < .05, the frequentist approach does not allow you *accept* the null hypothesis. You could state that if the correlation (= effect size) is very small, say, *r* < .10, the null hypothesis seems more likely to be true, but still, also a rather small effect might be of relevance in your field of study. Another option would be that you use Bayesian statistics that allow to quantify the evidence for or against the null hypothesis. A further aspect why the above hypotheses are not well-formulated is that it is not clear how you operationalize *positive* and *negative life events* on the one hand and *NFC* on the other hand. 

Taking these issues into account, it would be better to be precise and state:

*for a frequentist approach*

- H0: The self-reported number of Negative life events insignificantly correlates with the scores on the NFC scale, with a negligible effect size (*r* < .10).
- H1: The self-reported number of positive life events significantly correlates with the scores on the NFC scale, with a small to medium effect size (*r* ≥ .10).

*for a Bayesian approach*

- H0: There is at least moderate evidence for no correlation of the self-reported number of negative life events with the scores on the NFC scale (BF10 < 1/3).
- H1: There is at least moderate evidence for a correlation of the self-reported number of positive life events with the scores on the NFC scale (BF10 > 3).

Also, when formulating hypotheses, one should take care to state them in a way that minimizes the number of statistical procedures to test them. Otherwise, there will be the necessity to deal with the problem of [multiple testing](https://github.com/alex-strobel/DPP-LabManual/blob/main/Research/Analysis/Methods/Multiple-Testing/Multiple-Testing.md), and having to deal with this problem may drive you crazy. Also, posing *directed* hypotheses will give you the opportunity to conduct one-sided tests, both in the frequentist and the Bayesian approach. So, try to be as specific as you can be when you formulate a hypothesis. 

As an example: You could state as an hypothesis that Need for Cognition will be related to Neuroticism. If you measured Neuroticism with the NEO-PI-R and performed tests on the facet level, you will have run into several problems. The first problems is that you formulated your hypothesis only for one construct (= Neuroticism) and not for six constructs (= the six NEO-PI-R Neuroticism facets) on which you performed your actual tests, so you need to correct for multiple testing of one and the same hypothesis. The second problem is that you did not specify the direction of the relationship, so you need to perform two-sided tests in a case where you could have easily performed one-sided tests. So in this case, it would have been better to state that you expect a *negative* relationship between Need for Cognition and Neuroticism, and that you expect this negative relationship to be most pronounced for the Neuroticism facet of *Vulnerability* (cf. [Fleischhauer et al. 2010](https://journals.sagepub.com/doi/10.1177/0146167209351886?url_ver=Z39.88-2003&rfr_id=ori:rid:crossref.org&rfr_dat=cr_pub%20%200pubmed)).

A final issue on the formulation of hypotheses is that the fancier your hypothesis, the less likely it will confirmed. And an ultimate issue is that - being devoted to critical rationalism *sensu* Popper <!-- insert Ref. --> we should not be aiming at confirming our hypotheses in the first place, but to reject them. 

---

[**Table of Contents**](#README.md) | [back to **Preamble**](00_Preamble.md) | [next to **Theoretical Part**](02_Theoretical_part.md)
