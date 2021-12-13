mspd <- function(corr.mat) {
  # Input: corr.mat, a correlation matrix
  # Output: Veff, the number of independent components explaining the correlation matrix
  V    = nrow(corr.mat)
  EV   = eigen(corr.mat)$values
  Veff = 1 + (V - 1) * (1 - (var(EV) / V))
  return(Veff)
}
