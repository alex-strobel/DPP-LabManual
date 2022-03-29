# Preprocessing and Data Merging

## Basic workflow

It is recommended that for all data that do not need to be preprocessed using other software than R, we provide the raw data along with our R scripts to preprocess them. If this preprocessing isn't that time-consuming, data may be preprocessed directly within an R code chunk of an R Markdown manuscript. Yet, often enough, even R-based preprocesing may take some while, which renders it inconvenient to have such preprocessing steps integrated directly into an R Markdown file. In such cases, write an R script, preprocess the data, save them as an *.RData file and load this file into an R Markdown file for reporting of results.

## Workflow if using external software

If you need to preprocess your data using other software than R, you need to

- save your preprocessing results in a format readable for R, ideally a \*.csv file, but a MATLAB \*.mat file will also be suitable, because there are packages that can read \*.mat files into R. Same is true for SPSS files and other common file formats.
- carefully document your preprocessing steps in a file format that is accessible for all possible users such as a text or a markdown file. You may - and indeed *should* – provide, e.g., a BrainVision Analyzer History Template file together with your data for those who happen to have a licence for the BrainVision Analyzer, but this file format is not readable if you do not have such a licence. Therefore, it is of utmost importance to document your preprocessing steps in a universally readable format.

## Merging data

It is absolutely essential to have a common participant identifyier for all your data. If using ORSEE together with REDCap, this will be ensured, but if (for some reason or another) you did not resort to ORSEE and REDCap, it may be really difficult to merge data from several surce - survey data, experimental data, physiological data etc. - if you do not have a common identifier. Such confusion can happen if you assigned numbers to participants of a survey according to the time when they filled in the survey, e.g., `id001` to `id256`, but then invited those participants to a lab session and then again assigned numbers according to the time they took part in the lab session. In such cases, `id001` of the survey may not be `id001` of the lab session, so consecutively numbering participants may not be a good idea if you use distinct data acquisition platforms. Rather, use a unique identifier for all participants. As said, ORSEE and REDCap will make sure that you do, but otherwiese, you may want to resort to some participant code ...

---

[**Table of Contents**](#README.md) | [back to **Cata Collection**](10_Data_collection.md) | [next to **Data Analysis**](12_Data_analysis.md)

