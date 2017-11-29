

library(shiny)
library(shinydashboard)
library(DT)
library(data.table)


dashboardPage(skin = "blue",
              dashboardHeader(title = "My Movies dashboard"),
              dashboardSidebar(
                sidebarMenu(
                  menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
                  menuItem("Raw Data", tabName = "rawdata", icon = icon("th"))
                )
              ),
              ## Body content
              dashboardBody(
                tabItems(
                  # First tab content
                  tabItem(tabName = "dashboard",
                          fluidRow(
                            box(
                              title = "Show_top_Directors", 
                              status = "warning", 
                              solidHeader = TRUE,  
                              collapsible = TRUE,
                              sliderInput("slider1", "Number of observations:", 1, 30, 10)
                            )
                          ),
                          fluidRow(
                            box(title = "Movies_by_Director", 
                                status = "primary",
                                solidHeader = TRUE,
                                collapsible = FALSE,
                                background = "light-blue",
                                width = 400,
                                plotOutput("plot1", height = 350)
                                )
                            ),
                          fluidRow(
                            box(
                              title = "Controls 2", 
                              status = "warning", 
                              solidHeader = TRUE,  
                              collapsible = FALSE,
                              sliderInput("slider2", "Number of observations2:", 1, 30, 10)
                            )
                          ),
                          fluidRow(
                            box(title = "Information 2", 
                                status = "primary",
                                solidHeader = TRUE,
                                collapsible = FALSE,
                                background = "light-blue",
                                width = 400,
                                plotOutput("plot2", height = 350)
                            )
                          )
                          
                          )
                  ,
             
                  # Second tab content
                  tabItem(tabName = "rawdata",
                          fluidRow(
                            box(dataTableOutput('moviesTable'), title = "Summary Table",
                                width = "300px"
                            )
                          )
                  )
                )
              )
)
