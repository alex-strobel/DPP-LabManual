# Open data and code

## Table of Contents

- [Open data and code](#open-data-and-code)
  - [Table of Contents](#table-of-contents)
  - [Introduction](#introduction)
  - [Codebook](#codebook)
  - [Repository](#repository)
    - [OSF](#osf)
    - [GitHub](#github)
    - [OpARA](#opara)

## Introduction

In accordance with the [OSIP Research Transparency Statement](https://tu-dresden.de/mn/psychologie/die-fakultaet/open-science/osip-research-transparency-statement) devised by the Open Science Initiative of the Faculty of Psychology, we provide open data and code (and all further material necessary to assess the validity of our results or to replicate them) *whenever possible*.

*Whenever possible* means that there should be an objective reason for not providing open data and code (and materials).

- For *open data*, one hindering factor could be that participants may be identifiable even if the data set is anonymized (which, e.g., would be the case if you conducted a survey among the members of some institute of psychology of some university in some year and would provide gender and status group as variables in your anonymized data set: it may readily be the case that there has been only one female professor in this institute in the given year).

- For *open code*, one would need to push their imagination really far to construct a reason why its provision is not possible.

- For *open materials*, the reason may be that we used some copyrighted est or questionnaire, and fo course, we cannot provide their item content along with out manuscript. Yet, it may be an idea to parapharase some questionnaire's items or to outline the general structure of test items.

Taken together: there may be reasons for not providing open data, code, and materials, but they are rare (the least so with regard to Open Materials if they are copyrighted) and need to be justified in the manuscript.

## Codebook

Also, we always provide a codebook along with our data. A codebook essentially is a list of the variables in the data set together with their variable and value labels, e.g.:

| variable | label                        | values                                      |
| -------- | ---------------------------- | ------------------------------------------- |
| age      | participants' age in years   | 18                                       |
| gender   | participants' gender         | 1 = male, 2 = female, 3 = diverse           |
| nfc_01   | Need for Cognition item 1    | -3 = totally disagree ... 3 = totally agree |
| ...      |                              |                                             |
| nfc_sum  | Need for Cognition sum score | possible range -48 - 48                     |

With such a codebook, we ensure not only the transparency of our research, but also make it possible that others can re-use our data for their own purposes.

You can build in a codebook in an R data.frame by setting attributes to the variables of this data.frame, e.g.:

```R
# create arbitrary data.frame
df = data.frame(age = round(runif(100, 18, 48)), 
                gender = sample(1:3, 100, replace = T, prob = c(45, 45, 10)), 
                nfc_01 = round(runif(100, -3, 3)))

# set attributes for variable "age"
attr(df$age, "variable") = "participants' age in years"
attr(df$age, "values") = range(df$age)

# set attributes for variable "gender"
attr(df$gender, "variable") = "participants' gender"
attr(df$gender, "values") = matrix(1:3, nrow = 1, dimnames = list("value", c("male", "female", "diverse")))

# set attributes for variable "nfc_01"
attr(df$nfc_01, "variable") = "Need for Cognition item 01"
attr(df$nfc_01, "values") = matrix(-3:3, nrow = 1, dimnames = list("value", c("totally disagree", "disagree", "somewhat disagree", "neutral", "somewhat agree", "agree", "totally agree")))
```

Using the `str` command, you can see all the variable names and values:

```txt
> str(df)
'data.frame':   100 obs. of  3 variables:
 $ age   : num  30 36 19 44 36 32 26 26 23 37 ...
  ..- attr(*, "variable")= chr "age in years"
  ..- attr(*, "values")= num [1:2] 18 47
 $ gender: int  1 2 1 1 2 2 1 2 1 1 ...
  ..- attr(*, "variable")= chr "participants' gender"
  ..- attr(*, "values")= int [1, 1:3] 1 2 3
  .. ..- attr(*, "dimnames")=List of 2
  .. .. ..$ : chr "value"
  .. .. ..$ : chr [1:3] "male" "female" "diverse"
 $ nfc_01: num  2 2 1 1 -2 2 -1 -1 -1 -1 ...
  ..- attr(*, "variable")= chr "Need for Cognition item 01"
  ..- attr(*, "values")= int [1, 1:7] -3 -2 -1 0 1 2 3
  .. ..- attr(*, "dimnames")=List of 2
  .. .. ..$ : chr "value"
  .. .. ..$ : chr [1:7] "totally disagree" "disagree" "somewhat disagree" "neutral" ...
```

If you share your data via an \*.RData file, this will provide the codebook directly built-i to the respectve data.frame. Yet, usually, we share data via a *.csv file. So, you may provide the code for attribute generation via a separate R script as outlined above.

Another option would be to provide the codebook via an JSON file, but none of us has experience with JSON, so that remains an option to explore by yourself. 

## Repository

We provide our data and code as well as (ideally) all other materials to reproduce our results on an openly accessible repository. Standard options for doing so are the Open Science Framework (OSF) and/or GitHub. Another option would be OpARA that is hosted by TU Dresden. In the following, these options are outlined.

### OSF

OSF is short for Open Science Framework, an open platform that supports collaborative research and open science. To get an introduction to OSF, you may want to read our OSF manual page that introduces OSF in more detail and provides some information on how to use it. 

- [OSF manual page](/Research/Administration/OSF/OSF.md)

### GitHub

GitHub is great for collaboration on projects that deal (in the broadest sense) with code. Learn more about GitHub here:

- [GitHub manual page](/Research/Administration/GitHub/GitHub.md)

### OpARA

OpARA is short for Open Access Repository and Archive. It is maintained at the ZIH of the TU Dresden and as such seems like the natural data sharing and archiving solution for our purposes. Well, unfortunately it is (as of yet) not as easy than that ... Read more about the benefits and drawbacks of OpARA here:

- [OpARA manual page](/Research/Administration/OpARA/OpARA.md)


[[back](00_How_to_organize_a_research_project.md#organization-of-this-manual)]
