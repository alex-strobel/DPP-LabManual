# Custom R functions at AG.DPP

This folder contains a number of functions that might come in handy for use in our scripts. So far, it contains the following functions:

- [`corr_ci`](https://github.com/alex-strobel/DPP-LabManual/blob/main/Functions/corr_ci.R): simply calculates the 95% confidence interval of a given correlation at a given sample size
- [`corr_evol`](https://github.com/alex-strobel/DPP-LabManual/blob/main/Functions/corr_evol.R): analyzes the evolution of a correlation as a sample comes in along the lines of [Schönbrodt and Perugini (2013)](http://dx.doi.org/10.1016/j.jrp.2013.05.009) 
- [`mspd`](https://github.com/alex-strobel/DPP-LabManual/blob/main/Functions/mspd.R): performs matrix spectral decompostion of a correlation matrix to retrieve the effective number of variables underlying the matrix 
- [`randcorr`](https://github.com/alex-strobel/DPP-LabManual/blob/main/Functions/randcorr.R): simulates random variables that are correlated to a specified degree

Feel free to add your favourite functions! 
