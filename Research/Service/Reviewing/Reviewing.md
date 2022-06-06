# Reviewing manuscripts

[Alexander Strobel](mailto:alexander.strobel@tu-dresden.de)<br>
Faculty of Psychology<br>
TU Dresden

2022-03-21

---

## Table of Contents

- [Reviewing manuscripts](#reviewing-manuscripts)
  - [Table of Contents](#table-of-contents)
  - [Which manuscripts we should accept to review](#which-manuscripts-we-should-accept-to-review)
  - [Structure and tone](#structure-and-tone)
  - [Open Science](#open-science)
  - [Additional major points](#additional-major-points)
  - [Suggesting vs. requesting](#suggesting-vs-requesting)
  - [Overall recommendation](#overall-recommendation)
  - [Re-review](#re-review)
  - [Final remark](#final-remark)


## Which manuscripts we should accept to review

Peer review is an essential quality assurance measure in science. So, whenever we feel competent to review a manuscript and have enough time to do so in time, we accept a review request. As regards the time constraint, one review per one or two months should be ok. Someone once said to me, one review per manuscript you submitted by yourself in a given time window would be a good rule of thumb. I am not sure whether this works, but one may try ...

When from reading the abstract of the manuscript you are requested to review it becomes clear that certain basic standards are not met (e.g., sample size is way too low and/or the effect in question is rather unlikely to exist in the population, language is insufficient, statistical analyses are flawed etc.), we should refrain from reviewing if we not really have time to do so anyway (which is always). Otherwise - i.e., if we *have* time to do so – we should list our issues with the manuscript and give one or two examples for each issue. If we suggest rejection, that's it, if we suggest (major) revision, we will need to take some more time to list other (also minor) issues so that the authors can address them. Most of the time, you can spare the time to direct the authors' attention to typos or to formatting violations, because (in case the journal your are reviewing for has a production office) such mistakes will be dealt with later on.  

Often, some colleagues will suggest us as reviewers, and in such cases, consider if you may be biased, either formally (e.g., because you published together, run a project together) or informally (e.g., because you really like these colleagues). As long as there is no *formal* bias to be assumed, we should accept the review because for action editors, it semms to be really hard to find reviewers these days, especially both knowledgeable *and* fair ones. Still, we will be informally biased in one way (reading the manuscript all too critical to avoid bias) or another (realising that we are reading the manuscript all too critical, we may want to counteract and eventually write a too positive review). Anyway, even if we like the colleagues whose manuscript we review and even if our name will be on the review (because we reviewed for, e.g., some *Frontiers* journal or decided to sign our review anyway, an idea I personally am fond of), we should not refrain from acting as outlined below under *Open Science*, even if this may cause trouble for our friends. 

## Structure and tone

We always start with a short summary of what was done in the study (or studies) the manuscript reports on to make clear (and for ourselves sure) that we have read the manuscript and understand what it is about. We then give an overall evaluation of the quality of the manuscript and of the extent to which it adds (or does not add) to the literature. Here is an example for a positive evaluation:

> This research makes an important contribution to the literature on ... by providing compelling evidence that ... It is expected that it will generate a number of follow-up studies and thus will help to tackle the so far unresolved question how ...

An example for a rather negative evaluation:

> While the research project described in this manuscript set out to answer why ..., in my opinion, the authors did not convincingly provide evidence for their claim.

As regards tone: We are always polite! Even if we think that the manuscript and/or the study performed is rubbish, we consider that the authors put some or even *a lot of* effort in this study. Perhaps they didn't know better, perhaps they were forced to perform poor research for one reason or another, perhaps they hadn't the resources to run the study as it should have been run and so on. We also consider what we would think and feel if we would get the review we are about to write.  
      
After our general evaluation of the merits and perhaps shortcomings of the manuscript, we list the issues we have with the manuscript and number them consecutively, i.e., we add our *Open Science statements* (see below) if necessary as points 1 and 2, then list *major issues* (i.e., issues that we think *must* be addressed by the authors) as, e.g., 3. to 6., followed by *minor issues* (i.e., issues that *should* be addressed) listed as 7. to 12. This will make it much easier for the authors to address our comments.

As regards *ordering* of our issues, one rationale may be to order them according to their importance. Another rationale be to order them according to their appearance in the manuscript. I personally like the latter approach, because it is easier to go through the manuscript page per page instead of important issue (on, e.g., p. 15) per less issue (on., e.g., p. 7). If our wording indicates which issue we regard as an request and which issue we rather consider a suggestion (see below, Suggesting vs. requesting), the former approach is to be preferred.    

## Open Science

We act in accordance with points 6 and 7 of the [OSIP Research Transparency Statement](https://tu-dresden.de/mn/psychologie/die-fakultaet/open-science/osip-research-transparency-statement): 

> 6. As reviewers, we add the “standard reviewer disclosure request”, if necessary (https://osf.io/hadz3/). 
It asks the authors to add a statement to the paper confirming whether, for all experiments, they have reported all measures, conditions, data exclusions, and how they determined their sample sizes.
> 7. As reviewers, we ask for Open Data (or a justification why it is not possible).

Hence, if a manuscript we review does not contain (something along the lines of) the [21-word solution](https://github.com/alex-strobel/DPP-LabManual/wiki/21-word-solution), we write in our review:

> "I request that the authors add a statement to the paper confirming whether, for all experiments, they have reported all measures, conditions, data exclusions, and how they determined their sample sizes. The authors should, of course, add any additional text to ensure the statement is accurate. This is the standard reviewer disclosure request endorsed by the Center for Open Science [see http://osf.io/hadz3]. I include it in every review."

Also, if the manuscript does not contain a statement on open data and code, we write:

> "Being strongly committed to open and transparent research, I request that the authors make their data and code (and ideally all other material necessary to reproduce their results) openly available on a reliable repository such as OSF (https://osf.io) or add a statement to their manuscript why they cannot do so."

If the authors do not convincingly address these two issues, we should feel free to withdraw from review or recommend rejection (see the [Peer Reviewers' Openness Initiative](https://www.opennessinitiative.org) for details).

## Additional major points

They will most likely be:

- no power calculation
- no effect size estimation
- no limitations section in the Discussion

The first of these points may seem the least important (although we always should insist on adding a paragraph on power considerations), because we can calculate the achieved power from the effect size and the sample size. Yet, often enough, some readers may not be so much into the power issue and simply rely on what is written in a manuscript, so we as reviewers need to make sure that all readers get adequate information on statistical power.

Also, often enough, there is no effect size estimate in the manuscript and no other information that allows us to calculate one using the [`effectsize` package](https://github.com/alex-strobel/DPP-LabManual/wiki/R-package-effectsize). If so, we cannot thoroughly evaluate the outcome of the study and therefore request information on effect sizes or measures to calculate them (degrees of freedom along with a *t*- or *F*- statistic already will do) ...  

While I want to acknowledge that adding a limitations section to the Discussion part of a manuscript is increasingly common, it often comes like it was copied from a text that outlines a typical manuscript structure. Yes, sample size is most of the time an issue, another one is that one should have corrected for multiple testing but did not do so (sometimes, not even a reason is given why not having done so, but at least it is acknowledged). (Lack of) generalisability is also an often voiced limitation, and yes, our own manuscripts will most likely also suffer from these very limitations. But would it be unfair to remind the authors of these limitations (just as we ourselves always remind us about the limitations of our own studies)? I guess no. And thinking of limitations: We should always try to discover further limitations when we review a manuscript. This is not meant to make the authors sad and stuff that they had not thought of this or that limitation by themselves. It is rather an exercise in detecting limitations that we might want to avoid in our own research. If we detect some further noteworthy limitations, we note them with due humility and *suggest* to add them to the limitations section.

## Suggesting vs. requesting

The above points have made it clear that there are several things we *request* so that we deem a manuscript publishable. However, there may be some points that we personally would find more suitable but that cannot be substantiated on scientific grounds. We would *request* open data and code, but we would *suggest* to label a figure using a *sans serif* font. We may *request* a paragraph on power considerations, but we may only *suggest* a concluding paragraph outlining the take-home message.  

## Overall recommendation

We will most likely be asked to rate the quality of the manuscript on a 0-100 scale. I have the impression that this scale somehow resembles that of ratings for wines from Bordeaux chateaux: If the rating is not above 90, no one will buy them. So if we are convinced of the quality of the manuscript, we should give a 90+ rating, even if we have a number of (addressable) issues with the manuscript. 

## Re-review

There is this German saying "Beim ersten bist Du frei, beim zweiten bist du Knecht". Although it does not perfectly capture what is meant here: If we agreed to review in a first round, we of course review in a second round (and all rounds that follow), unless we want to withdraw from review (or recommend rejection) due to non-compliance of the authors with regard to Open Science issues.

## Final remark

We always write the reviews we would like to receive. That does not mean that we should be positive about bad manuscripts, but we should always be polite, appreciating, and constructive. And we should value and/or request Open Science practices!    
