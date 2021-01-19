## ---------------------------
## Assignment: Weeks 5&6 Exercise - Tree map, area chart, and stacked area chart
##
## Author: Andrea Fox
##
## Date Created: 2021-01-17
## ---------------------------


## set working directory

setwd("C:/Users/andre/OneDrive/Anaconda3/envs/rstudio/DSC640 Data Presentation")    # Andrea's working directory

## ---------------------------

#Load in libraries
library(readxl)
library(ggplot2)
library(tidyverse)
library(scales)
library(treemap)
library(plotly)

#Load in data using for tree map
animal <- read.csv("animal-population-by-breed-on_1-march-2010.csv")
animal

#Using filter only get number of animals greater than 100,000
a <- filter(animal, animal$Number.of.Animals> 100000)

#Creating treemap
treemap(a, index = c("Breed"), vSize = "Number.of.Animals", title = "Number of Animals > 100,000 by Breed", fontsize.labels = c(9,10))

#Load in the unemployment data for the area charts
data <- read.csv("unemployement-rate-1948-2010.csv")
data

#Area chart
fig <- plot_ly(x = data$Year, y = data$Value, type = 'scatter', mode = 'lines', fill = 'tozeroy')
fig <- fig%>% layout(title = 'Unemployment Rate by Year', xaxis = list(title = 'Year'), yaxis = list(title = 'Value'))
fig

#Stacked area chart
ggplot(data, aes(x = Year, y = Value, fill = Period))+
  geom_area()+
  ggtitle("Unemployment Rate by Year and Month")

