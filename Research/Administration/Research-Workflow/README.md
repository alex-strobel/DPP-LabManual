# Research Workflow

This manual is at the core of this LabManual. **All members of AG.DPP are required to read this manual very carefully and act accordingly when performing a research project.** It outlines how we @AG.DPP perform a research project, starting with the research question and ending with project archiving. It mentions all the things to do and/or to consider as well as the issues to elaborate on along the timeline of a research project.


0. [Preamble](00_Preamble.md)

   The primary directive at AG.DPP is: We always comment our code! And next to this, we aim to be as FAIR as possible.

1. [Pinpoint your research question and formulate your hypotheses](01_Research_question.md)
   
   It is absolutely essential to have a well-formulated research question, better think it over and over than to start your project with an ill-specified research question. Also, identify potential collaborators and discuss your question with them. One of them should be assigned to be the so-called Research Transparency Advisor, and all of them (but not necessarily *only* them) will be potential co-authors of a manuscript that eventually results from your project, so make sure that everyone involved in principle *can* and actually *does* filfil the criteria for authorship.
   
2. [Write the theoretical part of your manuscript](02_Theoretical_part.md)
   
   You may already consider the appropriate target journal for your manuscript, even if you haven't started the project yet. It also pays to consider in which format you want to write your manuscript. We at AG.DPP strive to use R Markdown as often as possible, for the reasons outlined below. Otherwise, we make sure to use (Word or LaTeX) templates that many journals/publishers offer. As regards the content of our theoretical part, we always strive for a maximum of clarity and conciseness ...

3. [Develop and refine the study design](03_Study_design.md)

   Develop your study design carefully! Try to anticipate as many details as possible! Also consider only variables that are really necessary to answer your research question and assess them in a detail that is justified. Always prefer open materials, and if you cannot, buy commercial assessment instruments instead of simply using them (this is a copyright infringement)! Estimate the required sample size either based on the literature (but be aware of publication bias that results in inflated effect sizes) or run a (large enough) pilot study. Also consider to use a sequential testing procedure, e.g., Baysian sequential testing.

4. [Create a REDCap project](04_REDCap_project.md)

   ...

5. [Create a GitHub project](05_GitHub_project.md)
   
   It is strongly recommended to always collaborate on research projects via GitHub and ideally set up the project with a reproducable environment. Often, it will also be a good idea to have an OSF profect page that can be easily linked to your GitHub project.

6. [Develop an - ideally fully scripted - analysis plan](06_Analysis_plan.md)
   
   One of the most important steps in conducting a research project is to develop an adequate analysis plan. Use *state of the art* analysis routines that are best suited for your research question and type of sample and data. These routines can be fully scripted ideally, they *are already fully scripted* before you even start with data collection. Prefer open analysis software, usually R/R packages! Also consider to use Baysia statistics, as you should be able to reject your null hypothesis which you cannot if using a frequentist approach. And finally, carefully plan in advance how to merge your data if they come from different sources (e.g., questionnaire data collected via REDCap, EEG data collected via BrainVision Analyzer, reaction time data collected using a Presentation or Python script etc.)

7. [Write the methods part of your manuscript](07_Methods_part.md)

   We use the 21-word solution! Therefore, we need to report how we determined our sample size (ideally, but not necessarily via a power calculation). We also need to report possible data exlusions and therefore need to make sure that they are not done arbitrarily. Furthermore, we need to report al measures in the study such as variables reflecting questionnaire or tests results or indices of performance in experimental paradigms. All measures assessed should be listed even if they are not use of interest in a given manuscript (but assessed for another purpose). The measures of interest should be described in sufficient detail in the Methods section, and the same holds for the study procedure, so that other researchers in principle should be able to replicate our study. Giving as much detail as possible is especially important for our statistical analyses, but if we provide open data and code (what we should always do!), we may skip some of the more specific details, otherwise the Statistical Analyses subsection may become too long. Ah, and we cite all the software we use appropriately!

8. [Apply for ethical approval](08_Ethical_approval.md)

   ...

9. [Preregister your hypotheses and analysis plan](09_Preregistration.md)

   ...

10. [Collect data](10_Data_collection.md)

      When assessing personal data (i.e., such that would make it possible to identify a given participant), we make sure to adhere to common guidelines for treating such data and also document the data collection priocess and the measures taken to protect such data. It is recommended to recruit and manage participants via ORSEE and to use REDCap for data acquisition and management. During data collection, we continuously perform data quality checks. ...

11. [Preprocess and merge data](11_Preprocessing.md)
    
    We strive to provide the raw data together with all code used to preprocess them. Yet, for time-consuming preprocessing routines, we might also provide already preprocessed data that we load into an R Markdown document for the actual statistical analyses. If we use software other than R (especially if it is proprietary software), we provide the preprocessing results in an universally radable format such as a \*.csv file and carefully document our preprocessing steps in an accessible file format as well. We also make sure in advance that data merging from different sources is based on a common participant identifyer.

12. [Run your analysis scripts](12_Data_analysis.md)

    We always adhere to our (ideally preregistered) analysis plan even if it was flawed unless it was so flawed that we would not be able to analyze the data at all. If we deviate from our analysis plan, we mark such analyses as *exploratory*.

13. [Write the results and discussion part of your manuscript](13_Results_and_discussion.md)
    
    We always try to implement a common logic and order of arguments/analyses/results/discussion. If we state in the Introduction that want to examine A via X, B via Y, and C via Z, we follow this order both in the Methods and the Results part and also discuss our results in this order in the Discussion part, ideally via appropriate subheadings that reflect what we have written in the Abstract. The Discussion part must include a "Limitations and future directions" and a final "Conclusions" section.

14. [Openly provide all data, analysis scripts and ideally material](14_Open_data_and_code.md)

    Whenever possible, we provide open data and code (and ideally also open material). If we provide open data, the data come with a codebodd that explains all variables in sufficient detail. We provide our data and code on a reliable repository such as OSF, GitHub or OpARA.

15. [Submit your manuscript along with a preprint](15_Manuscript_submission.md)

      When submitting a manuscript, pay attention to all the relevant guidelines, especially the artwork guidelines. In five years from now, when you magnify a figure to 300%, you do not want to see pixels, count on that! Prepare yourself for blinded review, reserver at least two hours for the submission process to (re)create all the files required to be uploaded. Afterwards (or directly before), you might to consider posting your manuscript as a preprint!

16. [Revise your manuscript](16_Manuscript_revision.md)

      Addressing comments made during the review process only can make your manuscfript stronger, either because the revirewers raised important issues or because you had a second thought on some paragraph you wrote, some decision you made or some statistical procedure you employed, only to find out that to the best of your (current) knowledge, you were right. Still, discuss everything with your co-authors! Carefully structure your rebuttal letter, because it might be longer than your manuscript, and it is in your best interest, that the reviewers won't get lost in your rebuttal.

17. [Archive your project](17_Project_archiving.md)

     ...

