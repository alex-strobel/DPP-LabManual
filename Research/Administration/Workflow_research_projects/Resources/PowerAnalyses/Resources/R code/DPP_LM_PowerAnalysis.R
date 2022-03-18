# R code for LM_DPP_PowerAnalyses.pptx ---------------------------------------- 

# required packages and functions/global settings ----

# pwr package for power calculations
#if (!"pwr"  %in% rownames(installed.packages())) install.packages("pwr")
library(pwr)

# psych package for correlation tests
#if (!"psych"  %in% rownames(installed.packages())) install.packages("psych")
library(psych)

# function for generating correlated variables
randcorr <- function(rho, nobs, nvars, precision = 0, matrix.found = F) {
  
  # This function returns a matrix of N rows (equaling the number of nobs) by P colums
  # (equaling the number of nvars) that fulfil the requirement to be correlated as
  # specified by the numeric value or matrix rho. If rho is a numeric value, all
  # variables will correlate with r = rho. If rho is a symmetric correlation matrix
  # (with 1 in the diagonal), the intercorrelations of the variables generated will
  # reproduce rho to a precison of 0 (default) as a rough approximation using only one
  # generation cycle or 1 (approximation to .x), 2 (.xx), and so on (with increasing, but
  # generally negligible time to find a respective solution). The number of cycles needed
  # to find a matrix fulfilling the requirements is returned via matrix.found=T.
  
  compare <- function(x, y, prec = 2) {
    X = round(x, prec)
    Y = round(y, prec)
    return(X == Y)
  }
  
  if (dim(as.data.frame(rho))[1] == 1) {
    C = matrix(rho, nvars, nvars)
    
    for (i in 1:nvars) {
      C[i, i] = 1
    }
  } else {
    C = rho
  }
  
  A = chol(C)
  
  i = 1
  
  
  if (precision == 0) {
    W = rnorm(nobs * nvars, 0, 1)
    dim(W) = c(nobs, nvars)
    y = W %*% A
  } else {
    k = 1
    
    while (k == 1) {
      W = rnorm(nobs * nvars, 0, 1)
      dim(W) = c(nobs, nvars)
      y = W %*% A
      D = cor(y)
      
      c = compare(round(C, precision), round(D, precision), prec = precision)
      if (all(c) == T) {
        k = 0
        
      }
      i = i + 1
    }
  }
  if (matrix.found == T) {
    print(paste("matrix found in ", i, " steps.", sep = ""))
  }
  
  return(data.frame(y))
  
}

# set seed for reproducible analyses
set.seed(1)

# Slide 3: Key terms ----

# generate population of N = 1.000.000 where effect size rho = .2
df = randcorr(.2, 10^6, 2, precision = 3)

# get adequate sample size to detect correlation with 80% power
pwr2detect.20 = ceiling(pwr.r.test(r = .2, power = .80)$n)

# draw 1000 random samples of adequate (N = 194) and too small (N = 100) size 
p.100 = p.194 = NULL
for (i in 1:1000) {
  dfi   = df[sample(1:10^6, 194, replace = F),]
  p.194 = c(p.194, corr.test(dfi)$ci$p)
  p.100 = c(p.100, corr.test(dfi[1:100,])$ci$p)
}

# get p-value counts via histograms
h.100 = hist(p.100, breaks = 20, plot = F)
h.194 = hist(p.194, breaks = 20, plot = F)

# plot empty frame
par(mar = c(5, 5, 5, 5))
plot(c(0, 1000), c(0,1), type = "n", xaxt = "n", xlab = "Proportion", ylab = expression(italic(P)~"-values"), las = 1)
axis(1, at = axTicks(1), labels = axTicks(1)/1000)

# power for too small sample
for (i in 1:length(h.100$breaks)) {
  rect(0, h.100$breaks[i] + .025, h.100$counts[i], h.100$breaks[i], col = grey(.6))
}

# add significance and power thresholds
abline(h = .05, v = 800, col = 2)
axis(3, at = 800, expression(1 - beta == '.80'), col.tick = 2, col.axis = 2)
axis(4, at = .05, expression(alpha == '.05'), col.tick = 2, col.axis = 2, las = 1)


# power for adequately sized sample
for (i in 1:length(h.194$breaks)) {
  rect(0, h.194$breaks[i] + .025, h.194$counts[i], h.194$breaks[i] + .05, col = grey(.9))
}

# add legend
legend("top", bty = "n", inset = .01, title = "Sample size", legend = c(expression(italic(N) == 100), expression(italic(N) == 194)), pch = 22, pt.bg = c(grey(.6),grey(.9)), pt.cex = 2) 


# Slide 9: Barplot of sample sizes at different levels of power ----

pwr.level = c(.80, .90, .95, .99)

n.needed = NULL
for (i in 1:length(pwr.level)) {
  n.needed = c(n.needed, ceiling(pwr.r.test(r = .42, power = pwr.level[i])$n))
}

b = barplot(n.needed, ylim = c(0, 100), las = 1, xlab = "Power", ylab = "Sample size")
axis(1, at = b, sub("0.",".",format(round(pwr.level, 2), nsmall = 2)), tick = F)
text(b, n.needed, n.needed, pos = 3, offset = 1)


# Slide 21: Power for different sample and effect sizes ----

ss = c(50, 150, 500, 1500)         # sample sizes
es = seq(.1, .5, length.out = 101) # effect sizes

pwr.report = NULL
for (i in 1:length(es)) {
  pwr.report = rbind(pwr.report, round(pwr.r.test(n = ss, r = es[i], sig.level = .05)$power, 3))
}
colnames(pwr.report) = paste0('N', ss)
rownames(pwr.report) = paste0('r', sub('0.', '.', format(round(es, 3), nsmall = 3)))

# plot power curves for different effect and sample sizes
par(mar = c(5, 5, 5, 5))
plot(range(es), c(0, 1), type = "n", xlab = "Effect Size (Correlations)", ylab = "Power", las = 1)
lines(es, pwr.report[, 1], lwd = 1.5, col = '#993333')
lines(es, pwr.report[, 2], lwd = 1.5, col = '#339933')
lines(es, pwr.report[, 3], lwd = 1.5, col = '#333399')
lines(es, pwr.report[, 4], lwd = 1.5, col = '#999999')
abline(h = c(.8, .9, .95), lty = 5)
axis(4, at = c(.8, .9, .95), las = 1)
abline(v = c(.1, .2, .3), lty = 5)
mtext(c('small', 'medium', 'large'), at = c(.15, .25, .4), side = 3, line = 1)
mtext("Effect Size Classification", at = .3, side = 3, line = 3)
legend(.4, .1, xjust = .5, yjust = .5, bty = "n", inset = .05, lwd = 1.5, col = c('#993333', '#339933', '#333399', '#999999'), legend = ss, title = "Sample Size")
par(mar = c(5, 4, 4, 1))

# Slide 23: Evolution of a correlation as the sample comes in ----

corr.evol <- function(x, y, method = "Pearson", start = 10, step = 1, corridor = "ci", boot = F, boot.R = 1000L, power = F, plot = T, lwd = 1.5,  ylim = c(-1, 1)) {
  
  # x and y   = correlated variables  
  # method    = correlation method (Pearson, Spearman, Kendall), needs to be provided with uppercase first letter
  # start     = sample size at which to start
  # step      = increment in sample size
  # corridor  = corridor of stability, per default 95% CI of final correlation 
  # boot      = evolution of correlations for bootstrap samples?
  # boot.R    = how many bootstrap samples? 
  # power     = should power at point of stability be reported?
  # plot      = should the result be plotted?
  # lwd, ylim = graphical parameters for plot
  
  # final corelation and its 95% CI
  r = psych::corr.test(data.frame(x, y), method = tolower(method))
  
  # determine corridor of stability 
  if (corridor == "ci") {
    lwr = r$ci$lower
    upr = r$ci$upper
    ci.lab = "Corridor of Stability is 95% CI of Final Correlation"
  } else if (corridor == "se") {
    lwr = r$ci$r - r$se[1, 2]
    upr = r$ci$r + r$se[1, 2]
    ci.lab = paste("Corridor of Stability is Final Correlation \U00B1 SE of r", sep = "")
  } else {
    lwr = r$ci$r - corridor
    upr = r$ci$r + corridor
    ci.lab = paste("Corridor of Stability is Final Correlation \U00B1 ", round(corridor, 3), sep = "")
  }
  # initial result from corr.test will be overwritten, because it is not used anymore
  r = r$ci$r 
  
  # r together with ci
  r.ci = data.frame(lwr, r, upr) 
  
  # evolving sample sizes
  n = seq(start, length(x), by = step)
  
  # compute evolution of correlations
  r.evol = NULL
  for (i in n) {
    r.evol = c(r.evol, cor(x[1:i], y[1:i], method = tolower(method)))
  }
  
  # get point of stability (POS)
  ex.corridor = (r.evol <= lwr | r.evol >= upr)
  if (length(which(ex.corridor)) > 0) {
    POS = n[max(which(ex.corridor))] + 1
  } else {
    POS = start
  }
  
  # power to detect correlation at final sample size and at POS if requested, NULL otherwise
  PWR = NULL
  if (power == T) {
    require(pwr)
    PWR = data.frame(final = pwr.r.test(n = length(x), r = r)$power, `@POS` = pwr.r.test(n = POS, r = r)$power)
  }
  
  # evolution of correlations for bootstrap samples if requested, NULL otherwise
  pb <- txtProgressBar(min = 1L, max = boot.R, style = 3)
  r.evol.boot = POS.boot = NULL
  if (boot == T) {
    set.seed(242)
    for (i in 1L:boot.R) {
      s = sample(1:length(x), length(x), replace = F)
      xs = x[s]
      ys = y[s]
      r.evol.tmp = NULL
      for (j in n) {
        r.evol.tmp = c(r.evol.tmp, cor(xs[1:j], ys[1:j], method = tolower(method)))
      }
      r.evol.boot = rbind(r.evol.boot, r.evol.tmp)
      
      ex.corridor.tmp = (r.evol.tmp <= lwr | r.evol.tmp >= upr)
      if (length(which(ex.corridor.tmp)) > 0) {
        POS.tmp = n[max(which(ex.corridor.tmp))] + 1
        POS.boot = c(POS.boot, POS.tmp)
      } else {
        POS.boot = c(POS.boot, start)
      }
      setTxtProgressBar(pb, i)
    }
    close(pb)
  }
  
  # plot results if requested
  if (plot == T) {
    par(mar = c(5, 4, 4, 5))
    plot(n, r.evol, type = "n", xlab = "Sample Size", ylab = paste(method, "Correlation"), main = ci.lab, xlim = c(0, length(x)), ylim = ylim, las = 1)
    if (boot == T) {
      boot.ci = apply(r.evol.boot, 2, quantile, c(.025, .975))
      polygon(c(start:length(x), length(x):start), c(boot.ci[1, ], rev(boot.ci[2, ])), border = NA, col = grey(.9))
    }
    abline(h = r.ci, col = 2, lty = c(3, 1, 3))
    abline(v = POS, lty = 5)
    if (method == "Pearson") {
      axis(4, at = r, labels = bquote(italic(r) == .(round(r, 2))), las = 1)
    } else if (method == "Spearman") {
      axis(4, at = r, labels = bquote(italic(r[s]) == .(round(r, 2))), las = 1)
    }
    lines(n, r.evol, lwd = lwd)
    rect(POS - 10, max(axTicks(2)) - .04, POS + 10, max(axTicks(2)) + .04, border = NA, col = 0)
    text(POS, max(axTicks(2)), bquote(POS[emp] == .(POS)))
    if (boot == T) {
      POS.boot.ci = apply(r.evol.boot, 2, quantile, c(.025, .975))
      ex.corridor.lwr = (POS.boot.ci[1, ] <= lwr | POS.boot.ci[1, ] >= upr)
      if (length(which(ex.corridor.lwr)) > 0) {
        POS.boot.lwr = n[max(which(ex.corridor.lwr))] + 1
      } else {
        POS.boot.lwr = start
      }
      ex.corridor.upr = (POS.boot.ci[2, ] <= lwr | POS.boot.ci[2, ] >= upr)
      if (length(which(ex.corridor.upr)) > 0) {
        POS.boot.upr = n[max(which(ex.corridor.upr))] + 1
      } else {
        POS.boot.upr = start
      }
      POS.boot = c(POS.boot.lwr, POS.boot.upr)[which.max(c(POS.boot.lwr, POS.boot.upr))]
      abline(v = POS.boot, lty = 5, col = grey(.6))
      rect(POS.boot - 10, max(axTicks(2)) - .04, POS.boot + 10, max(axTicks(2)) + .04, border = NA, col = 0)
      text(POS.boot, max(axTicks(2)), bquote(POS[boot] == .(POS.boot)), col = grey(.6))
    }
    if (power == T) {
      text(mean(c(POS, par("usr")[2])), min(axTicks(2)), paste("Power at POS is ", round(PWR[2], 2), sep = ""))
    }
    box()
    par(mar = c(5, 4, 4, 2))
  }
  
  invisible(list(evolution = r.evol, r = data.frame(lwr, r, upr), POS = POS, PWR = PWR, evolution.boot = r.evol.boot, POS.boot = POS.boot))
  
}

# simulate data
set.seed(2)
df.30 = randcorr(.3, 256, 2, precision = 3)
corr.xy = corr.test(df.30)$ci

# plot evolution of correlations
corr.evol(df.30$X1, df.30$X2, plot = T, boot = T)


# Slide 24: Power determination via simulations ---- 

# simulate data
tau = .2
df.tau = randcorr(tau / 2 * 3.125, 10000, 2, precision = 3)
cor(df.tau, method = 'kendall')

# for given sample sizes, draw 1000 samples each and get p-value of Kendall's tau 
n.init = seq(100, 250, by = 5)
pwr.tau = NULL
pb   <- txtProgressBar(1, length(n.init), style = 3)
for (i in 1:length(n.init)) {
  setTxtProgressBar(pb, i)
  pwr.tau.tmp = NULL
  for (j in 1:1000) {
    pwr.tau.tmp = c(pwr.tau.tmp, corr.test(df.tau[sample(1:nrow(df.tau), n.init[i], replace = T), ], method = "kendall")$ci$p)
  }    
  pwr.tau = cbind(pwr.tau, pwr.tau.tmp)
}      
close(pb)
colnames(pwr.tau) = n.init

# get proportions of significant p-values for each sample size
colProp <- function(x) { sum(x < .05) / length(x) }
props = apply(pwr.tau,2, colProp)

# plot proportions
plot(n.init, props, type = 'l', col = 8, las = 1, xlab = "Sample Size", ylab = "Power", ylim = c(.5, 1))

# LOESS fit over proportions
loess.props = loess(props ~ n.init)
lines(n.init, loess.props$fitted, col = 2, lwd = 2)

# finalize plot
abline(h = c(.80, .90, .95), lty = 5)

n.needed = c(n.init[min(which(loess.props$fitted > .80))],
             n.init[min(which(loess.props$fitted > .90))],
             n.init[min(which(loess.props$fitted > .95))])

abline(v = n.needed, lty = 5, col = 2)
axis(3, at = n.needed, col.tick = 2, col.axis = 2)


# Slide 25: Bayesian power analysis ----

# Figure taken from https://doi.org/10.1111/jopy.12639


# Exercises -------------------------------------------------------------------

# 1) What if the paper you want to follow up on does not report effect sizes? ----

# Try to find out how to convert the reported information/statistics into an 
# effect size (helpful resource for t-tests and ANOVAs: Lakens, 2013; helpful 
# R package: effectsize)!

# load effectsize package
#if (!"effectsize" %in% rownames(installed.packages())) install.packages("effectsize")
library(effectsize)

# simulate data
set.seed(2)
x = rnorm(32)
y = x - 1 + rnorm(32)

# between-groups t-test
t.test.xy = t.test(x, y)

# calculate Cohen's d by hand
d = (mean(x) - mean(y)) / sqrt((var(x) + var(y))/2) 

# calulate Cohen's d using effectsize package
effectsize.d = cohens_d(x, y)
effectsize.d$Cohens_d

# if, e.g., in a paper on the difference between x and y, only the t-value
# and the degrees of freedom were given, one could calculate Cohen's d this way:

d.from.t = t_to_d(t = t.test.xy$statistic, df_error = t.test.xy$parameter)
# note the slight difference from the direct calculation, practically this does 
# not change much when it comes to power calculations:

# sample size when using directly calculated d
pwr.t.test(d = d, power = .8)

# sample size when using d calculated from t-value
pwr.t.test(d = d.from.t$d, power = .8)

# you should oversample by 10-20 percent of the calculated sample size anyway 
# so you are safe when it comes to data loss, possible exclusions etc.

# 2) What to do with an empirical result that relies on a small sample? ----

# In a paper, a sample of N = 30 was examined, split into two groups and a 
# t-test was conducted. What is the effect size (in terms of Cohen’s d) that 
# can be detected with such a sample size at 𝛼 = .05 and 1-𝛽 = .80? 

pwr.t.test(n = 15, power = .8)

# Is this effect size a reasonable one to assume before conducting an experiment?

# 1.06 is a very large effect size when using Cohen's criteria, i.e.:
# small  : 0.2 - 0.5
# medium : 0.5 - 0.8
# large  :     > 0.8

# such an effect size is extremely unrealistic! A visualization of the sample overlap 
# at different values of d shows:

# reference group
xx = seq(-4, 4, length.out = 100)
xy = dnorm(xx, 0, 1)

par(mfrow = c(2, 2))

# d = 0.20
plot(xx, xy, xlim = c(-4, 4), ylim = c(0, .5), type = "l", xlab = "Distributions", ylab = "Densities", lwd = 1.5, las = 1, main = bquote(italic(d) == 0.20))
lines(xx, dnorm(xx, -0.20, 1), lwd = 1.5, col = 2)
mtext("(small)", side = 3, line = 0.5, cex = .8)

# d = 0.50
plot(xx, xy, xlim = c(-4, 4), ylim = c(0, .5), type = "l", xlab = "Distributions", ylab = "Densities", lwd = 1.5, las = 1, main = bquote(italic(d) == 0.50))
lines(xx, dnorm(xx, -0.50, 1), lwd = 1.5, col = 2)
mtext("(medium)", side = 3, line = 0.5, cex = .8)

# d = 0.80
plot(xx, xy, xlim = c(-4, 4), ylim = c(0, .5), type = "l", xlab = "Distributions", ylab = "Densities", lwd = 1.5, las = 1, main = bquote(italic(d) == 0.80))
lines(xx, dnorm(xx, -0.80, 1), lwd = 1.5, col = 2)
mtext("(large)", side = 3, line = 0.5, cex = .8)

# d = 1.06
plot(xx, xy, xlim = c(-4, 4), ylim = c(0, .5), type = "l", xlab = "Distributions", ylab = "Densities", lwd = 1.5, las = 1, main = bquote(italic(d) == 1.06))
lines(xx, dnorm(xx, -1.06, 1), lwd = 1.5, col = 2)

par(mfrow = c(1, 1))

# for comparison: In a large study on gender differences in the prevalence of mental disorders 
# (McLean et al., 2011, https://dx.doi.org/10.1016%2Fj.jpsychires.2011.03.006), the following 
# gender differences (among others) in lifetime prevalence were observed (F vs. M %, Odds ratio): 

# Any Anxiety Disorder: 33.3 vs. 22.0%, OR = 1.70
# PTSD                :  8.5 vs.  3.5%, OR = 2.69
# Bulimia Nervosa*    :  2.2 vs.  0.5%, OR = 5.49
# * comorbidity with an anxiety disorder

# the using oddsratio_to_d converter of the effectsize package, we see that
round(oddsratio_to_d(c(1.7, 2.69, 5.49)), 2)

# How many participants would you need if you divide this effect size by two for power analysis? 

pwr.t.test(d = 1.06/2, power = .8)

# i.e., you would need two groups of 57 participoants (or a total sample of N = 114) 


# 3) What if you cannot afford more than a small sample? ----

# What is the power to detect a correlation of r = .30 in a sample of N = 30 given that you have 
# to correct for multiple testing because you need to perform 5 tests on the same hypothesis?

pwr.r.test(r = .30, n = 30, sig.level = .05/5)

# Given the result, is it worth the effort to run that study at all?

  
