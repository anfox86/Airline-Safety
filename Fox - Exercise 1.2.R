## ---------------------------
## Assignment:
##
## Author: Andrea Fox
##
## Date Created: 2020-12-07
## ---------------------------


## set working directory

setwd("C:/Users/andre/OneDrive/Anaconda3/envs/rstudio/DSC640 Data Presentation")    # Andrea's working directory

## ---------------------------

library(readxl)
library(ggplot2)
library(tidyverse)

#Read in first file for the bar chart
hd <- read_excel('hotdog-contest-winners.xlsm')
hd

#Create bar chart
ggplot(hd, aes(x=Country, y=Dogs_eaten)) +
  geom_bar(stat = "identity", fill = 'steelblue')+
  ggtitle("Number of Hotdogs Eaten by Country")+
  theme_minimal()

#Read in second file for the stacked bar chart
wc = read.csv('WorldCups.csv')
wc

#Stacked bar chart
ggplot(wc, aes(x=Winner, y= GoalsScored, fill=MatchesPlayed))+
  geom_bar(stat = "identity")+
  scale_x_discrete(guide = guide_axis(angle = 90))+
  ggtitle("World Cup Winners By Goals Scored and Matches Played")

#Read in third file for the pie and donut charts
obama <- read_excel('obama-approval-ratings.xls')
obama

#Set up for pie and donut charts
#Creating smaller dataframe from original dataset
dat <- data.frame(count=c(obama$Approve), category=c(obama$Issue))

#Compute percentages
dat$fraction = dat$count / sum(dat$count)

#Compute the cumulative percentages 
dat$ymax = cumsum(dat$fraction)

#Compute the bottom of each rectangle
dat$ymin = c(0, head(dat$ymax, n=-1))

#Compute label position
dat$labelPosition <- (dat$ymax + dat$ymin) / 2

#Compute a good label
dat$label <- paste0(dat$category, "\n value: ", dat$count)

#Pie chart
ggplot(dat, aes(ymax=ymax, ymin=ymin, xmax=4, xmin=3, fill=category)) +
  geom_rect() +
  geom_label( x=4, aes(y=labelPosition, label=label), size=3) +
  ggtitle("Approval Ratings by Issue") +
  coord_polar(theta="y") + 
  theme_void() 

#Donut chart
ggplot(dat, aes(ymax=ymax, ymin=ymin, xmax=4, xmin=3, fill=category)) +
  geom_rect() +
  geom_label( x=4, aes(y=labelPosition, label=label), size=3) +
  ggtitle("Approval Ratings by Issue") +
  coord_polar(theta="y") + 
  theme_void() +
  xlim(c(2, 4))
