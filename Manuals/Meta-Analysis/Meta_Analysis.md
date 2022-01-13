# Meta-Analysis

[Alexander Strobel](mailto:alexander.strobel@tu-dresden.de)

This is intended to be a quick guide to perform meta-anaylses using R. For a more elaborated and certainly also more accurate coverage of this topic, I strongly recommend:

+ [Doing Meta-Analysis with R: A Hands-On Guide](https://bookdown.org/MathiasHarrer/Doing_Meta_Analysis_in_R/)

# Introduction

As with every research project, one tenet of conductiong a meta-analysis is that our procedure of doing so is described as transparently and replicably as possible. I am (by 2022-01-12) rather unexperienced in meta-analysis, but from my reading, the major issues seem to be: 

+ [clearly defined search terms for all eligible databases of interest (e.g., PsycInfo, Web of Knowledge, PubMed, Google Scholar etc.)](#search-terms)
+ further inclusion and exclusion criteria
+ rules for documenting inclusion and exclusion
+ manualized coding schemes for effect sizes and study characteristics
+ choice of the appropriate software tool and analysis specifications for conduction a meta-analysis
+ assessment of potential moderators (i.e., meta-regression)
+ asessment of potential publication bias

# Search terms

Yet, (for me and so far) it seems that for meta-analyses, the transparent and replicable way of conducting them (e.g., via a predefined and more or less sophisticated Boolean search term on *PsycInfo*) leaves one with far fewer eligible studies for inclusion than some idiosyncratic way of browsing through hundreds of papers on *Google Scholar*, going through their abstracts, hopefully also their fulltexts, checking their references, then being reminded of some other study of a colleague where the research focus was different, but the variables in question were assessed, and then being reminded of own studies to which the same applies ...

As an example, I was about to perform a meta-analysis on the relationship of *Need for Cognition* and *Neuroticism*, and I thought this a rather cheap one when it comes to meta-analysis. I spent two or three days on the results of a *Google Scholar* search for the search terms `"Need for Cognition" Neuroticism` which gave me about 4.000 hits. I scanned through the titles, abstracts, and – where possible – full-texts, and after about 110 database entries, I had identified 35 studies and thought that this could'nt be the correct (i.e., replicable) way of doing so. 

I therefore consulted a recent meta-analysis of someone I trusted to do a proper literature search (<!-- add  ref to Buecker et al. -->). Using *PsycInfo*, I entered an - even more elaborate - Boolean search term `(TI "need for cognition" OR AB "need for cognition") AND (AB (neuroticism OR "emotional stability"))`. This resulted in exactly 20 hits (per 2022-01-12). There was some overlap with my *Google Scholar* hit list, but many relavant papers were not found, while a couple of irrelevant papers emerged.

So what to do in this case? One could adjust the search terms, add some restrictions here and some OR operator there.... which is what I did, but either this resulted in even fewer or an astonishingly larger number of records. Every search term combination I applied did not result in having all the 35+ relevant papers shown up in the results in my search.

Well, I trusted my search, as it gave me 35 papers of clear relevance for my research question (plus about two dozens of papers where the relevant variables were assessed, but their bivariate correlations were not reported, so I set them on a list for data requests). But still, my way of searching (and finding) results was by no means transparent or reproducible. Also, I gave up to search any longer after about 110 out of 4000 results. *Google Scholar* per default lists its results by relevance, and between the 90th an 110th result, I encountered a considerable drop in relevant results.

tbc ...

# Software for performing meta-analysis

## `meta` and `metafor`

From my impression, the two most common R packages for meta-analysis are `meta` (Balduzzi, Rücker & Schwarzer, 2019) and `metafor` (Viechtbauer, 2010; see also the [package's web page](https://www.metafor-project.org/doku.php)). `meta` is easier to learn, while `metafor` at first glance seems to be a bit hermetic, so it takes longer to arrive at some level of mastery. Yet, it is more comprehensive (and in fact, `meta` resorts to `metafor` for a number of functions). For details on the commonalities and differences of the packages, see Lortie and Filazzola (2020).

## Further recommendations

If you are new to the R environment, you may want to resort to [JASP](https://jasp-stats.org) or [jamovi](https://www.jamovi.org) who both come with meta-analysis modules where using a GUI you can resort to `metafor` functions that do the hard job in the background. This is why below, I will not go into much detail with regard to the `meta` package, but will focus on `metafor`.

Further free software packages for doing meta-analysis are listed and shortly introduced here:

+ [13 Best Free Meta-Analysis Software To Use](https://toptipbio.com/free-meta-analysis-software/)

## Software References

+ Balduzzi, S., Rücker, G., & Schwarzer, G. (2019). How to perform a meta-analysis with R: a practical
  tutorial. *Evidence-Based Mental Health, 22*, 153-160. https://doi.org/10.1136/ebmental-2019-300117
+ Lortie, C. J. & Filazzola, A. (2020). A contrast of meta and metafor packages for meta-analyses in R.  
  *Ecology and Evolution, 10*, 10916–10921. https://doi.org/10.1002/ece3.6747 
+ Viechtbauer, W. (2010). Conducting meta-analyses in R with the metafor package. Journal of
  Statistical Software, 36(3), 1-48. https://doi.org/10.18637/jss.v036.i03


# Fixed- vs. Random-Effects Meta-Analysis

...

In the following example, I use the data (and some adapted code) provided with the following paper on the relationship between axiety measures and the amplitude of the error-related negativity:

> Saunders, B. & Inzlicht, M. (2020). Assessing and adjusting for publication bias in the relationship between anxiety and the error-related negativity. *International Journal of Psychophysiology, 155*, 87-98. https://doi.org/10.1016/j.ijpsycho.2020.05.008.

on the respective OSF project website:

> https://osf.io/8m6a2/

Many thanks to Blair Saunders and Michael Inzlicht!!!

Let us first setup our analyses and then run a meta-analysis using the `metafor` package:

```
# required packages ----
library(metafor)   # for meta analysis
library(DescTools) # for Fisher Z transformation of correlations

# load data ----
AnxOverall <- read.delim("https://raw.githubusercontent.com/BlairSaunders/AnxietyERN/master/AnxOverall.csv", header=TRUE, sep = ",")

# run meta-analysis ----

# transform correlations to Z scores
Zscores <- escalc(measure = "ZCOR", ri = AnxOverall$r, ni = AnxOverall$n, data = AnxOverall) 

# now run meta-analysis
Zmeta <- rma(yi, vi, data = Zscores, slab = AnxOverall$id) 

# get back-transformed effect size estimate and 95% CI 
Zmeta.predict <- predict(Zmeta, digits = 4, transf = transf.ztor)

# get confidence intervals for heterogeneity measures
Zmeta.confint <- confint(Zmeta)
```
The above code gives the random-effects meta-analysis result of the association between anxiety measures and the amplitude of the error-related negativity, &rho; = -.19, 95% CI [-.24, -.14]. This result may be inaccurate due to possible publication bias, so we need to assess possible publication bias and try to correct for it. Apart from that, there is evidence for heterogeneity across samples, because *Q*(57) = 121.63, *p* < .001. This needs to be adressed as well via, e.g., meta-regression (see below). But first things first. 

# Assessing publication bias 

## Funnel plot

## Eggers test for funnel plot asymmetry

## Trim and Fill

## Peters test

## PET & PEESE

# Adressing heterogeneity

...

