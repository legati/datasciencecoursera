
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
statNames <- gsub(' ', '.', colnames(state.x77))

shinyUI(fluidPage(

  # Application title
  titlePanel(""),


  sidebarLayout(
    sidebarPanel(
      selectInput("info",
                  "Select a statistic:",
                  choices = statNames),
      checkboxInput('top10', 'Show top 10 states'),
      submitButton('Submit')
    ),

    mainPanel(
      h3('US Statistics Map'),
      br(),
      textOutput('text1'),
      htmlOutput("geoPlot"),
      br(),
      htmlOutput('table')
    )
  )
))
