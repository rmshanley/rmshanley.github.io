#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(Hmisc)

shinyServer(function(input, output) {
  
  ci90.values <- reactive({
    round(binconf(input$proportion * input$size, input$size, alpha=0.10), 2)
  })
  
  ci95.values <- reactive({
    round(binconf(input$proportion * input$size, input$size, alpha=0.05), 2)
  })

  output$ci90 <- renderText({
    paste("The 90% confidence limits are", ci90.values()[2], "and", ci90.values()[3])
  })
  
  output$ci95 <- renderText({
    paste("The 95% confidence limits are", ci95.values()[2], "and", ci95.values()[3])
  })
  
  output$ciPlot <- renderPlot({
    plot(0.5, 0, type="n", axes=F, xlab="Proportion", ylab="", xlim = c(0,1), ylim = c(-1,4))
    axis(1, seq(0,1,0.2))
    
    if(input$show_ci95) { 
      points(ci95.values(), rep(0, 3), pch=19, cex=1.5, col="red")
      segments(ci95.values()[2], 0, ci95.values()[3], lwd=2, col="red")
    }
    
    if(input$show_ci90) { 
      points(ci90.values(), rep(0, 3), pch=19, cex=1.5, col="blue")
      segments(ci90.values()[2], 0, ci90.values()[3], lwd=2, col="blue")  
    }
    
    points(input$proportion, 0, pch=19, cex=2)
  })
  
})
