#' Plot Cross Validation Path
#' @description Plots the cross validation path as seen in plot.cv.glmnet.
#' @param cvg cv.glmnet object
#' @param \dots additional plotting arguments
#' @author Erik Shilts
#' @returns ggplot2 grid object
#' @export
plot_cv_path <- function(cvg, ...) {
  cv_path <- extract_cv_path(cvg)
  min_1se <- extract_min_1se_data(cvg)

  fun_args <- list(...)

  title_base <- 'Cross Validation Regularization Path'
  plot_title <- if(is.null(fun_args$plot_title)) title_base else fun_args$plot_title

  p <- ggplot(cv_path, aes(x=negative_log_lambda)) +
    opts(title=plot_title, labels=c(x='-1 ln(lambda)', y='CV Error')) +
    geom_vline(aes(xintercept=negative_log_lambda), data=min_1se, linetype=2, colour='#616365') +
    geom_errorbar(aes(ymin=cvlo, ymax=cvup), colour='#ADAFAF') +
    geom_point(aes(y=cvm), colour=brand_colors()$Hex[1]) +
    geom_text(aes(y=max_cvup, label=type_label, hjust=type_hjust), data=min_1se, size=3.5, vjust=-1) +
    geom_text(aes(y=max_cvup, label=dev.ratio_label, hjust=type_hjust), data=min_1se, size=3, vjust=0.25) +
    geom_text(aes(y=max_cvup, label=nzero_label, hjust=type_hjust), data=min_1se, size=3, vjust=1.75) +
    opts()

  p
}
