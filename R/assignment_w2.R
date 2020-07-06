#' Read Fatality Analysis Reporting System's data
#'
#' Reads a csv file, checking if the file truly exists or not
#'
#' If it doesn't exist, an error will be thrown
#'
#' @importFrom readr read_csv
#' @importFrom dplyr tbl_df
#'
#' @note fars_read depends on read_csv and tbl_df from the readr and dplyr packages respectively.
#'
#' @param filename Name of the file to be read.
#'
#' @return Either a tibble dataframe with the data or a error message indicating that the file doesn't exist.
#'
#' @examples
#' \dontrun{fars_read("accident_2013.csv.bz2")}
#'
#' @export

 fars_read <- function(filename) {
        if(!file.exists(filename))
                stop("file '", filename, "' does not exist")
        data <- suppressMessages({
                readr::read_csv(filename, progress = FALSE)
        })
        dplyr::tbl_df(data)
 }

#' Make filename
#'
#' Creates the name of a FARS file for a specific year.
#'
#' @param year year of the filename to be created. Must be a number, either as char or as numeric.
#'
#' @return Filename composed as "accident_year.csv.bz2".
#'
#' @examples
#' make_filename("2020")
#'
#' @export
#' \dontrun{
#' make_filename <- function(year) {
#'        year <- as.integer(year)
#'         sprintf("accident_%d.csv.bz2", year)
#' }
#' }
#'g
#' Read Fatality Analysis Reporting System's data for years
#'
#' Reads the corresponding csv's for each of the years provided
#'
#' If the file does not exist an error will be thrown.
#'
#' @param years Vector of years to be read.
#'
#' @importFrom dplyr mutate select %>%
#'
#' @note this function depends on dplyr mutate and select functions
#'
#' @return List with the dataframes for each year.
#'
#' @examples
#' fars_read_years(c("2013", "2014"))
#'
#' @export
#' \dontrun{
#' fars_read_years <- function(years) {
#'        lapply(years, function(year) {
#'                file <- make_filename(year)
#'                tryCatch({
#'                        dat <- fars_read(file)
#'                        dplyr::mutate(dat, year = year) %>%
#'                                dplyr::select(MONTH, year)
#'                }, error = function(e) {
#'                        warning("invalid year: ", year)
#'                        return(NULL)
#'                })
#'        })
#' }
#' }
#'
#' Summarize FARS data
#'
#' Returns a summary of the number of entries on each month and year
#'
#' @param years Vector of years to be evaluated.
#'
#' @importFrom dplyr bind_rows group_by summarize
#' @importFrom tidyr spread
#'
#' @note This functions depends on the bind_rows, group_by, summarize functions from dplyr and spread from tidyr
#'
#' @return Dataframe with summary
#'
#' @importFrom
#'
#' @examples
#' fars_summarize_years(c("2013", "2014"))
#'
#' @export
#' \donrun{
#' fars_summarize_years <- function(years) {
#'        dat_list <- fars_read_years(years)
#'        dplyr::bind_rows(dat_list) %>%
#'                dplyr::group_by(year, MONTH) %>%
#'                dplyr::summarize(n = n()) %>%
#'                tidyr::spread(year, n)
#' }
#' }
#' FARS Map state
#'
#' Plot accidents occurred on a specific state for a given year
#' If there is no data for a state, the function will stop and throw an error.
#'
#' @param state.num State number.
#' @param year Year in which the accidents to be plotted occurred.
#'
#' @importFrom maps map
#' @importFrom graphics points
#' @importFrom dplyr filter
#'
#' @note This function depends on map and points functions from the maps and graphics package respectively.
#'
#' @return Map with accidents plotted
#'
#' @examples
#' fars_map_state("1", "2013")
#'
#' @export
#'\dontrun{
#' fars_map_state <- function(state.num, year) {
#'        filename <- make_filename(year)
#'        data <- fars_read(filename)
#'        state.num <- as.integer(state.num)
#'
#'        if(!(state.num %in% unique(data$STATE)))
#'                stop("invalid STATE number: ", state.num)
#'        data.sub <- dplyr::filter(data, STATE == state.num)
#'        if(nrow(data.sub) == 0L) {
#'                message("no accidents to plot")
#'                return(invisible(NULL))
#'        }
#'        is.na(data.sub$LONGITUD) <- data.sub$LONGITUD > 900
#'        is.na(data.sub$LATITUDE) <- data.sub$LATITUDE > 90
#'        with(data.sub, {
#'                maps::map("state", ylim = range(LATITUDE, na.rm = TRUE),
#'                          xlim = range(LONGITUD, na.rm = TRUE))
#'                graphics::points(LONGITUD, LATITUDE, pch = 46)
#'        })
#' }
#' }
