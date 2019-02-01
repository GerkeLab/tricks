trick <- function(dat = iris) {
  # get all pairwise combinations of columns
  combs <- combn(names(dat), 2)

  # initialize p value
  p <- 1
  for (i in 1:ncol(combs)) {
    x <- combs[1,i]
    y <- combs[2,i]

    # store class of x and y

    # compute a p-value based on x/y classes

    if(p < .05) {
      # out <- the formula that led to the significant result
      break
    }
  }
}
