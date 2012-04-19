extract_logistic_response_data <- function(x, y, cvg) {
  dat <- data.frame(y=y, predicted_y=predict(cvg, s='lambda.min', newx=as.matrix(x), type='response')[, 1])
  dat <- dat[order(dat$predicted_y), ]
  dat$x <- 1:nrow(dat)

  dat
}
