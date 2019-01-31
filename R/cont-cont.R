cont_cont <- function(x, y) {
  p <- cor.test(x, y)$p.value

  return(p)
}
