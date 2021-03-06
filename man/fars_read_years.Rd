% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/assignment_w2.R
\name{fars_read_years}
\alias{fars_read_years}
\title{Read Fatality Analysis Reporting System's data for years}
\usage{
fars_read_years(years)
}
\arguments{
\item{years}{Vector of years to be read.}
}
\value{
List with the dataframes for each year.
}
\description{
Reads the corresponding csv's for each of the years provided
}
\details{
If the file does not exist an error will be thrown.
}
\note{
this function depends on dplyr mutate and select functions
}
\examples{
\dontrun{fars_read_years(c("2013", "2014"))}

}
