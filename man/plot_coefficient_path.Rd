\name{plot_coefficient_path}
\alias{plot_coefficient_path}
\title{Plot Coefficient Regularization Path}
\usage{
  plot_coefficient_path(cvg, ...)
}
\arguments{
  \item{cvg}{cv.glmnet object}

  \item{\dots}{argments to the lower-level plotting
  functions (e.g. title)}
}
\value{
  ggplot2 generated grid object
}
\description{
  Plots the regularization path of the coefficients of a
  glmnet object.
}
\author{
  Erik Shilts
}

