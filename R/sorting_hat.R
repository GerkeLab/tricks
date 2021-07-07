#' Gather information about the data variables
#'
#' @param df The input data frame
#' @export
sorting_hat <- function(df) {
  x <- purrr::map(df, class) %>%
    purrr::map_dfr(~ data.frame(type = ., stringsAsFactors = FALSE), .id = "col_name") %>%
    dplyr::mutate(
      n_unique   = purrr::map_int(df, ~ length(unique(.))),
      n_complete = purrr::map_int(df, ~ length(.x[!is.na(.x)]))
    )

  x$cv <- purrr::map_dbl(x$col_name, ~ cov(df[[.]]))

  x
}

cov <- function(x) {
  if (!inherits(x, "numeric")) return(NA_real_)
  sd(x, TRUE)/mean(x, na.rm = TRUE)
}

#' Pre-sorting processing of data
#'
#' Cast character columns to factors.
#'
#' @param df The input data frame
#' @export
pre_sort <- function(df) {
  df %>%
    dplyr::mutate_if(is.character, as.factor)
}
