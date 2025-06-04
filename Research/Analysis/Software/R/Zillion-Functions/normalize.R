normalize <- function(data, whichFormula = 3, whichMeanSD = 1) {
  # ===========================================================================
  #
  # Purpose: normalizes data using one of the formulae:
  #          1 = Van der Waerden (1952): r * / (n + 1)
  #          2 = Blom (1954):           (r - 3/8) / (n + 1/4) (default)
  #          3 = Bliss (1956; Rankit):  (r - 1/2) / n
  #          4 = Tukey (1962):          (r - 1/3) / (n + 1/3)
  # Ties will be treated as average, and the output will be rescaled
  # to have mean = 0 and sd = 1, if whichMeanSD = 1 (default);
  # if you want to keep the mean and sd of the original variable, enter 
  # whichMeanSD = 0.
  #
  # The default normalization algorithm of this function is rankit, as it 
  # has been shown to be superior to other algorithms:
  # 
  # https://digitalcommons.wayne.edu/jmasm/vol8/iss2/9/ 
  #
  # Author:  Alexander Strobel (alexander.strobel@tu-dresden.de)
  # Date:    16 Dec 2021
  # Licence: CC0
  # Input:   data = a numeric vector
  # Output:  normal = the normalized score of the input vector  
  #
  # ===========================================================================
  
  normalize = function(data, normalize.formula = whichFormula, mean0.sd1 = whichMeanSD) {
    r = rank(data, na.last = "keep", ties.method = ("average"))
    n = sum(!is.na(r))
    
    if (normalize.formula == 1)
      x = r/(n + 1)
    if (normalize.formula == 2)
      x = (r - 3 / 8)/(n + 1 / 4)
    if (normalize.formula == 3)
      x = (r - 1 / 2)/n
    if (normalize.formula == 4)
      x = (r - 1 / 3)/(n + 1 / 3)
    
    if (mean0.sd1 == 1)
      normal = qnorm(x, mean = 0, sd = 1, lower.tail = TRUE, log.p = FALSE)
    else
      normal = qnorm(x, mean = mean(data,na.rm = T), sd = sd(data,na.rm = T), lower.tail = TRUE, log.p = FALSE)
  }
  
  if (class(data) == "numeric") { 
    normal = normalize(data, whichFormula, whichMeanSD)
  } else {
    normal = NULL
    for (i in 1:dim(data)[2]) {
      normal = cbind(normal, normalize(data[,i], whichFormula, whichMeanSD))
    }
    colnames(normal) = names(data)
  }
  
  return(as.data.frame(normal))
  
}
