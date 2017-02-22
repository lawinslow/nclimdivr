#' @title Get nClimDiv Variable
#'
#' @description
#' Return nclimDiv var filtered by supplied ID
#'
#'
#'
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
