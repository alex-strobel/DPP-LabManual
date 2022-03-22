# R Package `BayesFactor`

<!-- Author: Alex Strobel -->

`BayesFactor` allows you to perform Bayesian statistics on many types of tests such as correlation analysis, *t*-tests, ANOVA, or multiple regression. You can both calculate Bayes factors (BF10, i.e., how probable are the data given that the alternative hypothesis is true) and posterior estimates of the effect size, for details see 

```R
?BayesFactor
``` 

Here is an example for correlations:

```R
library(BayesFactor)

# simulate some population correlation
set.seed(242)
x = rnorm(10^6)
y = 0.316 * x + rnorm(10^6)
pop = data.frame(x, y)
cor(pop)

# draw an empirical sample
emp = pop[sample(1:10^6, 256, replace = F), ]

# get BF10 for correlation
BF10 = correlationBF(emp$x, emp$y)

# get estimate for posterior
posterior = correlationBF(emp$x, emp$y, posterior = T, iterations = 100000)

# get median and 95% confidence interval for rho
rho = quantile(posterior[, 1], c(.025,.5, .975))

# plot
plot(density(posterior[, 1]), main = "Posterior distribution", xlab = "Correlation", las = 1)
lines(rho[c(1,3)], rep(0,2), lwd = 1.5)
points(rho[2], 0, pch = 19)
text(max(axTicks(1)), max(axTicks(2)), paste0("BF10 = ", round(as.vector(BF10))))
```

In this example, we simulate a population of 1.000.0000 individuals where a correlation of &rho; = .30 exists. We draw a sample of *N* = 256 participants and via `cor(emp$x, emp$y)` yield a correlation of *r* = .28. Employing Bayesian correlation using `correlationBF(emp$x, emp$y ...)` we yield a posterior correlation of &rho; = .27 with a BF10 = 3584.42. That is, the data are about 3584 times more probable when assuming there is a correlation than when assuming there is none. 

A crucial issue in Bayesian statistics is the adequate choice of the prior distribution, i.e., in our example what we assume is the population correlation. If we have some evidence on the effect size to be expected, we ideally could set the location (= the central tendency) of the distribution to that effect size, and if we are quite sure that the true correlation will fall somewhere near this effect size, we would set a rather narrow scale of the distribution (= dispersion). Yet, the `BayesFactor` package so far (2021-12-22) does not allow to set the assumed prior location, but only the prior scale (or width, often abbreviated as &kappa;) via the `rscale` argument. In `correlationBF`, it is set to 1/3, while in *JASP*, the default is 1 (see Figure 1, left panel), which is a bit odd because to my knowledge more or less the same group of people is behind both tools. To me, a prior width of 1/3 makes more sense than a prior width of 1, because in the latter case we have a so-called flat prior, i.e., all correlations between -1 and 1 are assumed as equally likely. Because usually, we have some idea on the effect size to expect, but usually expect it to be not that large, a prior scale of 1/3 (that reflects the assumption that the most likely case is no population correlation, but still smaller correlations may exist, while large ones are rather unlikely) seems quite reasonable. Still, we may have reviewers that voice concern over our prior choice (even if it's the default). In this case it could be a good idea to perform a so-called Bayes factor robustness check. *JASP* has this a a built-in option, in R, you can achieve similar results via the following code:

```R
# calculates stretched beta prior distribution used for Bayesian correlation analysis
beta_prior <- function(rho = seq(-1, 1, by = .01), kappa = 1) {
  # see formula 24 in Ly, A., Verhagen, J. & Wagenmakers, E.-J. (2016). Harold 
  # Jeffreys’s default Bayes factor hypothesis tests: Explanation, extension, 
  # and application in psychology. Journal of Mathematical Psychology, 72, 
  # 19-32. http://dx.doi.org/10.1016/j.jmp.2015.06.004
  
  pi = ((2^((kappa - 2) / kappa)) / beta(1 / kappa, 1 / kappa)) * ((1 - rho^2)^((1 - kappa) / kappa))
  return(pi)                                                    
}

# set prior width
prior_width = seq(.01, 1, by = .01)

# calculate BF10 and posterior correlation rho at different prior widths
BF10 = rho = NULL
for (i in 1:length(prior_width)) {
  BF10 = c(BF10, as.vector(correlationBF(x, y, rscale = prior_width[i])))
  rho = rbind(rho, quantile(correlationBF(x, y, rscale = prior_width[i], posterior = T, iterations = 100000)[, 1], c(.025, .500, .975)))
}

# plot results
par(mfrow = c(1, 3), mar = c(5, 4, 4, 1))

# prior distributions given different prior widths
plot(-c(-1,1),c(0,7),type="n",las=1,xaxt="n",xlab="Population correlation",ylab="Density",main="Prior distributions at different prior widths")
axis(1,at=seq(-1,1,.2),labels=c("-1","-.8","-.6","-.4","-.2","0",".2",".4",".6",".8","1"))
r = seq(-1, 1, .001)
k = c(1 / 100, 1 / 3, 1)
col = c('#993333', '#339933', '#336699')
for (i in 1:3) { lines(r, beta.prior(r, k[i]), col = col[i], lwd = 1.5) }
legend("top", bty = "n", inset = .01, horiz = T, col = col, lwd = 1.5, legend = c(expression(kappa == "1/100"), expression(kappa == "1/3"), expression(kappa == 1)), title = "Stretched beta prior width")

# posterior correlations given different prior widths
plot(prior_width, rho[, 2], type = 'l', lwd = 1.5, xlab = "Beta Prior Width", ylab = "Posterior Correlation", ylim = c(.14, .30), yaxt = "n", main = "Bayes Factors")
abline(v = k, lty = 3, col = grey(.8))
axis(2, at = axTicks(2), labels = sub("0.", ".", format(axTicks(2), nsmall = 2)), las = 1)
axis(3, k, c("1/100", "1/3", "1"), mgp = c (3, 0.5, 0))
points(k, rho[!is.na(match(prior_width, c(.01, .33, 1.00))), 2], pch = 21, col = col, bg = 0, lwd = 2)
text(k, rho[!is.na(match(prior_width, c(.01, .33, 1.00))), 2], pos = 1, offset = .75, sub('0.', '.', round(rho[!is.na(match(prior_width, c(.01, .33, 1.00))), 2], 2)))

# BF10 given different prior widths
plot(prior_width, BF10, type = 'l', lwd = 1.5, log = "y", yaxt = "n", ylim = c(10^2, 10^4), xlab = "Beta Prior Width", ylab = "Bayes Factor (BF10)", main = "Posterior Correlations")
axis(2, at = c(100, 300, 1000, 3000, 10000), las = 1)
abline(v = k, lty = 3, col = grey(.8))
axis(3, k, c("1/100", "1/3", "1"), mgp = c (3, 0.5, 0))
points(k, BF10[!is.na(match(prior_width, c(.01, .33, 1.00)))], pch = 21, col = col, bg = 0, lwd = 2)
text(k, BF10[!is.na(match(prior_width, c(.01, .33, 1.00)))], pos = 1, offset = .75, round(BF10[!is.na(match(prior_width, c(.01, .33, 1.00)))]))

par(mfrow = c(1, 2))
```

Sorry for the messy syntax style in the code above (I will format it according to our [R programming style guide](https://github.com/alex-strobel/DPP-LabManual/wiki/R-programming-style-guide) as soon as I am in the mood for it). As you can see in Figure 1, prior choice directly affects the resulting posterior correlation and the Bayes factor, but in this example not so much that we would yield a substantially different posterior correlation and come to a different conclusion based on the respective BF10 if we chose a reasonable prior, i.e., the default priors of `BayesFactor` (&kappa; = 1/3, resulting in &rho; = .27, BF10 = 3595, the difference to the BF10 stated above is due to the fact that for this analysis, `rscale = 0.33` instead of `rscale = 1/3`) or *JASP* (&kappa; = 1, resulting in &rho; = .28, BF = 2254). 

![Bayes factor robustness check](https://github.com/alex-strobel/DPP-LabManual/blob/main/Images/Wiki/prior_width.jpg)

**Figure 1.** Bayes factor robustness check

If instead we had chosen an extremely narrow prior width of &kappa; = 1/100 (see red distribution in left panel of Figure 1), things would look different, &rho; = .16, BF10 = 211. Still, the BF10 is way above 100 and would therefore be classified as *extreme evidence for the H1* (see [here](https://github.com/alex-strobel/DPP-LabManual/blob/main/Manuals/Workflow_research_projects/06_Analysis_plan.md#consider-to-use-bayesian-statistics) for the classification scheme). Yet, the posterior correlation is substantially lower than that obtained with &kappa; = 1/3 or &kappa; = 1 (and the one a conventional correlation analysis would yield). This is because our prior belief in such a case would have been that there is virtually no correlation - a belief that is not as much updated after having seen the data as it would be if we already had assumed a higher correlation. As a metaphor: if we believe that all swans are white, having seen a black one would not prompt us to adjust our belief to the actual percentage of black among all swans, but would still leave us with the impression that while apparently black swans *do* exist, they are a really small minority.
  

 