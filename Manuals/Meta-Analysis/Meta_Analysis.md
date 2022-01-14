# Meta-Analysis

[Alexander Strobel](mailto:alexander.strobel@tu-dresden.de)

This is intended to be a quick guide to perform meta-anaylses using R. For a more elaborated and certainly also more accurate coverage of this topic, I strongly recommend the book on meta-analysis by [Harrer and colleagues (2002)](https://www.routledge.com/Doing-Meta-Analysis-with-R-A-Hands-On-Guide/Harrer-Cuijpers-Furukawa-Ebert/p/book/9780367610074) which can be accessed online here:

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

If you are new to the R environment, you may want to resort to [JASP](https://jasp-stats.org) or [jamovi](https://www.jamovi.org) who both come with meta-analysis modules where using a GUI you can resort to `metafor` functions that do the hard job in the background. This is why below, I will not go into much detail with regard to the `meta` package (the book in linked at the outset of this document uses `meta` though), but will focus on `metafor`.

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

I will quote the two in my opinion central points of this section here, because they contain the essence of the issue:

> "The idea behind the fixed-effect model is that observed effect sizes may vary from study to study, but this is only because of the sampling error. In reality, their true effect sizes are all the same: they are fixed. [...] The random-effects model assumes that there is not only one true effect size but a distribution of true effect sizes. The goal of the random-effects model is therefore not to estimate the one true effect size of all studies, but the mean of the distribution of true effects." (from section 4.1 in Harrer et al., 2002)

As an (albeit not undisputed) rule of thumb, one may use the fixed-effects model when there is no between-study heterogeneity (see below) and the random-effects model otherwise - that is (because between-study heterogeneity will be the case more often than not): always.  

In the following example of a random-effects meta-analysis of correlations, I use the data (and some adapted code) provided with the following paper on the relationship between anxiety measures and the amplitude of the error-related negativity at https://osf.io/8m6a2/:

> Saunders, B. & Inzlicht, M. (2020). Assessing and adjusting for publication bias in the relationship between anxiety and the error-related negativity. *International Journal of Psychophysiology, 155*, 87-98. https://doi.org/10.1016/j.ijpsycho.2020.05.008. 

Many thanks to Blair Saunders and Michael Inzlicht!!! I recommend to go through their paper ([see here for an open access version](https://discovery.dundee.ac.uk/ws/files/49420569/ERNMeta_IJP_revision.pdf)) alongside with the reproduction of their results below. But first let us setup our analyses and then run a meta-analysis using the `metafor` package:

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

Below I shortly introduce several methods for assessing and correcting for publication bias in meta-analysis. An excellent paper on the performance of these and other methods is:

> Carter, E. C., Schönbrodt, F. D., Gervais, W. M., Hilgard, J. (2019). Correcting for bias in psychology: A comparison of meta-analytic methods. *Advances in Methods and Practices in Psychological Science, 2*(2), 115–144. https://doi.org/10.1177%2F2515245919847196

## Funnel plots

```
# apply trim and fill method
Zmeta_tf=trimfill(Zmeta)

# setup plot
par(mfrow = c(1, 3))

# A: basic funnel plot
funnel(Zmeta, xlim = c(-1.2, 1.2), ylim = c(.4,0), las = 1, legend = T)
text(-1.2, -0.05, xpd = T, "A", cex=2)

# B: funnel plot with virtual studies filled by the trim and fill method
funnel(Zmeta_tf, xlim = c(-1.2, 1.2), ylim = c(.4,0), las = 1, legend = T)
text(-1.2, -0.05, xpd = T, "B", cex=2)

# C: contour-enhanced funnel plot
funnel(Zmeta, xlim = c(-1.2, 1.2), ylim = c(.4,0), las = 1, level=c(90, 95, 99), shade=c("white", "gray55", "gray75"), refline=0, legend = TRUE)
text(-1.2, -0.05, xpd = T, "C", cex=2)
par(mfrow = c(1, 1))
``` 

In a funnel plot (see, e.g., [Egger et al., 1997](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC2127453/pdf/9310563.pdf)), the effect sizes of studies entering a meta-analysis is plotted against the corresponding standard errors (see Fig. 1A below). A vertical line indicates the meta-analytically derived effect size at which the plot is centered. The smaller the study, the larger is its standard error. Hence, small studies are located at the bottom of the polot, large studies at the top. Without publication bias, the plot resembles a symmetrical inverted funnel. An asymmetical plot would point to publication bias. As such an assessment is highly subjective, Egger and colleagues developed a regression-based test (see next section). An even more informative way of using a funnel plot for the assessment of publication bias is the so-called *contour-enhanced funnel plot* (Fig. 1C; see [Peters et al., 1997](https://doi.org/10.1016/j.jclinepi.2007.11.010)). This type of funnel plot is not centered at the meta-analytically derived efect size, but at zero (i.e., the effect size under the null hypothesis). Additionally, the plot provides information about regions of significance: all studies in the innermost region (here: white) far from insignificance (*p* > .10), while studies the outermost region are highly significant (*p* < .01). If there are many studies that cluster around conventional significance thresholds and only a few within the innermost region, this would be indicative that insignificant findings have been suppressed.    

![Funnel plots](https://github.com/alex-strobel/DPP-LabManual/blob/main/Images/Manuals/Meta-Analysis/funnel-plots.jpg)

**Figure 1.** Funnel plots as tool to assess publication bias. (A) basic funnel plot centered at the meta-analytically derived efect size (vertical line); (B) funnel plot with virtual studies filled by the trim and fill method; (C) contour-enhanced funnel plot centered at zero 

In the present example, inspection of the funnel plot does not suggest asymmetry, neither for the basic not for the contour-enhanced funnel plot (see Saunders & Inzlicht, 2020)


## Eggers test for funnel plot asymmetry

As said, simply inspecting a funnel plot results in subjective decisions, which is why [Egger and colleagues (1997)](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC2127453/pdf/9310563.pdf) developed a simple regression based test: the effect size is regressed on its standard error, weighted by the effect size’s inverse variance. In `metafor`, Egger's test in its classical form is performed via 

```
Zmeta_egger_lm = regtest(Zmeta, model="lm", predictor="sei")
```

Here the test is significant, *t*(56) = -2.09, *p* = .041. The estimate for the true effect size is the intercept of the fitted regression model, *b* = .046, 95%CI [-0.179, 0.089]. As you can read in the Notes section of the `regtest` help page, this is the same estimate as that obtained using the *precision-effect test* (PET); we will come back to this below. As you also can read in this section, the default of the regtest function is `model = "rma"`, and becuase we have run a random-effects meta-analysis, it seems more appropriate to use this default (just as Saunders and Inzlicht, 2020, did).

```
Zmeta_egger_rma = regtest(Zmeta)
```

In this case, the test is not significant, *z* = -1.72, *p* = 0.085, just as descriptively, we could not see any asymmetry in the funnel plot, and the adjusted effect size is *b* = -0.072, 95% CI [-0.210, 0.076]. So regardless of whether Egger's test in its classical form is performed or in its more appropriate random-effects form, the adjusted estimate of the effect size is far lower than the estimate of the random-effects meta-analysis (&rho; = .19, see above). 

## Trim and Fill

The trim and fill method, developed by [Duvall and Tweedle (2000)](https://doi.org/10.1111/j.0006-341X.2000.00455.x), accounts for and imputes missing studies that make a funnel plot (more) symmetrical (see the white points in Fig. 1B). Based on this procedure, the adjusted effect size can be estimated. To use the authors own words to describe the approach:

> "The trim and fill algorithm is based on a formalization of the qualitative approach using the funnel plot. Simply put, we trim off the asymmetric outlying part of the funnel after estimating how many studies are in the asymmetric part. We then use the symmetric remainder to estimate the true center of the funnel and then replace the trimmed studies and their missing counterparts around the center. The final estimate of the true mean, and also its variance, are then based on the filled funnel plot. (Duvall & Tweedle, 2000, pp.456-457)

```



## Peters test

## PET & PEESE

# Adressing heterogeneity

...

