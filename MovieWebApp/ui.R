

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
                              collapsible = FALSE,
                              sliderInput("slider", "Number of observations:", 1, 100, 50)
                            )
                          ),
                          fluidRow(
                            box(title = "Information", 
                                status = "primary",
                                solidHeader = TRUE,
                                collapsible = FALSE,
                                background = "light-blue",
                                plotOutput("plot1", height = 250))
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
