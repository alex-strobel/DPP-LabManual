mspd <- function(corr.mat) {
  # ===========================================================================
  #
  # Purpose: retrieve the effective number of variables underlying a 
  #          correlation matrix
  # Author:  Alexander Strobel (alexander.strobel@tu-dresden.de)
  # Date:    16 Dec 2021
  # Licence: CC0
  # Input:   cor.mat = a correlation matrix
  # Output:  Veff = the effective number of variables underlying a this matrix 
  #          to be used as correction factor in correction for multiple testing 
  #
  # ===========================================================================
  
  V    = nrow(corr.mat)
  EV   = eigen(corr.mat)$values
  Veff = 1 + (V - 1) * (1 - (var(EV) / V))
  return(Veff)

}
