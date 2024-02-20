### Docs data.frame "gear" ############################################
#' Names, code number and miscellaneous data of gear types
#'
#' A dataset describing fishing gear used in data files with catches reported
#' to HaV from commercial fishermen.
#'
#' @format A data frame with 10 variables:
#' \describe{
#'   \item{REDSKAP}{gear name in Swedish}
#'   \item{REDSKAPENG}{gear name in English}
#'   \item{REDSKKOD}{numeric code for gear}
#'   \item{AP}{Gear is "Passivt" or "Aktivt"}
#'   \item{EUKODNY}{Some other classification}
#'   \item{FR}{Gear is "Fast" or "Rörligt"}
#'   \item{FAOKODNY}{Some other classification}
#' }
"gear"

### Docs data.frame "species2 ############################################
#' Names, code number and miscellaneous data of gear types
#'
#' A dataset with commercially fished species. Each species is
#' described with a three character long code (MAF/FAO), english
#' common name and swedish common name.
#'
#' @format A data frame with 3 variables:
#' \describe{
#'   \item{MAFKOD}{a three charatcter long code (MAF/FAO), E.g. SAL and TRS}
#'   \item{Species}{English common name, e.g. Salmon and Trout}
#'   \item{Art}{Swedish common name, e.g. Lax and Öring}
#' }
"species"


### Docs data.frame "ackflagg ############################################
#' Code number and description
#'
#' A dataset with commercially fished species. Each species is
#' described with a three character long code (MAF/FAO), english
#' common name and swedish common name.
#'
#' @format A data frame with 3 variables:
#' \describe{
#'   \item{numeric}{code for fate of catch}
#'   \item{TEXT}{Description in Swedish}
#' }
"ackflagg"
