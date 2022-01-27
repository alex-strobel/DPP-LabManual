# Targets (R Package)

[Christoph Scheffel](mailto:christoph_scheffel@tu-dresden.de)<br>
Faculty of Psychology
TU Dresden

Credit goes to<br> 
Name (Affiliation)

27.01.2022

---

## Table of contents

[Introduction](#introduction)

[Motivation](#motivation)

[Set-up](#set-up)

---
## Introduction

The [targets](https://docs.ropensci.org/targets/) package is a pipeline toolkit for statistics and data science in R. You can maintain a reproducible workflow without repeating yourself. `targets` learns how your pipeline fits together, monitors your pipeline, skips costly runtime for tasks that are already up to date, and runs only the necessary computations.
<p align="center">
    <img src="pics/targets_logo.png" width="250"/>
</p>

## Motivation

Data analysis and writing of manuscripts in RMarkdown can be slow and frustrating. Your analysis can take several minutes or even hours. You wait and wait only to discover an error in the code or some of the data has changed. Then the waiting starts all over again. With `targets` only parts that have changed are executed - saving the runtime for routines that are already up-to-date.

## Set-up

...