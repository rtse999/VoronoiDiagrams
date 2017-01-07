#
# Plotting Sydney SMART locations with Voronoi Diagrams & ggplot 
#
# References:
# http://letstalkdata.com/2014/05/creating-voronoi-diagrams-with-ggplot/
# https://blog.dominodatalab.com/geographic-visualization-with-rs-ggmaps/
# https://github.com/dkahle/ggmap
#
# Location: https://github.com/rtse999/VoronoiDiagrams.git
# First created: 10:45 - Wednesday 4 January 2017
# Last modified: 17:23 - Saturday 7 January 2017
#

# Libraries
library(ggplot2)
library(deldir)
# Important: Install the latest version of library(ggmap) from 
# https://github.com/dkahle/ggmap rather than CRAN (which is 2 versions behind)
library(ggmap)

# Create location data
options(digits=16)
locations <- read.csv("~/Dropbox/Analysis/VoronoiDiagrams/Data/Locations.txt")

# Create Voronoi line segments
voronoi <- deldir(locations$Longitude, locations$Latitude)

# Get Google map of Sydney
sydneyMap <- ggmap(get_googlemap(center=c(lon=151.0011, lat=-33.8150)))

sydneyMap + 
  #Plot the voronoi lines
  geom_segment( 
  aes(x = x1, y = y1, xend = x2, yend = y2),
  size = 2,
  data = voronoi$dirsgs,
  linetype = 1,
  color= "#FFB958") +
  #Plot the points
  geom_point(data=locations, aes(x=Longitude,y=Latitude), size=3, col="#FF0000")

