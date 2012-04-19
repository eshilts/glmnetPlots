#' Plot Coefficient Regularization Path
#' @description Plots the regularization path of the coefficients of a glmnet object.
#' @author Erik Shilts
#' @param cvg cv.glmnet object
#' @param \dots argments to the lower-level plotting functions (e.g. title) 
#' @returns ggplot2 generated grid object
#' @export
plot_coefficient_path <- function(cvg, ...) {
  coef_path <- extract_coefficient_path(cvg)
  min_1se <- extract_min_1se_data(cvg)
  ocolours <- brand_colors()
  ocolours <- ocolours[!ocolours$Color.Name %in% c('White', 'Light Grey'), ]

  fun_args <- list(...)

  title_base <- 'Coefficient Regularization Path'
  plot_title <- if(is.null(fun_args$plot_title)) title_base else fun_args$plot_title
  add_labels <- if(is.null(fun_args$add_labels)) TRUE else fun_args$add_labels

  p <- ggplot(data=coef_path, aes(x=negative_log_lambda, y=coefficient_value)) +
    opts(title=plot_title, labels=c(x='-1 ln(lambda)', y='', colour='Variable')) +
    scale_colour_manual(values=ocolours$Hex, guide='none') +
    geom_hline(yintercept=0, size=0.5, colour='darkgrey') +
    geom_line(aes(y=coefficient_value, group=coefficient_name, colour=coefficient_name)) +
    geom_vline(aes(xintercept=negative_log_lambda), data=min_1se, linetype=2, colour='#616365') +
    geom_text(aes(y=-Inf, label=type_label, hjust=type_hjust), data=min_1se, size=3, vjust=-3) +
    geom_text(aes(y=-Inf, label=dev.ratio_label, hjust=type_hjust), data=min_1se, size=2.5, vjust=-2) +
    geom_text(aes(y=-Inf, label=nzero_label, hjust=type_hjust), data=min_1se, size=2.5, vjust=-0.75) +
    opts()

  if(add_labels) p <- direct.label(p, list('lasso.labels', cex=0.65, adj=0))

  p
}
