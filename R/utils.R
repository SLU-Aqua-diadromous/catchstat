
#' Read several Excel files and return the concatenated data
#'
#' @param fnames Character vector with one or more file namns
#'
#' @return
#' @export
#'
#' @examples
slurp_xlxs <- function(fnames) {
  res <- lapply(fnames, readxl::read_xlsx) %>%
    dplyr::bind_rows()
  return(res)
}
