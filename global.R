library(shiny)
library(dplyr)
library(ggplot2)
library(plotly)
library(metricsgraphics)
library(scatterD3)
library(jsonlite)
library(htmltools)
library(RColorBrewer)
library(tidyr)

wine <- read.csv("winedata.csv")
wine$quality <- as.numeric(wine$quality)
wine <- mutate(wine, qlty=ifelse(quality<=3,"poor",ifelse(quality<=6,"average","good")))


tidy <- gather(wine, Attribute, Value, fixed.acidity:quality)
tidy$qlty <- as.factor(tidy$qlty)
tidy$Attribute <- as.factor(tidy$Attribute)

qt <- tidy%>%group_by(qlty, Attribute)%>%summarise(avg=mean(Value))
