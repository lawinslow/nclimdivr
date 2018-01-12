## process nclimdiv shapefile to centroids for quick projects

library(rgdal)
library(rgeos)
divisions = readOGR('inst/extdata/climdivisions/GIS.OFFICIAL_CLIM_DIVISIONS.shp')

centroids = gCentroid(divisions, byid=TRUE)

divlatlon = data.frame(CLIMDIV=divisions@data$CLIMDIV, lon=centroids@coords[,1], lat=centroids@coords[,2])

write.table(divlatlon, file='data/divlatlon.csv', row.names=FALSE, sep=';')
