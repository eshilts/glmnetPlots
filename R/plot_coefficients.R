#' Plot Coefficients of a glmnet Object
#' @description Plots coefficients of a glmnet object.
#' @param cvg cv.glmnet object
#' @param type type of plot. valid values: min, 1se, both, path
#' @author Erik Shilts
#' @export
plot_coefficient <- function(cvg, type='path', ...) {
  stopifnot(length(type) == 1)
  stopifnot(toupper(type) %in% toupper(c('min', '1se', 'both', 'path')))

  if(type == 'path') {
    NULL # plot_coefficient_path
  } else if(type == 'min') {
    plot_coefficient_coefplot(cvg, type='min')
  } else if(type == '1se') {
    plot_coefficient_coefplot(cvg, type='1se')
  } else NULL # plot_coefficient_coefplot(cvg, type='both') - can simplify this to an if-else
}
