## ---------------------------
## Assignment: Weeks 9 & 10 Exercise
##
## Author: Andrea Fox
##
## Date Created: 2021-02-14
## ---------------------------


## set working directory

setwd("C:/Users/andre/OneDrive/Anaconda3/envs/rstudio/DSC640 Data Presentation")    # Andrea's working directory

## ---------------------------

#Load libraries
library(readxl)
library(ggplot2)
library(tidyverse)
library(plotly)
library(dbplyr)
library(scales)
library(plotly)
library(maps)

#Read in files plan to use
costco <- read.csv("costcos-geocoded.csv")
costco

nba <- read.csv("ppg2008.csv")
nba

#Heat map using NBA points and reference page. Liked the heat colors better than example 
nba <- nba[order(nba$PTS),]
row.names(nba) <-nba$Name
nba <- nba[,2:20]
nba_matrix <- data.matrix(nba)
nba_heatmap <- heatmap(nba_matrix, Rowv=NA, Colv=NA, col = heat.colors(256), scale="column", margins=c(5,10))

#Spatial chart

#Close up of states
map(database = 'state', col = '#cccccc')
symbols(costco$Longitude, costco$Latitude, bg = '#e2373f', fg = '#ffffff',
        lwd = 0.5, circles = rep(1, length(costco$Longitude)), 
        inches = 0.05, add = TRUE)

#View with Hawaii and Alaska included
map(database = 'world', col = '#cccccc')
symbols(costco$Longitude, costco$Latitude, bg = '#e2373f', fg = '#ffffff',
        lwd = 0.5, circles = rep(1, length(costco$Longitude)), 
                      inches = 0.05, add = TRUE)

#Contour plot
#Using ggplot
of <- read.csv("faithful.csv")
of
f <- ggplot(of, aes(x = eruptions, y = waiting)) +
  geom_point() +
  xlim(0.5, 6) +
  ylim(40, 110) +
  ggtitle("Old Faithful Eruptions")

f + geom_density_2d_filled(alpha = 0.5) +
  geom_density_2d(size = 0.25, colour = "black")

#Using plotly
of_matrix <- data.matrix(of)
fig5 <- plot_ly(z = ~of_matrix, type = "contour")
fig5 <- fig5%>% layout(title = "Old Faithful Eruptions")
fig5
