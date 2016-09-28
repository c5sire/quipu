quipu
=====

[![Travis-CI Build Status](https://travis-ci.org/c5sire/quipu.png?branch=master)](https://travis-ci.org/c5sire/quipu)
[![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/c5sire/quipu?branch=master)](https://ci.appveyor.com/project/c5sire/quipu)
[![Coverage Status](https://img.shields.io/codecov/c/github/c5sire/quipu/master.svg)](https://codecov.io/github/c5sire/quipu?branch=master)

### First time installation
```{r}
install.packages("devtools")
devtools::install_github("quipu", "c5sire")
```

### Demo
```{r}
quipu::runDemo()
```

### Usage
```{r}
library(quipu)

example(rquipu)
```

Right-click on link to download the [tutorial](https://github.com/c5sire/quipu/tree/master/vignettes/Quipu_tutorial.pdf).

Standardizing molecular diversity profiles of plant genetic resources using concepts from Andean quipus
---------------------

Simon R*, Carhuapoma R, Hualla V, de Haan S, Ghislain M, Nuňez J, Zorilla C, Gomez R, de Mendiburu F, Roca W, Bonierbale M

 The chart shows SSR marker weights on a linear scale where each allele or 'gel band' is represented by a circle. The circle's diameter can be sized proportionally by its rareness  (default: the wider the rarer) within a set of accessions. The purpose is to facilitate the visual screening
and comparison of genotypes with regard to these two questions:
 
What is the overall pattern of alleles in a genotype?
 
Which genotypes have rare alleles?


    
A sample image showing a fully annotated chart (parameter 'layout = "full"':

![Sample quipu image](img/sample.1.jpg)

A sample image showing a minimal chart (parameter 'layout = "no text"':

![Sample quipu image](img/no_text.png)

