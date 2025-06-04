# Manuscript Submission

## Table of Contents

- [Manuscript Submission](#manuscript-submission)
  - [Table of Contents](#table-of-contents)
  - [Publication guideline of the TU Dresden](#publication-guideline-of-the-tu-dresden)
  - [Submission guidelines](#submission-guidelines)
  - [Blinded review](#blinded-review)
  - [Submission process](#submission-process)
  - [Posting the manuscript as a preprint](#posting-the-manuscript-as-a-preprint)
  - [Completion of submission](#completion-of-submission)

---

> **Summary.** When submitting a manuscript, pay attention to all the relevant guidelines, especially the artwork guidelines. In five years from now, when you magnify a figure to 300%, you do not want to see pixels, count on that! Prepare yourself for blinded review, reserve at least two hours for the submission process to (re)create all the files required to be uploaded. Afterwards (or directly before), you might to consider posting your manuscript as a preprint!

---
## Publication guideline of the TU Dresden

Whenever possible, we adhere to the [Publication Guidelines of the TU Dresden](https://tu-dresden.de/forschung-transfer/forschungsinformationen/publikationsrichtlinien).

## Submission guidelines

As already mentioned, a decision on the journal you want to submit your manuscript to should have already been made before preparing the manuscript in order to format it appropriately. Yet, even if you consulted the submission guidelines ahead of manuscript preparation, you should now go though these guidelines again to make sure you did not miss some important instruction. As an example for such guidelines, see here:

- [Submission guidelines of PLoS ONE](https://journals.plos.org/plosone/s/submission-guidelines)

Among the guidelines, there will be instructions for artwork you are required to upload. What you should always keep in mind when is comes to artwork is:
- **Prefer vector over raster graphics!**<br>
If you need to combine vector and raster graphics, save them in high resolution (≥ 300 dpi, format depending on the journal). In doubt, use 1000 dpi *.tif images with LZW compression
- **Get yourself the right software tools!**<br>
One for handling vector and one for handling raster graphics. Ideally, they come from the same developer, will be maintained in the foreseeable future, are free and open source or at least do not come with a licence that has to be renewed annually
- **Consult the relevant artwork guidelines!**<br>
If in doubt, use RGB color space, 90 mm width for smaller figures that fit on in column (if the journal uses columns anyway) or 180 mm width for larger figures, and sans serif font (ideally Helvetica)
- **Think twice when it comes to point and line style and color!**<br>
Point style should meaningful, lines solid, and different colors should remain distinguishable for everyone under every circumstance
- **Provide all necessary information, but not all possible information!**

For details on artwork creation see the following presentation:

- [Graphics: A short guide on how to create figures](https://github.com/alex-strobel/DPP-LabManual/blob/main/Research/Administration/Workflow_research_projects/Resources/Graphics/DPP_LM_Graphics.pdf)

## Blinded review

The journal you are submitting to will have a double-blind review policy, meaning that neither authors and reviewers should not be aware of their identity. If you organize your project as a GitHub project (which is strongly recommended, see [Create GitHub Project](05_GitHub_project)) and write your manuscript using R Markdown with the `papaja` package, things get a little bit complicated, but not that much. Just proceed as follows:

- If not already done, create an OSF project and link it to your GitHub project (see [GitHub Project: OSF](05_GitHub_project.md#osf)). This will mirror your GitHub project on OSF, and every change you make to your GitHub project will automatically be visible on OSF als well. 
- On OSF, [create a view-only link](https://help.osf.io/article/201-create-a-view-only-link-for-a-project) for this project.
- If you used R Markdown with `papaja` to create your manuscript, all the identifying information will of course be visible in the `*.Rmd` file. Yet, you can knit your R Markdown file to a PDF by setting the YAML header's `mask` entry to `yes`, so the title page of the knitted PDF does only contain the title. Of course, in your `*.Rmd` file, all the information is still present, so one idea could be to move the `*.Rmd` file(s) temporarily to another folder so that they do not show up on GitHub and OSF until the reviewing process is completed. Then, move the `*.Rmd` files back to your GitHub repo.
- Still, one issue remains: On OSF, you can view all files also on GitHub (there is a "View file on GitHub" link above each document), and if reviewers would follow this link, they would see your name on GitHub (unless you have a fancy user name on GitHub and do not reveal any information of yourself there, which is not recommended at all). So one option I implemented in a recent manuscript could be to  write in the manuscript:
  > All data and code for reproducing our analyses are permanently and openly accessible at https://osf.io/34yav/?view_only=3bf5e46b6a444bd8b69300041f838523 (project blinded for review, and to ensure blind review, please do not follow the “View this file on GitHub” link).

I mean, I do not care if the reviewers know who I am, I am really fond of *open* review, but if the journal has a double-blind policy, it is better to accommodate to that.

## Submission process

Be prepared that the submission process will take some time! Not only it may be the case that the submission system works slowly. You also may be required to provide information and documents you are not prepared to provide (because you didn't read the submission guidelines carefully enough) such as a cover letter, a significance statement, bullet points summarizing the main findings of your research, a praphical abstract etc. Reserve **at least two hours** for manuscript submission and make sure that at least one co-author will be available for consultation in case you are in doubt on one or another step in the submission process.

After you are done with the submission process, you will receive an PDF version of your submission. This PDF ist to be sent immediately to all co-authors to inform them about the completion of the submission and to save it for their records. It's an absolute **must** when submitting a manuscript to send the PDF of te submission to all co-authors!

## Posting the manuscript as a preprint

You may want to consider to post your submitted manuscript as a preprint, e.g., on [PsyArXiv](https://psyarxiv.com). We usually do that, because:

- our research is made open (so especially for fresh ideas, you can claim that you had it first) and open for discussion
- the preprint is assigned with a Digital Object Identifier (DOI) and can be cited in other work of ours, even if the review process for the actual manuscript will take months/years 
- the majority of journals accept a preprint

Yet, to make sure that naïve readers of your preprint do not assume that it is a valid (i.e., peer-reviewed) piece of science, we at AG.DPP always put the following disclaimer on the title page of our preprints:

> Scientific articles usually go through a peer-review process. This means that independent researchers evaluate the quality of the work, provide suggestions, and speak for or against the publication. Please note that the present article has not (yet) undergone this standard procedure for scientific publications.

This disclaimer has been empirically validated, unfortunately, we forgot by whom ... <!-- if someone knows, please add ref. -->

Another very important aspect to consider about preprints is that you cannot just update the preprint version any time you want.
It might sound bizarre, but as soon as reviewers have suggested changes to your manuscript and you have implemented them, the manuscript is not solely your own intellectual porperty anymore.
This means that there are three different types of stages in which you might want to upload a preprint:

1. Before submitting your manuscript to a journal<br>
&rarr; Yes, please do so!
2. After the first round of reviews<br>
&rarr; No, your might get sued.
3. After it had been type-set by the journal aka your *author proof*<br>
&rarr; Absolutely not, you will definitely get sued.

Even if you publish Open Access and pay the fee, many journals still have an embargo on your article, which specifies after which period of time (usually 6-12 months) you are allowed to distribute your article by yourself.
Journals do that, so they can get more clicks on *their* version.
Always make sure to check the specific Open Access guidelines of the journal that you chose to publish in.

## Completion of submission

If done with a submission, reward yourself! You know best what will be an adequate reward ...  

---

[**Table of Contents**](#README.md) | [back to **Open Data and Code**](14_Open_data_and_code.md) | [next to **Manuscript Revision**](16_Manuscript_revision.md)
