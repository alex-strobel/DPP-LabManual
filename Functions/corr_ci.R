corr_ci <- function(r, n, alpha = .05, plot = F, main = "", xlim = NULL, varlabels = NULL, cex.axis = 1) {
  
  # ===========================================================================
  #
  # Purpose: Calculate confidence interval of a correlation
  # Author:  Alexander Strobel (alexander.strobel@tu-dresden.de)
  # Date:    16 Dec 2021
  # Licence: CC0
  # Input:   r = a correlation coefficient, and N = sample size
  # Output:  95% confidence interval of correlation
  #
  # ===========================================================================
  #
  # Details:
  #  
  # This function calculates confidence intervals (CI) of a correlation, 
  # given:
  #
  #   r     = correlation (vectors are accepted)
  #   n     = sample size (vectors are accepted)
  #   alpha = determines confidence level, defaults to .05, resulting in 95% CI
  # 
  # and returns a data.frame with the columns 'n',lwr', 'r', and 'upr' providing
  # the lower and upper bounds of the CI together with the original correlation
  # and sample size. If requested, via 
  #
  #   plot  = T
  #
  # a plot is generated for which variable lables can be provided via
  # 
  #   varlabels = c("Variable 1", "Variable 2", ...) 
  #
  # The above labels are actually the default. Because this function was 
  # generated to use the resulting figures in a presentation, the axis labels 
  # can be magnified via 
  #
  #   cex.axis = 2
  #
  # or whatever value deems reasonable. The left margin is automatically adjusted.
  
  library(psych)
  
  # calculate 95% confidence interval (CI) 
  ci = qnorm(1 - (alpha / 2)) * sqrt(1 / (n - 3))
  # lower and upper bounds of 95% CI of given correlation at given sample size n
  lwr = fisherz2r(fisherz(r) - ci)
  upr = fisherz2r(fisherz(r) + ci)
  # combine to data.frame
  CI = data.frame(n, lwr, r, upr)
  # plot if requested
  if (plot == T) {
    # create default variable labels
    if (is.null(varlabels)) {
      varlabels = paste("Variable", 1:length(r))
    }
    # determine x axis limits if none are provided
    if (is.null(xlim)) {
      xlim = c(min(lwr), max(upr))
    }
    # save current graphics parameter settings
    par.def = par()
    # adjust margins for plot
    par(mar = c(5, cex.axis * max(strwidth(varlabels, unit = "inches")) / .17, 4, 2))
    # plot empty frame
    plot(xlim, c(1, nrow(CI)), type = "n", xlim = xlim, xlab = "Correlation with 95% CI", cex.lab = cex.axis, cex.axis = cex.axis * .75, ylim = c(.5, length(r) + .5), ylab = "", yaxt = "n", main = main)
    # add y axis with variable labels
    axis(2, at = 1:length(r), varlabels, las = 1, cex.axis = cex.axis)
    # plot vertical line at x position 0
    abline(v = 0, lty = 3)
    # add correlations with point extension giving the sample size 
    points(r, 1:nrow(CI), pch = 19, cex = n/100)
    # add CI as lines
    matlines(as.matrix(rbind(lwr, upr)), matrix(rep(1:length(r), 2), nrow = 2, byrow = T), lty = 1, col = 1, lwd = 1.5)
    # restore graphics parameter setting
    par = par.def
  }
  # return result
  return(CI)
}
