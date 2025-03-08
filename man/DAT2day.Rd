% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils.R
\name{DAT2day}
\alias{DAT2day}
\title{HaV date to day}
\usage{
DAT2day(x)
}
\arguments{
\item{x}{integer a date in "HaV-format"}
}
\value{
Return the day part of a date in "HaV-format"
}
\description{
The HaV date format is an integer in the format YYYYMMDD
}
\details{
This function returns the day as an integer.
}
\examples{
DAT2day(20211224)

}
