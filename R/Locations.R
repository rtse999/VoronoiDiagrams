#
# Creating Voronoi Diagrams with ggplot (http://letstalkdata.com/2014/05/creating-voronoi-diagrams-with-ggplot/)
#
# Location: https://github.com/rtse999/VoronoiDiagrams.git
# First created: 10:45 - Wednesday 4 January 2017
# Last modified: 10:45 - Wednesday 4 January 2017
#

# Libraries
library(ggplot2)
library(deldir)

# Create some random data
options(digits=16)
locations <- read.csv("~/Dropbox/Analysis/VoronoiDiagrams/Data/Locations.txt")

# Create Voronoi line segments
voronoi <- deldir(df$long, df$lat)

# Plotting the Voronoi Diagram
ggplot(data=df, aes(x=long,y=lat)) +
  #Plot the voronoi lines
  geom_segment(
    aes(x = x1, y = y1, xend = x2, yend = y2),
    size = 2,
    data = voronoi$dirsgs,
    linetype = 1,
    color= "#FFB958") + 
  #Plot the points
  geom_point(
    fill=rgb(70,130,180,255,maxColorValue=255),
    pch=21,
    size = 4,
    color="#333333")

# Plotting the Delaunay triangulation
ggplot(data=df, aes(x=long,y=lat)) +
  #Plot the voronoi lines
  geom_segment(
    aes(x = x1, y = y1, xend = x2, yend = y2),
    size = 2,
    data = voronoi$delsgs,
    linetype = 1,
    color= "#FFB958") + 
  #Plot the points
  geom_point(
    fill=rgb(70,130,180,255,maxColorValue=255),
    pch=21,
    size = 4,
    color="#333333")