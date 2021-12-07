# Version control and collaboration using GitHub and the `renv` package

[Alexander Strobel](mailto:alexander.strobel@tu-dresden.de)<br>
Faculty of Psychology<br>
TU Dresden

Credits go to<br>
Philippe Jawinski (HU Berlin)<br>
Christoph Scheffel and Josephine Zerna (TU Dresden)

---

**Please note!**

This is the short version (approx. 3200 Words, reading time 10-15 min unless you are trying out what is described here in parallel) of the description on how to use GitHub and the `renv` package cor collaboratively working on R projects. 
For readers that might not be familiar with certain topics covered, it refers to other pages such as Wiki entries. 
If you are relatively new to R and R Studio, R Markdown and GitHub, it might be better to read the [long version](https://github.com/alex-strobel/DPP-LabManual/blob/main/Manuals/GitHub_and_renv/GitHub_and_renv_long.md) (approx. 5500 words, reading time 20-30 min unless trying out things).

---

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
You then discover that while you used the most recent behavioral data, you accidentally gave collaborator D the data as preprocessed initially.

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

You of course need to be familiar with *R* and *RStudio* and ideally also with *R Markdown*. Also, having *Git* and *GitHub Desktop* already installed and having signed up to GitHub will speed up the setup process for creating and collaboratively working in a reproducible environment. Also, it may help to have some general idea of what the R packages `renv` and `here` are good for. 

If you aren't (that) familiar with these tools, it is recommended to read these Wiki entries (and perhaps also the documents linked there):

- [R and RStudio](https://github.com/alex-strobel/DPP-LabManual/wiki/R-and-RStudio)
- [R Markdown](https://github.com/alex-strobel/DPP-LabManual/wiki/R-Markdown)
- [GitHub](https://github.com/alex-strobel/DPP-LabManual/wiki/GitHub)
- [R package renv](https://github.com/alex-strobel/DPP-LabManual/wiki/R-package-renv)
- [R package here](https://github.com/alex-strobel/DPP-LabManual/wiki/R-package-here)

## How to use the workflow suggested here


### Install R and RStudio

To do so, go to the following pages:

- [The R Project for Statistical Computing](https://www.r-project.org)
- [RStudio](https://www.rstudio.com/products/rstudio/download/) 

### Install Git

Install Git and GitHub Desktop and sign up to GitHub as described on the respective Wiki page.

- [GitHub](https://github.com/alex-strobel/DPP-LabManual/wiki/GitHub)

### Integrate Git in RStudio

Given that Git is installed, you need to link it to RStudio. 
Open RStudio and go to `Tools > Global Options`. 
Navigate to `Git/SVN`, check `Enable version control interface for RStudio projects` and paste the path to your Git executable in the corresponding field, then click `OK`. (On a Mac, the Git executable will most likely be located at `usr/bin/git`, under Windows, it will be located in the path you installed Git to.)  

### Create new R project using Git and `renv`  

There are several ways to do so, the one that works best for me is described below:

1. In RStudio, go to `File > New Project...`, then choose `New Directory > New Project`.
Select `Create a Git repository` and `use renv with this project`. 
Enter a directory name (this will also be the name of your repository on GitHub) and you may also want to provide a path where to create your project as subdirectory of. 
Then hit `Create Project`.

2. Take some time to notice that at the RStudio console, after the usual startup messsage, you should read something like<br> ` Project '~/Documents/R/My-Project' loaded. [renv 0.14.0]` and that under the `Packages` tab, you now find a separation into `Project Library` (that for now should contain the `renv`package only) and `System Library` (with only the base installation that R comes with and all of your favorite packages seemingly gone). 
This means that everything worked as it should and you are ready to ... 

3. Install the project-specific packages, e.g. `psych`, either via `Tools > Install Packages...` or from the editor/console via `install.packages("psych")`.
The echo on the console will look a bit different like the one you would normally expect when you install a package, and if you read `OK [linked cache]`, this means everything worked well:
the newly installed packages are attached to the `Project Library`. 
You will also find folders for these packages under the `Files` tab in the `renv/library` folder.

4. As so far, your project isn't on GitHub yet, add it via GitHub Desktop by clicking on `Current Repository` (top left), click `Add` and then `Add Existing Repository...` and select the repository you created under 1.
Click on the project in the left pane, then on `Publish repository` at the top of the GitHub Desktop window.
Add a short description of your project and unselect `Keep this code private` (the default) if you want your project to be immediately accessible to everyone else on GitHub.
You normally do not want that, and you can still invite collaborators later on even if you keep your project private for now. 
Click `Publish repository` upon which you may be asked for your GitHub user name and password. 
After a few seconds, the project has been *pushed* to the GitHub server and you can see it in your browser as well.
It is recommended to add a README file to your project as GitHub will suggest below the files list of your project.
You can describe your project shortly or in detail using Markdown syntax.

5. As said, in principle, you should be able to *pull* from and *push* to your project directly via RStudio (see the `Git` tab in the top right pane of RStudio).
Yet, as also said, this may require you to have a *personal access token*, and this is something that I haven't done yet.
So, meanwhile, *pull* from and *push* to your project via GitHub Desktop.
Anytime something changes in your project (e.g., you create a first script and save it in the project root), GitHub Desktop will automatically detect that change together with all other changes you may have made outside of RStudio (e.g., you created a subfolder `Data`), list them in the left pane, and will require you to label these changes aka *commits* (if you change only one thing at a time, GitHub Desktop sometimes will come up with a suggestion how to label the *commit*).
After clicking `Commit to master` at the bottom of the left pane, hit `Push origin` in the right pane, and you are done and can see the changes made on the server, i.e., via your browser (wait, you cannot see the folder you created ... this is because they are not visible as long as they are empty. So to make them visible, you can simply put an empty file in it).

6. It is highly recommended to commit every change made separately so that the commit is labeled appropriately.
So if you, e.g., make a change in a script: commit it and label it "Update My-Script.R" (in fact, GitHub Desktop will suggest exactly this label).
You put some data in a newly created folder: commit it and label it.
If commit both things at once before committing them, it may be hard to find an appropriate label because the label will be attached to both the script and the folder.

### Install and setup the `here` package

Simply install the `here` package via `install.packages("here")`. 
Then place a file named "flag_root_for_My-Project.txt" in the root directory of your project. 
Then create a folder called `Data` and put some data in it, say, a file named "df.csv". 
Also, create a folder called `Code` and save an R script in it with the following commands:
```
library(here)                           # loads here package
i_am("flag_root_for_My-Project.txt")    # locates the root folder
df <- read.csv(here("Data", "df.csv"))  # reads data from folder in that root
```
Execute that code, and the data will be loaded.
If you now would move your directory to somewhere else, it would still work.
And if someone else clones your project, it will work as well, and that is exactly what we use the `here` package for. 
It is important that you put a flag file to be found by the `i_am` function into every single R script where you reference to project files.
It is even more important to have unique names for the flag files in every single repository, which you can easily achieve by putting the project name into the flag file name.

### Collaboratively work on projects

So, once you are done with the steps above, invite collaborators to work together with you on the project. In the example given in the outset of this tutorial, collaborator A would create a project folder structure for the primary data:

PrimaryData<br>
+ QuestionnaireData
+ BehavioralData
+ EDAData

A would then add collaborators C to E as collaborators and would do so in the browser via the `Settings` tab on top of the project and via choosing `Manage access` (potential collaborators of course need to have a GitHub account as well).
All other collaborators would then have immediate access to all the primary data collected in the project including possible additions or deletions (e.g., because some participants revoked consent to use their data). 
Collaborator A would then assign tasks to the collaborators, e.g., via the `Issues` tab on top of the project or define steps of a project's workflow via `Projects` and make some of the steps `Issues` that can then be assigned to collaborators. 
For example, A would upload the raw data to the project, would assign the task "Preprocess behavioral data" to B and "Preprocess EDA data" to C. 
They would do their preprocessing in another folder with the structure:

PreprocessedData<br>
+ QuestionnaireData
+ BehavioralData
+ EDAData

Any changes to this folder would be recorded in the folder's history. 
Also, all analysis scripts referring to this folder would be using the possibly updated data in case one collaborator decides to preprocess the data in a different way (in this case, this collaborator should ideally first create a *branch* of the projects *main* "timeline" to do so). 
A would then analyze the data, committing all code to the project including the manuscript as R Markdown file. 
For details on using R Markdown, see:        

- https://github.com/alex-strobel/R-Markdown.git

When A is done and wants to have feedback on the manuscript draft from the collaborators, it is recommended to create branches of the *main* "timeline" for each collaborator.     
As said, a branch is a copy of the whole project and is great for working on a project as a team:
You can try out ideas in your branch, or comment texts, without affecting the *main* "timeline".
After all comments have been edited, you can merge your branch into the *main*.
Once merged, pull requests preserve a record of the historical changes of your code.
More detailed information on branching can be found here: 

- https://guides.github.com/introduction/flow/

After all collaborators are done with their revision and comments, a pull request is created to merge the edits of the seperate branch to the main branch.
Collaborator A can now see all changes and comments in the commit log, implement them and respond comments. 
Then, the branches are merged with the *main*, creating an updated and agreed upon version of the project's "timeline".

Best of all: If you eventually choose to share your data and code openly, other researchers do not have to download single files from your, say, OSF project, but can simply *clone* your GitHub project as a whole,  store it locally and can try to reproduce your results (or of course use your data and code otherwise).

Finally, here are some suggestions for facilitating collaborative writing:

1. In your R Markdown file, use a new line for each sentence. 
Otherwise, GitHub will mark the whole paragraph although a collaborator only changed one sentence, because all sentences were in the same line.
2. As said: Work with small commits! For every change or comment you make, commit the change. 
3. If you just corrected a typo, your commit can be labeled as "Update Manuscript.Rmd" without any comment. 
If you however rewrote a sentence and want to elaborate on why you did so, add a comment to your commit.
If you just want to add a comment without changing anything, you still need to change something (e.g., simply overwrite the period at the end of the sentence or paragraph with a period), so you will have the opportunity to comment of that sentence or paragraph. 
If you do all your changes and pull the whole file at the end, it gets very chaotic.
4. Everything gets a lot easier if you split your manuscript into several _.Rmd_ files. 
It is recommended using an own *.Rmd* file for each section.
This may not be possible using the `papaja` package, but for other R Markdown projects this option should work well. You simply add code chunks that "import" the different R Markdown files such as 

``` 
{r child = "Introduction.Rmd"}
```

and so on for Methods, Results, and Discussion.

## Final remark

It is recommended that you exercise what you have just learnt right now. Assuming, you have already installed R and RStudio ...
- Sign up to GitHub and install Git and GitHub Desktop right now. 
- Create a new project called "My-Project" as Git repository and use the `renv` package.
- Add the project to your GitHub account using GitHub Desktop.
- Place a flagging file in the root folder of your project.
- Add two folders `Data` and `Code` to your project.
- Place some data in the `Data` folder.
- Save an R script in the `Code` folder and use the code [above](#Install-and-setup-the-here-package) to resort to the `here` package.
- Invite a collaborator via `Settings` and `Manage access` 
- Have the collaborator clone the repository and check whether it worked.
- Initialize a R Markdown script and try out branching and merging.
- And don't forget to *commit* every change, label and (if necessary) comment on it.


**And then keep on *pushing* and *pulling*!**

