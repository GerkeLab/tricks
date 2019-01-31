cont_factor2 <- function(x,y){
  p <- t.test(x~y)$p.value
  
  return(p)
}
