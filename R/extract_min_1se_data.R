#' Extracts Min and 1SE Model Data
#' @description Extract information about the models at the values of lambda corresponding
#' to the minimum (min) and within one standard error (1se) of the minimum cross validation
#' error. This is useful for adding context to plots of the coefficients, coefficient paths,
#' and cross validation regularization path.
#' @param cvg cv.glmnet object
#' @return small data frame of information corresponding to the min and 1se fits
#' @author Erik Shilts
#' @export
extract_min_1se_data <- function(cvg) {
  min1se_dat <- data.frame(label = c('Min', '1SE'), lambda=c(cvg[['lambda.min']], cvg[['lambda.1se']]))
  min1se_dat$negative_log_lambda <- -1 * log(min1se_dat$lambda)

  cv_path <- extract_cv_path(cvg)
  cv_path$max_cvup <- max(cv_path$cvup)
  cv_path$min_cvlo <- min(cv_path$cvlo)

  extract_min_1se_cv_path(cv_path, min1se_dat)
}
