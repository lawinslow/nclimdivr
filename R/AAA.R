##AAA.R

nclimdiv = new.env()

nclimdiv$shape = rgdal::readOGR(system.file('extdata', 'climdivisions', package='nclimdivr'), layer = 'GIS.OFFICIAL_CLIM_DIVISIONS')

d = read.table(system.file('extdata', 'climdiv-tmpcdv-v1.0.0-20170206', package='nclimdivr'), header=FALSE, colClasses=c('character', rep('numeric',12)))

names(d) = c('metadata', paste0('X', 1:12))
d = as.data.frame(lapply(d, function(x){x[x < -99] = NA; x}))

d_long = reshape2::melt(d, id.vars='metadata', value.name = 'tmp')
d_long$month = as.numeric(gsub('X', '', d_long$variable))
d_long$variable = NULL
d_long$tmp = (d_long$tmp - 32)/1.8

d_long$year = as.numeric(substr(d_long$metadata,7,10))
d_long$CLIMDIV = as.numeric(substr(d_long$metadata,1,4))

nclimdiv$tmp = d_long


## snow
d = read.table(system.file('extdata', 'climdiv-pcpndv-v1.0.0-20170206', package='nclimdivr'), header=FALSE, colClasses=c('character', rep('numeric',12)))

names(d) = c('metadata', paste0('X', 1:12))
d = as.data.frame(lapply(d, function(x){x[x < -99] = NA; x}))

d_long = reshape2::melt(d, id.vars='metadata', value.name = 'pcp')
d_long$month = as.numeric(gsub('X', '', d_long$variable))
d_long$variable = NULL
d_long$pcp = (d_long$pcp/100)*0.0254

d_long$year = as.numeric(substr(d_long$metadata,7,10))
d_long$CLIMDIV = as.numeric(substr(d_long$metadata,1,4))

nclimdiv$pcp = d_long


## PDSI
d = read.table(system.file('extdata', 'climdiv-pdsidv-v1.0.0-20170206', package='nclimdivr'), header=FALSE, colClasses=c('character', rep('numeric',12)))

names(d) = c('metadata', paste0('X', 1:12))
d = as.data.frame(lapply(d, function(x){x[x < -99] = NA; x}))

d_long = reshape2::melt(d, id.vars='metadata', value.name = 'pdsi')
d_long$month = as.numeric(gsub('X', '', d_long$variable))
d_long$variable = NULL
#d_long$pdsi = (d_long$pdsi/100)*0.0254

d_long$year = as.numeric(substr(d_long$metadata,7,10))
d_long$CLIMDIV = as.numeric(substr(d_long$metadata,1,4))

nclimdiv$pdsi = d_long

