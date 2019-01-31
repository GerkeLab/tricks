cont_factor2 <- function(x,y){
  t.test(x~y)$p.value
}
