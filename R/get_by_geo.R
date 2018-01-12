#' @title Get Climate Division ID for Location
#'
#'
#'
#' @description
#'
#'
#'
#'
#'@import rgdal
#'@import sp
#'
#'
#'
#'
#' @export
climdiv_id_by_geo = function(lat, lon, var='tmp'){

  #new try
  ids = rep(NA, length(lat))
  not_na = which(!is.na(lat) & !is.na(lon))

  xy = cbind(lon, lat)

  pts = SpatialPoints(xy[not_na, ,drop=FALSE], proj4string=CRS(proj4string(nclimdiv$shape)))

  CLIMDIV = as.character(over(pts, nclimdiv$shape, fn = NULL, returnList = FALSE)$CLIMDIV)
  ids[not_na] = CLIMDIV

  #return(subset(nclimdiv[[var]], CLIMDIV %in% na.omit(ids)))

  return(ids)

}
