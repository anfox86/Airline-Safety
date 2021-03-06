## ---------------------------
## Assignment:
##
## Author: Andrea Fox
##
## Date Created: 2021-03-06
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

#Read in file for histogram
education <- read.csv("education.csv")
education

#Histogram
hist(education$dropout_rate, 
     main = "Drop out rates from the United States",
     xlab = "Drop out rates",
     border = "blue", 
     col = 'green')

#Read in file for box chart
dodgers = read.csv('dodgers.csv')
dodgers

#Boxplot
boxplot(attend~shirt, data = dodgers, main = "Shirt Promotion by Attendance", xlab = "Shirt promotion", ylab = "Attendance")

#Read in file for bullet chart
perform <- read.csv("StudentsPerformance.csv")
perform

#Find mean of writing score
result.mean <- mean(perform$writing.score)
print(result.mean)

#Bullet chart
fig <- plot_ly(
  type = "indicator",
  mode = "number+gauge+delta",
  gauge = list(shape = "bullet",
               steps = list(
                 list(range = c(0,50), color = 'red'),
                 list(range = c(50, 75), color = 'yellow'),
                 list(range = c(75,100), color = 'green')),
               bar = list(color = 'black')),
  delta = list(reference = 100),
  value = 68.1,
  domain = list(x = c(0, 1), y = c(0, 1)),
  title= list(
    text = "Writing score",
    font = list(size = 7)),
  height = 150)

fig

#Read in file for my choice
crime <- read.csv("crimerates-by-state-2005.csv")
crime

#Drop United States and District of Columbia
crime2 <- crime[crime$state != 'United States', ]
crime2 <- crime2[crime2$state != 'District of Columbia', ]

#Scatter plot different than weeks 7&8
ggplot(crime2, aes(x= robbery, y = motor_vehicle_theft)) +
  geom_point(shape = 3, fill = 'blue', size = 3) +
  ggtitle("Comparison of Robbery and Motor Vehicle Theft") +
  xlab("Robberies") +
  ylab("Motor Vehicle Thefts")

