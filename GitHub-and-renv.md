# Version control and collaboration using GitHub and the `renv` package

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
You put all the data on your hard drive, merge all data and analyze the data using the R software for statistical computing together with RStudio as frontend.
You write your report in R Markdown to have an easily to be updated manuscript in case your co-authors have suggestions how to improve the analysis pipeline.  
Again a few days later, B sends and email late in the evening and notes that there was an error in the preprocessing script for the behavioral data and that the correctly preprocessed data are to be found in a new cloud folder.   
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
- Even after all this mess has been cleaned up and all analysis code runs with the correct files, collaborator C still cannot reproduce your multilevel modeling results. It turns out that C uses a newer `lme4` package version than you did.    

It is clear that such a situation not only demands for a coherent research data management system where all data and code is stored and updated in a traceable manner. This system should also make collaboration as effective and efficient as possible by having version control and the necessity to comment on changes built right into the system. Finally, the system should allow for having a common R environment for all analyses, even when individual collaborators either do not have certain packages installed or use other package versions. Ah, and it would be great if all authors could revise and comment your R Markdown file directly ...

## One solution

In this tutorial you will learn how to use GitHub and the R package `renv` for efficient collaboration on research projects including version control and a common R environment. This will also allow to enable researchers to reproduce your research results using your data and code even if they use different R and R package versions. Yet, this is only one solution, and most likely not the best. While the `renv` package enables one to have a common R environment, it does not ensure that all analyses are carried out as if they were run on the same machine and the same operating system. For this purpose, a solution involving the `docker`approach would perhaps be superior. But for now, collaborating via GitHub and using R and RStudio together with the `renv` package will provide a major improvement.


