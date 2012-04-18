extract_min_1se_cv_path <- function(cv_dat, min1se_dat) {
  dat <- cv_dat[cv_dat$lambda %in% min1se_dat$lambda, ]
  dat$type_label <- c('1SE', 'Min')
  dat$type_hjust <- c(1.1, -0.25)
  dat$dev.ratio_label <- concat('R-sq: ', round(dat$dev.ratio, 3))
  dat$nzero_label <- concat('# Vars: ', dat$nzero)

  dat
}
