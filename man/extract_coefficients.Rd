\name{extract_coefficients}
\alias{extract_coefficients}
\title{Extract Coefficients from cv.glmnet Object}
\usage{
  extract_coefficients(cvg_object,
    coefficient_type = "both")
}
\arguments{
  \item{cvg_object}{cv.glmnet object}

  \item{coefficient_type}{a string indicating which
  coefficients to return. Default is to return coefficients
  for both models. valid values: 'min', '1se', 'both'.}
}
\description{
  Extracts coefficients from a cv.glmnet object for the
  values at the minimum cross validation error (cvm) and
  cross-validation error within one standard error of the
  minimum (cv1se).
}
\author{
  Erik Shilts
}

