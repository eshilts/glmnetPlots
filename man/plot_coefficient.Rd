\name{plot_coefficient}
\alias{plot_coefficient}
\title{Plot Coefficients of a glmnet Object}
\usage{
  plot_coefficient(cvg, type = "path", ...)
}
\arguments{
  \item{cvg}{cv.glmnet object}

  \item{type}{type of plot. valid values: min, 1se, both,
  path}

  \item{\dots}{argments to the lower-level plotting
  functions (e.g. title)}
}
\description{
  Plots coefficients of a glmnet object.
}
\author{
  Erik Shilts
}

