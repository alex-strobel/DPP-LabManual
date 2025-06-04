randcorr <- function(rho, nobs, nvars, precision = 0, matrix.found = FALSE) {
  # ===========================================================================
  # Purpose: Simulate random correlated variables 
  # Author:  Alexander Strobel (alexander.strobel@tu-dresden.de)
  # Date:    16 Dec 2021
  # Licence: CC0
  # ===========================================================================
  # Arguments:
  #   rho            Correlation coefficient or correlation matrix
  #   nobs           Sample size (number of rows)
  #   nvars          Number of correlated variables (columns)
  #   precision      Number of decimal places for matrix comparison
  #   matrix.found   If TRUE, print number of iterations until matching matrix is found
  # Returns:
  #   A data.frame with simulated correlated variables
  # ===========================================================================

  compare_matrices <- function(x, y, prec = 2) {
    identical(round(x, prec), round(y, prec))
  }

  # Construct correlation matrix if scalar rho is given
  if (is.numeric(rho) && length(rho) == 1) {
    C <- matrix(rho, nvars, nvars)
    diag(C) <- 1
  } else {
    C <- rho
  }

  A <- chol(C)
  i <- 1

  if (precision == 0) {
    W <- matrix(rnorm(nobs * nvars), nobs, nvars)
    y <- W %*% A
  } else {
    repeat {
      W <- matrix(rnorm(nobs * nvars), nobs, nvars)
      y <- W %*% A
      D <- cor(y)
      matches <- compare_matrices(C, D, prec = precision)
      if (isTRUE(matches)) break
      i <- i + 1
    }
  }

  if (isTRUE(matrix.found)) {
    message(sprintf("Matrix found in %d steps.", i))
  }

  return(as.data.frame(y))
}
