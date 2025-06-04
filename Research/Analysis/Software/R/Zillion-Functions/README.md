# Custom R Functions at AG.DPP

This folder (that is named `Zillion-Functions` so that it is listed last in the `R`folder ;-) contains a number of functions that might come in handy for use in our scripts. So far, it contains the following functions:

- [`corr_ci`](corr_ci.R): simply calculates the 95% confidence interval of a given correlation at a given sample size
- [`corr_evol`](corr_evol.R): analyzes the evolution of a correlation as a sample comes in along the lines of [Schönbrodt and Perugini (2013)](http://dx.doi.org/10.1016/j.jrp.2013.05.009)
- [`mspd`](mspd.R): performs matrix spectral decompostion of a correlation matrix to retrieve the effective number of variables underlying the matrix
- [`normalize`](normalize.R): creates normalized scores of variables based on ranks (e.g., using Blom's formula) 
- [`randcorr`](randcorr.R): simulates random variables that are correlated to a specified degree

Feel free to add your favourite functions! Please conform to the [tidyverse style guide](https://style.tidyverse.org/index.html) and add a header containing the following fields:

- Purpose of the function
- Author
- Date (of last change)
- Licence (ideally [CC0](https://creativecommons.org/publicdomain/zero/1.0/))
- Input
- Output

Details may be added to help others use your function.
