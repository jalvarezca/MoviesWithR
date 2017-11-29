
library(shiny)
require(data.table)
require(DT)


source("./javierEDA.R")

server <- function(input, output) {
  
  # set.seed(122)
  # histdata <- rnorm(500)
  
  # output$plot1 <- renderPlot({
  #   data <- histdata[seq_len(input$slider)]
  #   hist(data)
  # })
  # output$plot1 <- renderPlot(
  #   plot(head(sortDirector,input$slider), type="o", col="blue")
  #   )
  
  output$plot1 <- renderPlot(
      ggplot(data = head(dirSortTotMovies,input$slider1)) +
        geom_bar(mapping = aes(x = director_name, y = total_movies , fill=director_name), stat = "identity")
      )
  
  output$plot2 <- renderPlot(
    ggplot(data = head(dirSortTotProfit,input$slider2)) +
      geom_bar(mapping = aes(x = director_name, y = total_profit , fill=director_name), stat = "identity")
  )

  
  output$moviesTable <- renderDataTable({
    Dtframe })
  
}