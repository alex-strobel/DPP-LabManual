# Version control and collaboration using GitHub and the `renv` package

[Alexander Strobel](mailto:alexander.strobel@tu-dresden.de)<br>
Faculty of Psychology<br>
TU Dresden

## The problem

Consider yourself in the following situation: 
You are working on a psychological research project that involves collecting questionnaire data, behavioral data such as response times and error rates from an experiment, and physiological data, say, electrodermal activity (EDA).
You are collaborating with two team members. 
Your task is to supervise data collection, to analyze the questionnaire data and to merge it with the behavioral and the psychophysiological data, perform statistical analyses, and write the majority of the research report.
Let us call you collaborator A.

The task of collaborator B is to preprocess the behavioral data, while collaborator C will analyze the EDA data.
Both will be involved in writing the research report, as they will contribute parts of the Methods and Results sections and will revise your first version of the report.
There are also two further persons involved: collaborator D originally had the research idea and acquired funding while collaborator E programmed the experimental paradigm and also supported data collection.
Both will also revise the manuscript. 
Also, collaborator D will finally try to reproduce your statistical analyses based on the preprocessed data and your analysis code.
This shall ensure that the data and code you want to openly share with the scientific community together with your research report indeed allow for reproduction of your analyses.

After data collection is finished, you share a cloud folder of the data with B and C and analyze the questionnaire data.
One week later, collaborator B sends you a link to another cloud folder where the preprocessed results can be downloaded. 
A couple of days later, collaborator C gives you an USB stick with the preprocessed EDA data.
You put all the data on your hard drive, merge it and analyze the data using the R software for statistical computing together with RStudio as frontend.
You write your report in R Markdown to have an easily to be updated manuscript in case your co-authors have suggestions how to improve the analysis pipeline.

Again a few days later, B sends an email late in the evening and notes that there was an error in the preprocessing script for the behavioral data and that the correctly preprocessed data are to be found in a new cloud folder.
One month later, you are done with the first draft of the research report. 
As it is not that straightforward to edit and comment R Markdown documents and also collaborators C and E are not familiar with it, you convert your R Markdown document into a Word document and send it to your collaborators via email. 
You also hand over an external hard drive with all the data and code to collaborator D in order to have the results in your report checked for reproducibility.

Up to this point, everything worked quite well.
Yet, two weeks later, you receive four different Word documents with revisions and comments. 
You now have the quite pain-staking task to merge these documents.
While you are about to do so, collaborator D calls you and says that the analyses are not fully reproducible: 
The analyses involving the behavioral data differ from that reported in your manuscript.
Also, the multilevel model you ran returns somewhat different results.
You then discover that while you used the most recent behavioral data, you accidentally gave your supervisior the data as preprocessed initially.

In a short meeting, all collaborators agree that it would be wise to have a group drive for storing all the data, making it transparent for others when something changes on that drive.
You create such a group drive, upload the most recent data and code and give all collaborators access rights.

During the next weeks ...
- collaborator B has read a new paper on handling outliers in reaction time data and uploads the improved analyses to the group drive by creating a new folder "RT_preprocessed_final", but then reads yet another even more recent paper, reanalyzes the data and creates another folder "RT_preprocessed_final2" 
- collaborator C (for reasons of consistency) renames the folder with the EDA data from "EDA-data" to "EDA_preprocessed"
- collaborator D's analysis scripts give an error message because the folder names have changed on the group drive but not in the code
- It is agreed upon that a readme file  will be used to document all changes made to the group drive.
- Everyone including yourself forgets to add a new comment to the readme after making changes.
- Even after all this mess has been cleaned up and all analysis code runs with the correct files, collaborator D still cannot reproduce your multilevel modeling results. It turns out that D uses a newer `lme4` package version than you did.    

It is clear that such a situation not only demands for a coherent research data management system where all data and code is stored and updated in a traceable manner. 
This system should also make collaboration as effective and efficient as possible by having version control and the necessity to comment on changes built right into the system. 
Finally, the system should allow for having a common R environment for all analyses, even when individual collaborators either do not have certain packages installed or use other package versions. 

Ah, and it would be great if all authors could revise and comment your R Markdown file directly ...

## One solution

In this tutorial you will learn how to use GitHub and the R package `renv` for efficient collaboration on research projects including version control and a common R environment.
This will also allow other researchers to reproduce your research results using your data and code even if they use different R and R package versions.
Yet, this is only *one* solution, and most likely not the best.
While the `renv` package enables one to have a common R environment, it does not ensure that all analyses are carried out as if they were run on the same machine and the same operating system.
For this purpose, a solution involving the `docker` approach would perhaps be superior.
But for now, collaborating via GitHub and using R and RStudio together with the `renv` package will provide a major improvement. 
Before coming to details on *how* to do so, some remarks on *why* one should use these software tools.

## Some background

### Why you should use R and R Studio

As mentioned in other documents in ths manual: 
R is a software environment that is mainly used for statistical computing, but in fact, it is an all-purpose computing environment that is quite similar to MATLAB although the syntax is somewhat but not entirely different. 
That is, you can do a lot of other things than statistical computing with R. 
Yet, *if* you mainly want to do statistical computing, R will in most cases outperform MATLAB (plus, the community is nicer to newbies) because for literally every purpose you can imagine for statistical computing, there is at least one R package (there is even one for [playing a beep](https://cran.r-project.org/web/packages/beepr/index.html) which is nice for analysis routines that take some time so that meanwhile you can do something else but get notified when the analyses are done). 

Also, R enables you to use R Markdown for writing dynamic reports (see below).
It can be linked to GitHub for version control (see further below) and it enables you to use the `renv` package for having a common R environment for a given project (see at the bottom of this document).

R is best used together with RStudio as frontend that comes with a number of benefits that stand-alone R may not provide (I cannot tell because I have never used stand-alone R). 
To install R and RStudio, go to: 

- [The R Project for Statistical Computing](https://www.r-project.org)
- [RStudio](https://www.rstudio.com/products/rstudio/download/) 

The R Project provides an _Introduction to R_, but it is not a short read. For a denser overview on the basics of R, you may want to use the cheat sheet below:

- [Introduction to R](https://cran.r-project.org/doc/manuals/r-release/R-intro.pdf)
- [Base R Cheat Sheet](https://iqss.github.io/dss-workshops/R/Rintro/base-r-cheat-sheet.pdf)

So far, I could not find a both useful *and* visually appealing introduction, just ask the internet if you do not find RStudio's GUI self-explaining.

### Why you should use R Markdown

R Markdown is a simple and easy to learn formatting syntax for authoring HTML, PDF, and MS Word documents. R Markdown allows to create updatable and reproducible reports because one analyzes data and reports the results in one instance and in a dynamic manner. 

In principle, having a handful of data from a pilot study, you can write the Introduction and Methods section of a scientifc manuscript in R Markdown language (with a little help from LaTeX), all analysis routines in R code, and by placing references to objects generated by this code (such as a linear model) in the text body of the Results section, you can even write up the whole Results section without even having started to collect the actual data. Once data collection (and possible preprocessing outside of R) is finished, your report will be ready in an instance, and all that remains to be done is the Discussion. 

But even if you are a novice who does not see oneself fit to anticipate all the possible routines one could take during data analysis, you will benefit from R Markdown. 
If you, say, have collected answers to ten variables in a sample of 250 individuals and have performed a correlation analysis only, you will come up with a correlation table with a number of asterisks that denote the level of significance of an individual correlation coefficent. 
You then do a final quality check of the data (you should have done that initially, of course, but sometimes, one forgets ...) and find out that one participant stated *Boba Fett* as gender and *Kauderwelsch* as mother tongue (actually an empirical example, fantasy rarely beats empirical evidence!). 
You need to remove this individual from the analyses, but then every single correlation coefficient will change to some extent. 
Using R for analysis and Word for reporting, you would be required to check every single coefficient in your table and whether the number of asterisks attached to each coefficient is still valid). 
Using R Markdown, you simply update your document, and every coefficient will be the correct one and assigned with the correct number of asterisks.  

We have written a [course/tutorial on how to use R Markdown](https://github.com/alex-strobel/R-Markdown.git). 
While we have tried our best to provide you with our knowledge on R Markdown, we consider us still as novices ourselves. 
So, it may pay to read the R Markdown Guide, and often enough, you may want to refer to the R Markdown Cheat Sheet:

- [R Markdown Guide](https://bookdown.org/yihui/bookdown/)
- [R Markdown Cheat Sheet](https://www.rstudio.com/wp-content/uploads/2015/02/rmarkdown-cheatsheet.pdf)

For psychological research reports, there exists a template that renders your R Markdown document in APA style (so far only available for its 6th edition). 
This template is included in the `papaja` package and you need to install it as described on the author's GitHub site. 
It may also pay to familiarize yourself with the manual.

- [*papaja* Download](https://github.com/crsh/papaja)
- [*papaja* Manual](http://frederikaust.com/papaja_man/)

### Why you should use GitHub

While when using R/RStudio and R Markdown, you are already on a good way, collaborating with others on R projects requires to have some common environment. 
You can set up a group drive, but as outlined above, if something changes on that drive, it may not be easy to keep track of these changes. 
Also, if some change eventually results in a dead end, you may want to go back to a previous point in the "timeline" of your analysis, but it may be not that easy to restore it because you do not know whether all changes since then have to be abandoned or only certain ones. 

Here, version control is really helpful. 
If there was a system that tracked all changes to the files on your project and would easily allow for reviewing what has changed when by whom, this would be of great benefit. 
GitHub allows for such a version control. 
In fact, it has been *made* for it (among other purposes). 

When you create a GitHub project (also called a repository), you create a main branch of your project that is stored both on the GitHub server and locally (just as in nextcloud that is stored on some server, but mirrored locally). 
In GitHub terms, this main branch is called *main*, one could also call it the main "timeline". 
You upload files (or *push*) to that main "timeline". 
This change or alteration is called a *commit*. 
Each *commit* is stored in a file's history and at least needs to be labeled, but can (ideally) also be commented on. 
Others may also alter the "timeline" (in GitHub terms: *commit* to the *main*) and you can download (or *pull*) these changes to your local mirror of your research project, have an overview of the history of all *commits*, their summary and perhaps also comments on the *commits*.

You can compare this process to a collaborative work on a Google Document: 
All team members can edit the document in real time, and every change and comment is visible to all others. 
You may ask what then is the difference to working with GitHub? 
Well, a Google Doc is only one file, but you usually work in a project with multipe files involved. 
GitHub helps you to keep track on changes made to the project *as a whole*.

Also, GitHub offers a unique feature that you cannot have using Google: 
If someone in your team wants to *commit* changes to the *main* "timeline" (e.g., introduce a new analysis routine or change major parts of a research report), one can create a *branch* of the *main*. 
When doing so, there still extists the *main* "timeline", but also an altered "timeline", the *branch*. 
The team member can then *commit* whatever to this alternative "timeline" without changing the *main* timeline. 
Once done, the team member creates a so-called *pull request*: 
All other team members are informed that a change to the *main* "timeline" is suggested, they can review all the changes, comment on them, accept or reject them. 
When eventually a common consensus has been reached on whether and how to change the *main* "timeline" to accept, the new *branch* is merged with the *main*. When later on, this change of the "timeline" end up in a dead end street, one simply restores to earlier versions of the timeline ...

Importantly, all team members work with the same project or repository all the time, they will do so mostly locally on their mirror (or in GitHub terms: *clone* of the project), but every change is then uploaded to the repository and will be available to all collaborators. 
In the example given above under the section "The problem", collaborator A would create a project repository in GitHub with the following folder structure for the primary data:

PrimaryData 
+ QuestionnaireData
+ BehavioralData
+ EDAData

All other collaborators would then have immediate access to all the primary data collected in the project including possible additions or deletiond (e.g., because some participants revoked consent to use their data). 
They would do their preprocessing in another folder with the structure:

PreprocessedData
+ QuestionnaireData
+ BehavioralData
+ EDAData

Any changes to this folder would be recorded in the folders history. 
Also, all analysis scripts referring to this folder would be using the possibly updated data in case one collaborator decides to preprocess the data in a different way (in this case, this collaborator should ideally first create a *branch* to do so). 
Best of all: if you eventually choose to share your data and code openly, other researchers do not have to download single files from you, say, OSF project, but can simply *clone* your GitHub project locally.

### Why you should use the `renv` package

So far, so good. 
But when it comes to what, e.g., Russ Poldrack calls *Computational Reproducibility*, you may face the problem that your collaborators not only use different machines and operating systems, but also different R packages to perform some statistical procedure. 
This may result in different outcomes. 
Not so much with regard to the statistical inference itself, i.e., does a hypothesis have to be rejected, but with regard to the exact numbers, i.e., *p* < .011 vs. *p* < .013 or *BF10* = 3.56 vs. *BF10* = 3.59.
This is because R packages evolve and may introduce refined algorithms for their computations in newer versions or introduce new defaults, whatever.

Here, the `renv` package comes into play: 
It stores the R environment individual researchers were using when analyzing their data together with the data and the code. 
When researcher Z clones a project of researcher A that A has had managed by `renv`, Z will be using the exact R environment that A was using, regardless of whether Z has packages required for reproducing A's analyses at all or has different versions of that packages installed.
This option may even pay in a given workgroup where certain members update their R packages all the time and others do not.  

### Why you should use the `here` package

The `here` package has not been mentioned so far, but it is an important add-on to the collaboration routine suggested here. Say, you are working on a Mac and have your data locally stored in the folder "/Users/ales/R/ProjectX" 
If you then put some file "QuestionnaireData.csv" in a subfolder named "/Data", normally your analysis script located in the subfolder "/Code" would include something like

`df <- read.csv("/Users/alex/R/ProjectX/Data/QuestionnaireData.csv")`

to read the data. When you clone the repository on a machine that runs on Windows, the folder structure would be located at a different place and with a different syntax, say "D:\\Projects\Cloned\ProjectX". You would therefore need to edit the above syntax to 

`df <- read.csv("D:\\Projects\Cloned\ProjectX\Data\QuestionnaireData.csv")` 

or otherwise get an error message that the data cannot be found. With the `here` package, you place a flagging file into the root folder, name it, say "flag_root.txt", and in your analysis script, you write

`here::i_am("flag_root.txt")` 

Based on the location of the flagging file, the `here` package automatically locates the root folder and sets it as working directory. To circumvent the problem that Windows uses backslashes for file paths while Mac uses forward slashes, `here` simply wants to know the directory where the data are located as a first argument and then the file name as a second argument:

`df <- read.csv(here("Data", "data.csv"))`  

And given that you have a more complex subfolder structure, you would simply write, e.g.,   

`df <- read.csv(here("Data", "PrimaryData", "data.csv"))` 

It may be wise to put the project name into the flagging file to make sure that `here` captures the corrects project directory in case you are concurrently working on more than one project with the `here` package, i.e.:

`here::i_am("flag_root_for_ProjectX.txt")` 

## How to use the workflow suggested here

After your will hopefully be convinced to use the solutuons outlines above, you may ask how to do so. Her is how:

### Install R and RStudio

It has alread mentioned above.

### Install Git/GitHub

There seems to exist a difference between Git and GitHub, I guess the former refers to some tool for collaboration and the latter for the platform that uses this tool, but for our purposes, this is not important. For a start, first install Git and then sign up to GitHub.

To install Git, there are several ways to do so.

On Windows ... 
<!-- @Christopph/Josephien: please add instructions -->

On a Mac, the recommended way is as follows:

1. Install [Homebrew](https://brew.sh/index_de) as a general purpose tool to manage missing packages on macOS (this step may take some time, so get yourself another coffee)
2. Install Git from the terminal via the command `brew install git` (this step is quite fast)
3. To check whether it worked,, type `git version` into your terminal, it should return some meaningful info. If not, well, then I do not know what to do ...

Whether on a Windows machine or a Mac, then sign up to GitHub via  

[GitHub](https://github.com)

You have to enter an email address, upon which you will receive a confirmation email. This may take some time. Do not try to create anoteraccount using a secondary email address because it seems that all this takes too long. Make yourself a coffee instead while you wait. When the email has arrived and you finished the process of signing up, you can create a new project (called repository) via clicking the *plus* bottun top right on the GitHub page. You can manage most if not all of your project via the browser, but some tasks (such as adding data to a project) may be easier to implement if you have a local mirror (or *clone*) of your repository. A convenient tool to manage your GitHub projects locally is GitHub Desktop.

[GitHub Desktop](https://desktop.github.com)

GitHub Desktop is - from my experience - not well organized, i.e., you have no immediate access to your folder structure and cannot edit documents right away. Yet, judging from my Mac experience and having the [Sublime text editor](https://www.sublimetext.com) installed, you can open any GitHub project in the editor and edit *ad libitum* and then *push* the changes to update everything on the server. If you have an R project attached to the GitHub repository (for details see below), GitHub Desktop will automatically detect changes made to your R code and will require you to *push* it onto the GitHub server and will also require you to at least label and ideally comment on your *commit*. Unless, your *commit* is labeled, it cannot be *pushed*. This is one great advantage of GitHub over what I outlined initially in the "The Problem" section: You cannot *commit* anything whithout at least give your *commit* a label.













