
library(shiny)
require(data.table)
require(DT)


source("./EDA.R")

server <- function(input, output) {
  
  set.seed(122)
  histdata <- rnorm(500)
  
  # output$plot1 <- renderPlot({
  #   data <- histdata[seq_len(input$slider)]
  #   hist(data)
  # })
  output$plot1 <- renderPlot(plot(sortDirector, type="o", col="blue"))
  
  output$moviesTable <- renderDataTable({
    Dtframe })
  
}