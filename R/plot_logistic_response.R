#' Plot Logistic Response
#' @description Plots the logistic reponse
#' @param x input training data
#' @param y dependent response variable
#' @param cvg cv.glmnet object
#' @param \dots other graphical parameters
#' @return ggplot2 created grid object
#' @author Erik Shilts
#' @export
plot_logistic_response <- function(x, y, cvg, ...) {
  fun_args <- list(...)

  predict_dat <- extract_logistic_response_data(x, y, cvg)
  predict_dat$labeled_y <- if(is.null(fun_args$y_labels)) predict_dat$y else ifelse(predict_dat$y == 0, fun_args$y_labels[1], fun_args$y_labels[2])

  title_base <- 'Predicted Response in Rank Order'
  plot_title <- if(is.null(fun_args$plot_title)) title_base else fun_args$plot_title

  add_labels <- if(is.null(fun_args$y_labels)) FALSE else TRUE

  p <- ggplot(predict_dat, aes(x=x, y=predicted_y, colour=factor(labeled_y))) +
    opts(title=plot_title, labels=c(x='', y='Probability', colour='Actual')) +
    scale_colour_manual(values=brand_colors()$Hex, guide='none') +
    geom_hline(yintercept=0.5, size=0.5, colour='darkgrey', linetype=2) +
    geom_hline(yintercept=c(0, 1), size=0.5, colour='darkgrey') +
    geom_point() +
    expand_limits(y=c(0,1)) +
    opts()

  if(add_labels) p <- p + geom_dl(aes(x=x, y=predicted_y, colour=labeled_y, label=labeled_y), list('extreme.grid', cex=0.75))

  p
}
