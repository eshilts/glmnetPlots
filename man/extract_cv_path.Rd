\name{extract_cv_path}
\alias{extract_cv_path}
\title{Extract Cross Validation Path}
\usage{
  extract_cv_path(cvg)
}
\arguments{
  \item{cvg}{cv.glmnet model object}
}
\description{
  Extract data describing cross validation path. Creates a
  data frame of lambda (penalty), mean cross validation
  error, standard deviation of cross validation error and
  its associated confidence intervals, number of non-zero
  variables in the model, and deviance ratio (equivalent
  R-squared). This will be used in a plotting function that
  replicates and extends plot.cv.glmnet functionality.
}
\author{
  Erik Shilts
}

