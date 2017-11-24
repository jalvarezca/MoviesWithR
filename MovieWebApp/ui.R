

library(shiny)
library(shinydashboard)
library(DT)
library(data.table)
source("./EDA.R")

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
                              title = "Controls", 
                              status = "warning", 
                              solidHeader = TRUE,  
                              collapsible = TRUE,
                              sliderInput("slider", "Number of observations:", 1, 30, 10)
                            )
                          ),
                          fluidRow(
                            box(title = "Information", 
                                status = "primary",
                                solidHeader = TRUE,
                                collapsible = FALSE,
                                background = "light-blue",
                                width = 400,
                                plotOutput("plot1", height = 350)
                                )
                            )
                          ),
              
                  
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
