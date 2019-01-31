factor_factor <- function(x,y){
 p <- chisq.test(x,y)$p.value
 
 return(p)
}
