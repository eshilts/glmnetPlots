#' Extract Coefficients from cv.glmnet Object
#' @description Extracts coefficients from a cv.glmnet object for
#' the values at the minimum cross validation error (cvm) and cross-validation
#' error within one standard error of the minimum (cv1se).
#' @param cvg_object cv.glmnet object
#' @param coefficient_type a string indicating which coefficients to return. Default is to return coefficients for both models. valid values: 'min', '1se', 'both'.
#' @author Erik Shilts
#' @export
extract_coefficients <- function(cvg_object, coefficient_type='both') {
  stopifnot(toupper(coefficient_type) %in% toupper(c('both', 'min', '1se')))

  limiter <- if(coefficient_type == 'both') c('min', '1se') else coefficient_type

  coefficient_df <- extract_coefficients_helper(cvg_object)

  coefficient_df[toupper(coefficient_df$coefficient_type) %in% toupper(limiter), ]
}

extract_coefficients_helper <- function(cvg_object) {
  coef_min <- coef(cvg_object[['glmnet.fit']], s=cvg_object[['lambda.min']])
  coef_1se <- coef(cvg_object[['glmnet.fit']], s=cvg_object[['lambda.1se']])

  coefs <- data.frame(coefficient_name = c(row.names(coef_min), row.names(coef_1se)),
                      coefficient_value = c(coef_min[, 1], coef_1se[, 1]),
                      coefficient_type = rep(c('Min', '1SE'), each=nrow(coef_min))) 

  coefs <- coefs[coefs$coefficient_value != 0, ] 
  coefs$coefficient_name <- factor(as.character(coefs$coefficient_name), levels=unique(as.character(coefs$coefficient_name)))

  coefs
}
