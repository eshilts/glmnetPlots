#!/usr/bin/env Rscript
system("echo 'roxygenizing the package.'")
library(methods)
library(utils)
library(roxygen2)
roxygenize('.', copy=FALSE)
