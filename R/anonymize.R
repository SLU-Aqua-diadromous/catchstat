## Function anonymize ##########
#' Read Excel-file and anonymize some columns
#'
#' Function anonymize reads a file with (catch) data + data
#' about individual fishermen. This can make the file difficult to work
#' with in a GDPR safe way. The data can saved as two files a file with
#' the sensitive data columns replaced with one column with an
#' anonymous id and one file with the personal data and the
#' anon_id. If you save a file with personal data it should be stored in
#' a secure location with limited access.
#'
#' @param x data.frame with catch data as requested from Hav
#' @param columns Columns to anonymize and remove from output
#'
#' @return
#' Return a list with two tibbles named "anonymized_data" and "id2data".
#' In "anonymized_data" the columns specified in parameter "columns" are
#' replace with a single column "anon_id". The tibble "id2data" contains
#' the removed columns + the "anon_id" making it possible join the removed
#' columns back to the data if needed.
#'
#'
#' @examples
#'\dontrun{
#' result <- anonymize(catchdata)
#'}
#'
#' @export
anonymize <- function(x,
                      columns =  c("SIGNAL", "DISTRIKT", "BATNAMN", "PNR_DAT", "PNR_SLUT",
                                         "NAMN")) {
  # if (!file.exists(fnam)) {
  #   stop("file ", fnam, " does not exist.")
  # }
  # indata <- readxl::read_excel(fnam)

  ## If we have missing columns add them with value NA
  missing_cols <- columns[!(columns %in% names(x))]
  for (mcol in missing_cols) {
    x[[mcol]] <-  NA
  }
  ## Create a data frame with all personal data concatenated as a new column
  temp_data <- x %>%
    tidyr::unite("personal_data", tidyselect::all_of(columns), remove = FALSE)
  ## Add column anon_id as a sha256 hash of personal_data
  vdigest <- Vectorize(digest::digest) # digest() isn't vectorized, make a vectorized version
  temp_data$anon_id <- vdigest(temp_data$personal_data, algo="sha256")
  ##
  id2data <- temp_data %>%
    dplyr::select(tidyselect::all_of(c("anon_id", columns))) %>%
    dplyr::distinct()
  anonymized_data <- temp_data %>%
    dplyr::select(-tidyselect::all_of(c("personal_data", columns)))

  return(list(anonymized_data = anonymized_data, id2data = id2data))
}
#
