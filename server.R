#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

shinyServer(function(input, output) {
  xv <- reactive({input$xvalue})
  yv <- reactive({input$yvalue})
  smooth <- reactive({input$smooth})
  smoothMethod <- reactive({input$smoothMethod})
  alpha <- reactive({input$alpha})
  type <- reactive({input$type})
  
  output$scatter <- renderPlotly({

    p <- ggplot(wine, aes_string(x=xv(), y=yv()))+geom_point(alpha=alpha())

    if(type()) p <- p <- ggplot(wine, aes_string(x=xv(), y=yv(), color="type"))+
                          geom_point(alpha=alpha())
    if(smooth()) p <- p+geom_smooth(method=smoothMethod())
    ggplotly(p)
    
      })
  output$qlty <- renderPlotly({
    q <- ggplot(tidy, aes_string(x='qlty',fill="Attribute"))+geom_bar()+facet_grid(.~type)
  })
})

