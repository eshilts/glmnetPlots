#' Extract Cross Validation Path
#' @description Extract data describing cross validation path. Creates
#' a data frame of lambda (penalty), mean cross validation error, standard deviation of 
#' cross validation error and its associated confidence intervals, number of non-zero variables
#' in the model, and deviance ratio (equivalent R-squared). This will be used in a 
#' plotting function that replicates and extends plot.cv.glmnet functionality.
#' @param cvg cv.glmnet model object
#' @author Erik Shilts
#' @return data.frame of cross validation data
#' @export
extract_cv_path <- function(cvg) {
  dat <- as.data.frame(sapply(cvg[c('lambda', 'cvm', 'cvsd', 'cvup', 'cvlo', 'nzero')], cbind))
  dat <- cbind(dat, cvg[['glmnet.fit']][c('dev.ratio')])

  dat$negative_log_lambda <- -1 * log(dat$lambda)

  dat
}
