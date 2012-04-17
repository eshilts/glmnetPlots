#' Plot Cross Validation Path
#' @description Plots the cross validation path as seen in plot.cv.glmnet.
#' @param cvg cv.glmnet object
#' @author Erik Shilts
#' @returns ggplot2 grid object
#' @export
plot_cv_path <- function(cvg) {
  cv_path <- extract_cv_path(cvg)
  min_1se <- extract_min_1se_data(cvg)
  cv_path_min1se <- extract_min_1se_cv_path(cv_path, min_1se)

  p <- ggplot(cv_path, aes(x=negative_log_lambda)) +
    opts(title='Cross Validation Regularization Path', labels=c(x='-1 ln(lambda)', y='CV Error')) +
    geom_vline(aes(xintercept=negative_log_lambda), data=min_1se, linetype=2, colour='#616365') +
    geom_errorbar(aes(ymin=cvlo, ymax=cvup), colour='#ADAFAF') +
    geom_point(aes(y=cvm), colour=brand_colors()$Hex[1]) +
    geom_text(aes(y=cvup, label=type_label), data=cv_path_min1se, size=3.5, hjust=-0.25, vjust=-3) +
    geom_text(aes(y=cvup, label=dev.ratio_label), data=cv_path_min1se, size=3, hjust=-0.25, vjust=-2) +
    geom_text(aes(y=cvup, label=nzero_label), data=cv_path_min1se, size=3, hjust=-0.25, vjust=-0.75) +
    opts()

  p
}
