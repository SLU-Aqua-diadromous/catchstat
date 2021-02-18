## Function slurp_xlsx()  ##################
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

##
#' Create (if needed) a folder to store files
#'
#' Utility function used to create a directory structure where you,
#' for example, store your results under a a folder for each year.
#' For example I save InterCatch import file in subfolders under "./import"
#'
#'
#' @param data_year the year that data stored belongs to (catch year)
#' @param toplevel toplevel folder that will hold sub-folders for each year Default "./import"
#'
#' @return character the path of the folder
#'
#' Returns a path to a folder that should hold data for a specific year. The year-subfolder is
#' placed under toplevel (default ./import). The folders are created if needed.
#'
#' @examples
#' odir <- output_folder(2019)
#'
#' @export
#'
output_folder <- function(data_year, toplevel = "./import") {
  #
  toplevel <- "./import"
  if (!file.exists(toplevel)) {
    dir.create(toplevel, recursive = TRUE)
  }
  odir <- file.path(toplevel, data_year)
  if (!file.exists(odir)) {
    dir.create(odir)
  }
  return(odir)
}


## Function DAT2year() ######
#' HaV date to year
#'
#' The HaV date format is an integer in the format YYYYMMDD
#'
#' This function returns the year as an integer.
#'
#' @param x integer a date in "HaV-format"
#'
#' @return
#' Return the year part of a date in "HaV-format"
#'
#' @examples
#' DAT2year(19610224)
#'
#' @export
DAT2year <- function(x) {
  return(floor(x / 10000))
}

## Function DAT2month() ######
#' HaV date to month
#'
#' The HaV date format is an integer in the format YYYYMMDD
#'
#' This function returns the month as an integer.
#'
#' @param x integer a date in "HaV-format"
#'
#' @return
#' Return the month part of a date in "HaV-format"
#'
#' @examples
#' DAT2month(20211224)
#'
#' @export
DAT2month <- function(x) {
  # Return the month number from a vector in HaV-dateformat.
  return(floor((x - (DAT2year(x) * 10000)) / 100))
}

## Function DAT2day() ######
#' HaV date to day
#'
#' The HaV date format is an integer in the format YYYYMMDD
#'
#' This function returns the day as an integer.
#'
#' @param x integer a date in "HaV-format"
#'
#' @return
#' Return the day part of a date in "HaV-format"
#'
#' @examples
#' DAT2day(20211224)
#'
#' @export
DAT2day<- function(x) {
  # Return the day number from a vector in HaV-dateformat.
  return(x - (floor(x/100) * 100))
}

## Function DAT2Date() ######
#' HaV date to Date
#'
#' The HaV date format is an integer in the format YYYYMMDD
#' This function returns the day as a R Date.
#'
#' @param x integer a date in "HaV-format"
#'
#' @return
#' Return the R Date converted from the input in "HaV-format"
#'
#' @seealso
#'
#' [base::Dates] for Date class,
#'
#' [DAT2year()] for year,
#' [DAT2month()] for month,
#' and [DAT2month()] for day.
#'
#' @examples
#' DAT2Date(20200617)
#'
#'
#' @export
DAT2Date <- function(x) {
  # Return the day number from a vector in HaV-dateformat.
  return(as.Date(as.character(x), format = "%Y%m%d"))
}
