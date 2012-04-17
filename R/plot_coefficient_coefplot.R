#' Make Coefplot of Coefficients from a glmnet Object
#' @description Creates a coefplot of coefficients for minimum cross validation error, 1SE 
#' cross validation error, or both. A coef plot is based on that in the arm package.
#' @param cvg cv.glmnet object
#' @param type type of plot (min, 1se, or both)
#' @author Erik Shilts
#' @export
plot_coefficient_coefplot <- function(cvg, type='both', ...) {
  stopifnot(toupper(type) %in% toupper(c('min', '1se', 'both')))

  coefs <- extract_coefficients(cvg, type)
  coefs$coefficient_name <- reorder(coefs$coefficient_name, coefs$coefficient_value)

  title_label <- concat('Coefficient plot: ', toupper(type))
  colour_guide <- if(length(unique(coefs$coefficient_type)) == 1) 'none' else guide_legend()
  
  p <- ggplot(coefs, aes(x=coefficient_name, y=coefficient_value, colour=coefficient_type)) +
    opts(labels=c(y='Coefficient', x='', colour='Type'), title=title_label) +
    scale_colour_manual(values=brand_colors()[['Hex']], guide=colour_guide) +
    geom_hline(yintercept=0, colour='darkgrey') + 
    geom_segment(aes(y=0, yend=coefficient_value, xend=coefficient_name), linetype=2) +
    geom_point() + 
    coord_flip() +
    opts()
}
