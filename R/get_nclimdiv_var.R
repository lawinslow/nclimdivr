#' @title Get nClimDiv Variable
#'
#' @description
#' Return nclimDiv var filtered by supplied ID
#'
#'
#' @param ids Climate division site IDs of requested data (see \code{\link{climdiv_id_by_geo}}).
#' @param var The climate variable from nClimDiv dataset to return (only one at a time).
#'            See description for full list
#'
#' @description
#' \tabular{lll}{
#' Data \tab Long Name \tab Units\cr
#' tmp \tab Air Temperature \tab deg C \cr
#' pcp \tab Total Precipitation \tab meters/month\cr
#' pdsi \tab Palmer Drought Severity Index \tab Unitless\cr
#' }}
#'
#'
#'
#'
#'
#'
#' @export
get_nclimdiv_var = function(ids, var='tmp'){

  subset(nclimdiv[[var]], CLIMDIV %in% na.omit(ids))

}
