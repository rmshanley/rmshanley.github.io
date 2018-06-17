#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI 
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Confidence Interval Calculator"),
  p("This simple program can be used for demonstrating confidence intervals for proportions.  
    Enter the sample proportion and sample size using the sliders on the left. 
    For example, suppose one makes 20 observations and 10 have the property of interest. 
    Set the sample size to 20 and the sample proportion to 0.5 (10/20).  
    The 90% and 95% confidence limits will automatically update. 
    Checking and unchecking the boxes will show/hide the respective interval on the plot."),
  
  # Sidebar with input for sample proportion and sample size
  sidebarLayout(
    sidebarPanel(
       sliderInput("proportion",
                   "Sample Proportion:",
                   min = 0,
                   max = 1,
                   value = 0.5),
       sliderInput("size",
                   "Sample Size:",
                   min = 1,
                   max = 100,
                   value = 20),
       checkboxInput("show_ci90","Show 90% Confidence Interval", TRUE),
       checkboxInput("show_ci95","Show 95% Confidence Interval", TRUE)
    ),
    
    # Display the 90% and 95% confidence intervals for the values in the sidebar inputs
    mainPanel(
       span(textOutput("ci90"), style="color:blue"),
       span(textOutput("ci95"), style="color:red"),
       plotOutput("ciPlot")
    )
  )
))
