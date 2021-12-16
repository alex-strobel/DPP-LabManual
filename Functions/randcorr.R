randcorr <- function(rho,nobs,nvars,precision=0,matrix.found=F) {
  # ===========================================================================
  #
  # Purpose: Simulate random correlated variables 
  # Author:  Alexander Strobel (alexander.strobel@tu-dresden.de)
  # Date:    16 Dec 2021
  # Licence: CC0
  # Input:   rho = a correlation coefficient or matrix, nobs = sample size, 
  #          nvars = number of correlated variables, precision (see details)  
  # Output:  a data.frame containing the correlated variables
  #
  # ===========================================================================
  #
  # Details:
  #
  # This function returns a matrix of N rows (equaling the number of nobs) by P colums
  # (equaling the number of nvars) that fulfil the requirement to be correlated as
  # specified by the numeric value or matrix rho. If rho is a numeric value, all
  # variables will correlate with r = rho. If rho is a symmetric correlation matrix
  # (with 1 in the diagonal), the intercorrelations of the variables generated will
  # reproduce rho to a precison of 0 (default) as a rough approximation using only one
  # generation cycle or 1 (approxiation to .x), 2 (.xx), and so on (with increasing, but
  # generally negligible time to find a respective solution). The number of cycles needed
  # to find a matrix fulfilling the requirements is returned via matrix.found=T.
  
  compare <- function(x,y,prec=2) {
    X=round(x,prec)
    Y=round(y,prec)
    return(X==Y)
  }
  
  if (dim(as.data.frame(rho))[1]==1) {
    C=matrix(rho,nvars,nvars);
    for (i in 1:nvars) {
      C[i,i]=1
    }
  } else {
    C=rho
  }

  A=chol(C)

  i=1;

  if (precision==0) {
    W=rnorm(nobs*nvars,0,1)
    dim(W)=c(nobs,nvars)
    y=W%*%A
  } else {
    k=1;
    while (k==1) {
      W=rnorm(nobs*nvars,0,1)
      dim(W)=c(nobs,nvars)
      y=W%*%A
      D=cor(y);
      c=compare(round(C,precision),round(D,precision),prec=precision)
      if (all(c)==T) {
        k=0;
      }
      i=i+1
    }
}
  if (matrix.found==T) {
    print(paste("matrix found in ",i," steps.",sep=""))
  }
   
  return(data.frame(y))

}
