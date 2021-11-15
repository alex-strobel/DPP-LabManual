# Version control and collaboration using GitHub and the `renv` package

## Background 

Consider yourself in the following situation: 
You are working on a psychological research project that involves collecting questionnaire data, behavioral data such as response times and error rates from an experiment, and physiological data, say, electrodermal activity (EDA).
You are collaborating with two team members. 
Your task is to supervise data collection, to analyze the questionnaire data and to merge it with the behavioral and the psychophysiological data, perform statistical analyses, and write the majority of the research report.
Let us call you collaborator A.
The task of collaborator B is to preprocess the behavioral data, while collaborator C will analyze the EDA data.
Both will be involved in writing the research report, as they will contribute parts of the Methods and Results sections and will revise your first version of the report.
Also, collaborator C will finally try to reproduce your statistical analyses based on the preprocessed data and your analysis code.
This shall ensure that the data and code you want to openly share with the scientific community together with your research report indeed allow for reproduction of your analyses.

After data collection is finished, you share a cloud folder of the data with B and C and analyze the questionnaire data.
One week later, collaborator B sends you a link to another cloud folder where the preprocessed results can be downloaded. 
A couple of days later, collaborator C gives you an USB stick with the preprocessed EDA data.
You merge all data and analyze the data using the R software for statistical computing together with RStudio as frontend.
One month later, you are done with the first draft of the research report. 

In this tutorial you will learn how to use GitHub and the R package `renv` for efficient collaboration on research projects including version control and a stable R environment. This will also allow to enable researchers to reproduce your research results using your data and code even if they use different R and R package versions.
