\name{plot_coefficient_coefplot}
\alias{plot_coefficient_coefplot}
\title{Make Coefplot of Coefficients from a glmnet Object}
\usage{
  plot_coefficient_coefplot(cvg, type = "both", ...)
}
\arguments{
  \item{cvg}{cv.glmnet object}

  \item{type}{type of plot (min, 1se, or both)}

  \item{/dots}{other arguments to plotting function (e.g.
  plot_title)}
}
\description{
  Creates a coefplot of coefficients for minimum cross
  validation error, 1SE cross validation error, or both. A
  coef plot is based on that in the arm package.
}
\author{
  Erik Shilts
}

