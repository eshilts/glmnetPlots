extract_min_1se_data <- function(cvg) {
  dat <- data.frame(label = c('Min', '1SE'), lambda=c(cvg[['lambda.min']], cvg[['lambda.1se']]))
  dat$negative_log_lambda <- -1 * log(dat$lambda)

  dat
}
