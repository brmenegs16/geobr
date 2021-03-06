#' Download shape files of official metropolitan areas in Brazil as an sf object.
#'
#' The function returns the shapes of municipalities grouped by their respective metro areas.
#' Metropolitan areas are created by each state in Brazil. The data set includes the municipalities that belong to
#' all metropolitan areas in the country according to state legislation in each year. Orignal data were generated
#' by Institute of Geography. Data at scale 1:250,000, using Geodetic reference system "SIRGAS2000" and CRS(4674).
#'
#'
#' @param year A year number in YYYY format (defaults to 2018)
#' @param simplified Logic TRUE or FALSE, indicating whether the function returns the 'original' dataset with high resolution or a dataset with 'simplified' borders (Defaults to TRUE)
#' @param showProgress Logical. Defaults to (TRUE) display progress bar
#' @param tp Argument deprecated. Please use argument 'simplified'
#'
#' @export
#' @examples \dontrun{
#'
#' library(geobr)
#'
#' # Read all official metropolitan areas for a given year
#'   m <- read_metro_area(2005)
#'
#'   m <- read_metro_area(2018)
#' }
#'
#'
#'
read_metro_area <- function(year=2018, simplified=TRUE, showProgress=TRUE, tp){

  # deprecated 'tp' argument
  if (!missing("tp")){stop(" 'tp' argument deprecated. Please use argument 'simplified' TRUE or FALSE")}

  # Get metadata with data url addresses
  temp_meta <- select_metadata(geography="metropolitan_area", year=year, simplified=simplified)

  # list paths of files to download
  file_url <- as.character(temp_meta$download_path)

  # download files
  temp_sf <- download_gpkg(file_url, progress_bar = showProgress)
  return(temp_sf)
}
