#' A package for plotting glmnet objects.
#' 
#' @description This package duplicates the functionality of plot.glmnet and plot.cv.glmnet from
#' the glmnet package. It extends functionality by adding coefficient plots (a la the arm package)
#' and adds context to the standard charts. It also relies solely on a cv.glmnet object instead of
#' having different functionality for cv.glmnet and glmnet objects. This is because it makes the
#' code easier to parse by allowing the user to explictly state the type of plot they want, and to eliminate
#' the storing of multiple objects since the glmnet object is embedded in the cv.glmnet object.
#' @name CaseyKelp
#' @aliases CaseyKelp dreamysmurf package-dreamysmurf package-CaseyKelp
#' @docType package
NULL
