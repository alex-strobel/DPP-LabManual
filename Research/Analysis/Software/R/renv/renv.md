# R package `renv`

Reproducibility of research results is often hindered by the problem that even if other researchers use your data and code when trying to reproduce your results, they not only use different machines and operating systems, but also different R packages to perform some statistical procedure. 
This may result in different outcomes. 
Not so much with regard to the statistical inference itself, i.e., does a hypothesis have to be rejected, but with regard to the exact numbers, e.g., *p* < .011 vs. *p* < .013 or *BF10* = 3.56 vs. *BF10* = 3.59.
This is because R packages evolve and may introduce refined algorithms for their computations in newer versions or introduce new defaults, whatever.

Here, the package `renv` (short for **r**eproducible **env**ironment) comes into play: 
It stores the R environment individual researchers were using when analyzing their data together with the data and the code. 
When researcher Z clones a project of researcher A that A has had managed using `renv`, Z will be using the exact R environment that A was using, regardless of whether Z has packages required for reproducing A's analyses at all or has different versions of that packages installed.
This option may even pay in a given workgroup where certain members tend to update their R packages all the time and others tend to do not.

Learn more about the `renv` package here:

- [`renv` Reference](https://rstudio.github.io/renv/index.html)

Learn how to use GitHub and the `renv` package for version control and collaboration here:

- [GitHub and `renv`](https://github.com/alex-strobel/DPP-LabManual/blob/main/Research/Administration/GitHub/GitHub_and_renv_short.md)

Please note that managing projects with `renv` can be a pain in the ass. You may therefore consider other otions such as [`conda`](https://docs.conda.io/en/latest/) or [`docker`](https://www.docker.com) for ensuring computational reproducibility. 
