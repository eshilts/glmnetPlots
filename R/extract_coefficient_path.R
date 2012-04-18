#' Extract Coefficient Path
#' @description Extract coefficients along the regularization path
#' @param cvg cv.glmnet objects
#' @returns long data.frame of coeffients, penalties, and deviance ratios
#' @author Erik Shilts
#' @export
extract_coefficient_path <- function(cvg) {
  coef_path <- as.data.frame(as.matrix(t(cvg[['glmnet.fit']][['beta']])))
  coef_path$Intercept <- cvg[['glmnet.fit']][['a0']]
  coef_path$lambda <- cvg[['glmnet.fit']][['lambda']]
  coef_path$negative_log_lambda <- -1 * log(coef_path$lambda)
  coef_path$dev.ratio <- cvg[['glmnet.fit']][['dev.ratio']]
  coef_path$nzero <- cvg[['nzero']]

  coef_path_long <- melt.data.frame(coef_path, measure.vars = c(row.names(cvg[['glmnet.fit']][['beta']]), 'Intercept'))
  names(coef_path_long)[(length(coef_path_long)-1):length(coef_path_long)] <- c('coefficient_name', 'coefficient_value')
  coef_path_long <- coef_path_long[order(coef_path_long$lambda, decreasing=TRUE), ]

  coef_path_long
}
