#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Wine Data Plots"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       selectInput(inputId="xvalue",
                   label = "Value for X-axis",
                   choices = c(names(wine))        
                  ),
       selectInput(inputId="yvalue",
                   label = "Value for Y-axis",
                   choices = c(names(wine))
       ),
       sliderInput(inputId="alpha",label="Opacity",min=0.01,max=1,value=1, step=0.05),
       checkboxInput("smooth", "Smooth"),
       conditionalPanel(
         condition = "input.smooth == true",
         selectInput("smoothMethod", "Method",
                     list("lm", "glm", "gam", "loess"))
       ),
       checkboxInput("type", "Segregate by Wine Type")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotlyOutput("scatter")
      #plotlyOutput("box")
    )
  )
))
