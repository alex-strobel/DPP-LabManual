r_corr <- function(rho, nobs, nvars, precision = 0) {

  #' Generate correlated random variables
  #'
  #' Creates a simulated dataset with a specified correlation value or matrix.
  #'
  #' @param rho A single correlation coefficient or a correlation matrix.
  #' @param nobs Number of observations.
  #' @param nvars Number of variables.
  #' @param precision Required matching precision (0 = no iterative correction, 3 = may take very long).
  #'
  #' @return A data frame with simulated correlated variables.

  C <- if (length(rho)==1) { m <- matrix(rho,nvars,nvars); diag(m) <- 1; m } else rho
  A <- chol(C)
  repeat {
    Y <- matrix(rnorm(nobs*nvars), ncol=nvars) %*% A
    if (precision==0 || all(round(cor(Y),precision)==round(C,precision))) break
  }
  as.data.frame(Y)
}
