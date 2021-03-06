% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/assignment_w2.R
\name{fars_read}
\alias{fars_read}
\title{Read Fatality Analysis Reporting System's data}
\usage{
fars_read(filename)
}
\arguments{
\item{filename}{Name of the file to be read.}
}
\value{
Either a tibble dataframe with the data or a error message indicating that the file doesn't exist.
}
\description{
Reads a csv file, checking if the file truly exists or not
}
\details{
If it doesn't exist, an error will be thrown
}
\note{
fars_read depends on read_csv and tbl_df from the readr and dplyr packages respectively.
}
\examples{
\dontrun{fars_read("accident_2013.csv.bz2")}

}
