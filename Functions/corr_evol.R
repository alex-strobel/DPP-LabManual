corr_evol <- function(x, y, method = "Pearson", start = 10, step = 1, corridor = "ci", boot = F, boot.R = 1000L, power = F, plot = T, lwd = 1.5, ylim = c(-1,1)) {

  # This function analyzes (and if requested plots) the evolution of a 
  # correlation as a sample comes in along the lines of the article by 
  # Schönbrodt, F. & Perugini, M. (2013). At what sample size do correlations
  # stabilize? *Journal of Research in Personality, 47*, 609-612.
  # http://dx.doi.org/10.1016/j.jrp.2013.05.009
  
  # x and y  = correlated variables  
  # method   = correlation method (Pearson, Spearman, Kendall), 
  #            needs to be provided with uppercase first letter
  # start    = sample size at which to start
  # step     = increment in sample size
  # corridor = corridor of stability, per default 95% CI of final correlation,
  #            alternatively can be "se" 
  # boot     = evolution of correlations for bootstrap samples?
  # boot.R   = how many bootstrap samples? 
  # power    = should power at point of stability be reported?
  # plot     = should the result be plotted?
  # lwd,ylim = graphical parameters for plot

  # final correlation and its 95% CI
  r = psych::corr.test(data.frame(x, y), method = tolower(method))
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
  
  r = r$ci$r # note that initial result from corr.test is overwritten, because it is not used anymore
  r.ci = data.frame(lwr, r, upr) # r together with ci
  # sample sizes
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
    plot(n, r.evol, type = "n", xlab = "Sample Size", ylab = paste(method, "Correlation"), main = ci.lab, xlim = c(0, length(x)), ylim = ylim)
    if (boot == T) {
      boot.ci = apply(r.evol.boot, 2, quantile, c(.025, .975))
      polygon(c(start:length(x), length(x):start), c(boot.ci[1, ], rev(boot.ci[2, ])), border = NA, col = grey(.9))
    }
    abline(h = r.ci, col = 2, lty = c(3, 1, 3))
    abline(v = POS, lty = 5)
    if (method == "Pearson") {
      axis(4, at = r, labels = bquote(italic(r) == .(round(r, 2))), las = 1)
    } else if (method == "Spearman") {
      axis(4, at = r, labels = bquote(italic(r[s]) == .(round(r,2))), las = 1)
    }
    lines(n, r.evol, lwd = lwd)
    rect(POS - 10, max(axTicks(2)) - .04, POS + 10, max(axTicks(2)) + .04, border = NA, col = 0)
    text(POS, max(axTicks(2)), bquote(POS[emp] == .(POS)))
    if (boot == T) {
      POS.boot.ci = apply(r.evol.boot, 2, quantile, c(.025, .975))
      ex.corridor.lwr = (POS.boot.ci[1,] <= lwr | POS.boot.ci[1,] >= upr)
      if (length(which(ex.corridor.lwr)) > 0) {
        POS.boot.lwr = n[max(which(ex.corridor.lwr))] + 1
      } else {
        POS.boot.lwr = start  
      }
      ex.corridor.upr = (POS.boot.ci[2,] <= lwr | POS.boot.ci[2,] >= upr)
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
    if (power == T) {text(mean(c(POS, par("usr")[2])), min(axTicks(2)), paste("Power at POS is ",round(PWR[2], 2), sep = ""))}
    box()
    par(mar = c(5, 4, 4, 2))
  }
  
  # return results
  invisible(
    list(
      evolution = r.evol,           # evolution of correlation
      r = data.frame(lwr, r, upr),  # correlation with 95% CI
      POS = POS,                    # Point of Stability in empirical sample
      PWR = PWR,                    # power at POS
      evolution.boot = r.evol.boot, # bootstrapped evolution of correlation
      POS.boot = POS.boot           # bootstrapped POS
    )
  )
  
}
