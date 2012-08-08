\name{extract_min_1se_data}
\alias{extract_min_1se_data}
\title{Extracts Min and 1SE Model Data}
\usage{
  extract_min_1se_data(cvg)
}
\arguments{
  \item{cvg}{cv.glmnet object}
}
\value{
  small data frame of information corresponding to the min
  and 1se fits
}
\description{
  Extract information about the models at the values of
  lambda corresponding to the minimum (min) and within one
  standard error (1se) of the minimum cross validation
  error. This is useful for adding context to plots of the
  coefficients, coefficient paths, and cross validation
  regularization path.
}
\author{
  Erik Shilts
}

