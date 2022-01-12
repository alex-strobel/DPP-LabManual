# R code for DPP_LM_PublicationBias.pptx --------------------------------------

# Required packages ----
#if (!"psych"    %in% rownames(installed.packages())) install.packages("psych")
#if (!"metafor"  %in% rownames(installed.packages())) install.packages("metafor")
library(psych)    # for correlation analysis and Fisher Z transformation
library(metafor)  # for meta-analysis

# Slides 8-9: simulate population where no effect whatsoever can be assumed ----
set.seed(242)
df = data.frame(matrix(rnorm(10^6), ncol = 5))

# rename random variables randomly into meaningful variables and randomly assign gender  
colnames(df) = c(sample(c("zIntelligence", "zMotivation", "zSocEcStatus", "Gender"), 4, replace = F), "zSchoolGrades")
df[, "Gender"] = as.numeric(df[,"Gender"] > 0)

# no correlation in the population
corr.test(df)

# Now lets see what happens when we draw one draw one small sample and start analyzing ...
dfi = df[sample(1:nrow(df), 50, replace = F),]

pairs(dfi)
corr.test(dfi)

# Ok, Motivation seems to correlate with School Grades, although insignificantly.
# Yet, the scatterplot speaks for a relation, doesn't it?! And it also 
# would make sense,because the higher the Motivation, the better (= lower) 
# the grades ...

summary(lm(zSchoolGrades ~ zMotivation, dfi))

# Well, the relation almost approaches a tendency towards significance ...
# perhaps, there are some outliers that distort the picture

# univariate outliers
bp = boxplot(dfi, boxwex = .1, staplewex = NA, lty = 1, lwd = 1.5, outcol = 2)

# multivariate outliers
outliers <- function(df, threshold = .001) {
  m = psych::mardia(df, plot = FALSE)
  p = 1 - pchisq(m$d ^ 2, df = ncol(df))
  o = which(p < threshold)
  return(list(
    mardia = m,
    D.square = m$d ^ 2,
    p.values = p,
    outliers = o
  ))
}

# remove mutivariate outliers (simply removing univariate outliers wouldn't
# be scientific, would it?!) 
dfi.no.outliers = dfi[-outliers(dfi, threshold = .05)$outliers,] 

# check again for School Grade - Motivation association
summary(lm(zSchoolGrades ~ zMotivation, dfi.no.outliers))

# I knew it!!! But what about intelligence?
summary(lm(zSchoolGrades ~ zMotivation + zIntelligence, dfi.no.outliers)) # additive
summary(lm(zSchoolGrades ~ zMotivation * zIntelligence, dfi.no.outliers)) # interactive

# Ok, the p-value is lowest for the interactive model, and this makes
# perfectly sense, because motivation and aptitude interact and not simply 
# add up ...

# Well, then let's look into the literature ...
# Google Scholar search terms: School grades AND Motivation AND Intelligence
# and here they are, the papers supporting our hypothesis that motivation is most 
# important for success in school!

# Well, let us examine another small sample ...
dfj = df[sample(1:nrow(df), 50, replace = F),]

summary(lm(zSchoolGrades ~ zMotivation, dfj))
# oops ... no relation ...

outlier(dfj)
# ah, there are some outliers again, let's remove them

dfj.no.outliers = dfj[-outliers(dfj, threshold = .05)$outliers,] 

# still no significant result :-( 
summary(lm(zSchoolGrades ~ zMotivation, dfj.no.outliers))

# but hey, it may not as easy than that! Didn't we have evidence for an 
# interactive model?
summary(lm(zSchoolGrades ~ zMotivation * zIntelligence, dfj.no.outliers))

# doen't look impressive, but may gender play a role?
summary(lm(zSchoolGrades ~ zMotivation * zIntelligence * Gender, dfj.no.outliers))

# Ah, that was it, now the main effect of motivation is again there
# How to call it? Marginally significant? Approaching significance?
# And what about this interesting interaction of intelligence and gender?
# We should pursue this in a subsequent study ... or might we have 
# misspecified our model? What about socio-economic status? We need to 
# control for that and add it as a covariate!

summary(lm(zSchoolGrades ~ zMotivation * zIntelligence * Gender + zSocEcStatus, dfj.no.outliers))

# Ok, that's exactly what I expected: Motivation is related to School Grades,
# in this sample not so much as in the previous, but admittedly, it's a small
# sample, I will list this under "limitations". But the most interesting thing is
# that intelligence and gender interact in predicting school grades! Now I
# only need to find out what this actually means, but I am sure that in the 
# literature I will find evidence in favor of whatever I will think that I 
# found out! 

# I hope it is clear that what I did and wrote so far was meant to be ironic:
# You can find a significant result in almost every data set given that you
# flexibly adjust your data analysis (p-hacking) and afterwards look for a 
# justification why what you found could have been expected right from the
# start (HARKing)

# Slides 10-21: Detecting bias ------------------------------------------------

# Note: data taken and code adapted from 
# Saunders, B. & Inzlicht, M. (2020). Int J Psychophysiol, 155, 87-98. doi:10.1016/j.ijpsycho.2020.05.008.
# see: https://osf.io/8m6a2/

# reads original data from 58 studies on the correlation between the error-
# related negativity and anxiety 
AnxO <- read.delim("https://raw.githubusercontent.com/BlairSaunders/AnxietyERN/master/AnxOverall.csv", header = TRUE, sep = ",")

#_Perform meta-analysis ----
# calculates z-scores of correlations (yi) and the corresponding sampling 
# variances (vi) and add to original data
AnxO <- escalc(measure = "ZCOR", ri = AnxO$r, ni = AnxO$n, data = AnxO, slab = id) 

# meta-analysis on z-scores
Zmeta <- rma(yi, vi, data = AnxO) 

# predicts meta-analytic effect size via transforming z to r
Zmeta.predict <- predict(Zmeta, digits = 3, transf = transf.ztor)

# forest plot of the meta-analytic results (cf. Saunders & Inzlicht, 2020, ms. p. 23)
forest(Zmeta, header = T, transf = transf.ztor)

# funnel plot to assess symmetry of effect size estimates
funnel(Zmeta, xlim = c(-1.25,1.25))

#_Egger's test on funnel plot asymmetry ----
# see https://www.bmj.com/content/315/7109/629.full
Eggers <- regtest(Zmeta)
# test does not suggest funnel plot asymmetry

#_Trim and fill method ----
# see https://onlinelibrary.wiley.com/doi/abs/10.1111/j.0006-341X.2000.00455.x?sid=nlm%3Apubmed
Zmeta.tf <- trimfill(Zmeta)
Zmeta.tf.predict <- predict(Zmeta.tf, digits = 3, transf = transf.ztor)

# funnel plot after trim and fill
funnel(Zmeta.tf, xlim = c(-1.25,1.25))
# four virtual studies need to be added to make funnel plot symmetrical
# effect size decreases slightly

#_Peter's test
# see https://jamanetwork.com/journals/jama/fullarticle/202337
Sample <- AnxO$n
Inv.n <- 1 / Sample
effect <- AnxO$yi
Peters.lm <- lm(effect ~ Inv.n, weights = Sample)
Peters.summary <- summary(Peters.lm)
Peters.confint <- confint(Peters.lm)
Peters.r <- fisherz2r(coefficients(Peters.lm)[1])

#_PET analyses ----
PET.lm <- lm(yi ~ sqrt(vi),weights = 1 / vi, data = AnxO)
PET.summary <- summary(PET.lm)
PET.confint <- confint(PET.lm)
PET.r <- fisherz2r(coefficients(PET.lm)[1])

#_PEESE analysis ----
PEESE.lm <- lm(yi ~ vi,weights = 1 / vi, data = AnxO)
PEESE.summary <- summary(PEESE.lm)
PEESE.confint <- confint(PEESE.lm)
PEESE.r <- fisherz2r(coefficients(PEESE.lm)[1])
