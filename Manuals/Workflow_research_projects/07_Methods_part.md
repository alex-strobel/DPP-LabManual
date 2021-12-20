# Methods part

We at AG.DPP always start our Methods part with the [21-word solution](https://github.com/alex-strobel/DPP-LabManual/wiki/21-word-solution), and we make sure that it is correct. 

## Participants

The first subsection is the *Participants* section. You may want to start it with your power analysis that informed you about your sample size. 

> We assumed an effect size of *r* = .30. With a power of 1-&beta; = .95, the required sample size was *N* = 138 as determined using the R package *pwr* (Champely, 2020). We oversampled by 10% to account for dropouts, technical errors and outliers and therefore recruitied *N* = 150 participants. Of these, two had to be excluded due to technical reasons (EEG recording failed) and three further participants had to be excluded due to untrustworthy answers (e.g., age = 99 or gender = "Boba Fett"), leaving 145 participants (X percent female) with a mean age of ... years (range Y to Z years).

Or you may have had a convenience sample that for economic reasons was as large as it could be given a limited time to perform your study.  

> Due to time constraints, we recruited as many participants as possible between Oct 2022 and Feb 2023. A total of *N* = 119 participants (67 percent female) took part in our study. With this sample size, we were able to detect a correlation of *r* = .32 with a power of 1-&beta; = .95.  

In any case, describe your rationale for determining sample size. Ideally, this rationale should be based on power considerations, but sometimes, you will not be able to meet the sample size you ideally should have. Then, be open about it:

> For the within-subjects analyses, a power calculation using G\*Power (Faul et al., 2009) indicated a sample size of *N* = 36 when assuming a medium effect size of *f* = .25, a power of 1-&beta; = .95 and an &alpha;-level of .05. Yet, for the between-subjects analyses, G\*Power indicated a required sample size of *N* = 136 to achive a power 1-&beta; = .95 to detect a medium effect size at the nominal &alpha;-level. Given limited resources to perform our study, we therefore set 1-&beta; to .80 and recruited a sample of *N* = 82, still enabling us to detect a medium effect size with adequate power.

## Material

In this section, all material used in the study is described, e.g., questionnaires, experimental paragdigms or stimuli used. 
Ideally, this is done in a detail that enables other researchers to directly replicate your study. 
If this is not possible (e.g., because of the word limit of your manuscript), we refer to supplementary methods in the Supplementary Material.
Often enough, we will use material that we already described in an earlier manuscript, and more likely than not it took us some time to arrive the perfect description of our material back then. 
While it is generally accepted that authors should omit self-plagiarism, an optimal description of a material or aprocedure---at least in our opinion---can and indeed *should* be reused. 
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

> *Need for Cognition* (NFC) was assessed with the 16-item short version of the German NFC scale (Bless et al., 1994). Responses to each item (e.g., "Thinking is not my idea of fun", recoded) were recorded on a 7-point Likert scale ranging from -3 (completely disagree) to +3 (completely agree) and were summed to the total NFC score. The scale shows comparably high internal consistency (Cronbach’s &alpha; > .80; Bless et al., 1994, Fleischhauer et al., 2010) and a retest reliability of *r*<sub>tt</sub>  = .83 across 8 to 18 weeks (Fleischhauer et al., 2015). It has been shown to positively correlate with academic performance (r &ge; .20; von Stumm & Ackerman, 2015). 

An example for a test would be:

> Two versions of the *Trail-Making Test* (see, e.g., Lezak, Howieson, Loring, Hannay, & Fischer, 2004) were used to examine mental speed (versions A and B) and task shifting ability (version B only). In version A, the participant is asked to connect 25 numbers scattered across a sheet of paper in ascending order. In version B the task is to connect numbers and letters in alternating order (i.e., 1-A-2-B …). The outcome measure is the time for completion of each version.

 
[[back](00_How_to_organize_a_research_project.md#organization-of-this-manual)]
