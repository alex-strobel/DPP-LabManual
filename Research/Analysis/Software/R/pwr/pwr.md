# R package `pwr`

The `pwr` package by lets you do power analysis for most of the analyses types we usually run: 

- Providing its functions with an effect size and power returns the sample size needed to detect such an effect with the the desired power.
- Providing sample size and power returns the mimimum effect size one can detect in this sample with the desired power. 
- Providing sample size and effect size returns the power one has in this sample to detect the specified effect. 

Alpha level is .05 per default, but can be adjusted as well. 

Example:

```R
# install and source pwr
install.packages("pwr") 
library(pwr)

# example for correlations

# required sample size
sampleSize <- pwr.r.test(r = .30, power = .95)

# required effect size
effectSize <- pwr.r.test(n = 128, power = .95)

# achieved power
achievedPower <- pwr.r.test(n = 128, r = .30)

# achieved power after correction for multiple testing
achievedPower <- pwr.r.test(n = 128, r = .30, sig.level = .01)

# plot power curve
plot(achievedPower)
```

For all functions of the `pwr` package, type this on the command line:

```R
?pwr
```

An ideal complement to the `pwr` package is the [R Package `effectsize`](https://github.com/alex-strobel/DPP-LabManual/blob/main/Research/Analysis/Software/R/effectsize/effectsize.md).
