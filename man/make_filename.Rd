% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/assignment_w2.R
\name{make_filename}
\alias{make_filename}
\title{Make filename}
\usage{
make_filename(year)
}
\arguments{
\item{year}{year of the filename to be created. Must be a number, either as char or as numeric.}
}
\value{
Filename composed as "accident_year.csv.bz2".
}
\description{
Creates the name of a FARS file for a specific year.
}
\examples{
\dontrun{make_filename("2020")}

}
