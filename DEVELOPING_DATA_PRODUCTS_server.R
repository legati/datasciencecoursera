
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(googleVis)

shinyServer(function(input, output) {
  
  stateDF <- data.frame(State = state.name, state.x77)
  colnames(stateDF) <- c('State', gsub(' ', '.', colnames(state.x77)))
  descr <- data.frame(Stat = colnames(stateDF[,-1]), 
                     Description = c(
                    'Population estimate as of July 1, 1975',
                    'Per capita income (1974)',
                    'Illiteracy (1970, percent of population)',
                    'Life expectancy in years (1969–71)',
                    'Murder and non-negligent manslaughter rate per 100,000 
                     Population (1976)',
                    'Percent high-school graduates (1970)',
                    'Mean number of days with minimum temperature below 
                     freezing (1931–1960) in capital or large city',
                    'Land area in square miles'),
                    stringsAsFactors = FALSE)
  output$geoPlot <- renderGvis({
    gvisGeoChart(data = stateDF,
                          locationvar = "State",
                          colorvar = input$info,
                          options = list(region="US",
                                         displayMode="regions",
                                         resolution="provinces",
                                         width=500, height=300))
  })
  
  output$text1 <- renderText({
    descr[which(descr[,1] == input$info),2]
  })
  

  output$table <- renderGvis({
    if (input$top10) {
    sortedDF <- head(stateDF[order(stateDF[,input$info], decreasing = TRUE),],10)
    gvisTable(sortedDF[,c('State', input$info)], 
              options = list(width=500, height=300))
    }
  })

})
