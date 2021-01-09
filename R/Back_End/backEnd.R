library(shinydashboard)
library(shiny)
library(stringr)
library(dplyr)
library(ggplot2)
library(tidyverse)
library(lubridate)
library(plotly)
library(data.table)
library(lubridate)
library(RCurl)
require(plotly)
library(tidyr)
library("ggplot2")
library("forecast")
library("tseries")
library(shinycssloaders)
library(readr)
library(rlang)
source("InputTab_B.R")
source("VizTab_B.R")

# Options for Spinner
options(spinner.color = "#0275D8", spinner.color.background = "#ffffff", spinner.size = 2)


options(shiny.maxRequestSize = 30 * 1024^2)

server <- function(input, output, session) {








  ################ Import Tab #########################

  ############ Read the imported csv file ######################

 # data <- readUploadedCSVData(input, output, session)
  data <- InputTabServer("readUploadedCSVData")

  ########### Vizualization Tab #################

 # displayDynamicUI() # contain all the options
#  addLinePlot()
  addVizServer("Viz",data)



  ##################### PREDICTION #########################

  output$y_variable <- renderUI({
    if (input$algo == "ARIMA") {
      choices <- unique(colnames(data()))
      selectInput("y_variable1",
                  "What to Predict",
                  choices = choices,
                  multiple = TRUE
      )
    }
  })

  output$y_variable <- renderUI({
    if (input$algo == "ARIMA") {
      choices <- unique(colnames(data()))
      selectInput("y_variable1",
                  "What to Predict",
                  choices = choices,
                  multiple = TRUE
      )
    }
  })

  output$P <- renderUI({
    if (input$algo == "ARIMA") {
      numericInput("P1",
                   h3("Auto Regressive Coeffcienct (P)"),
                   value = 1
      )
    }
  })

  output$Q <- renderUI({
    if (input$algo == "ARIMA") {
      numericInput("Q1",
                   h3("Moving Average Coeffcienct (P)"),
                   value = 1
      )
    }
  })

  output$D <- renderUI({
    if (input$algo == "ARIMA") {
      numericInput("D1",
                   h3("Differencing (D)"),
                   value = 1
      )
    }
  })

  #  ARIMA(data(),input$y_variable1,input$P1,input$Q1,input$D1)
}
