## ---------------------------
## Assignment: Exercise 4.2 - Scatter plots, bubble plots, and density plots
##
## Author: Andrea Fox
##
## Date Created: 2021-01-30
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

#Read in file
crime <- read.csv("crimerates-by-state-2005.csv")
crime

#Drop United States and District of Columbia
crime2 <- crime[crime$state != 'United States', ]
crime2 <- crime2[crime2$state != 'District of Columbia', ]

#Scatter plot
fig <- plot_ly(x = crime2$aggravated_assault, y = crime2$motor_vehicle_theft, text = crime2$state, type = 'scatter')
fig <- fig%>% layout(title = 'Aggravated Assault versus Motor Vehicle Theft', xaxis = list(title = 'Aggravated Assault', color = 'grey'), yaxis = list(title = 'Motor Vehicle Theft', color = 'grey'))
fig

#Bubble plot
ggplot(crime2, aes(x = burglary, y = motor_vehicle_theft, size = population)) +
  geom_point(alpha = 0.5, color = 'purple') +
  scale_size(range = c(.1, 15), name = 'Population', trans = 'log') +
  ggtitle("Burglaries versus Motor Vehicle Thefts") +
  xlab("Burglaries") +
  ylab("Motor Vehicle Thefts") 

#Density plot 
p <- ggplot(crime2, aes(x = murder)) +
  geom_density(color = 'darkblue', fill = 'lightblue') +
  ggtitle('Density of Murder rates') +
  xlab('Murders') +
  ylab('Density')
p
