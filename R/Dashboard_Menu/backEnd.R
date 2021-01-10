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
source("InputTab/Back End/InputTab_B.R", chdir = TRUE)
source("VizTab/Back End/VizTab_B.R", chdir = TRUE)
source("PredictTab/Back End/PredictTab_B.R", chdir = TRUE)

# Options for Spinner
options(spinner.color = "#0275D8", spinner.color.background = "#ffffff", spinner.size = 2)


options(shiny.maxRequestSize = 30 * 1024^2)

server <- function(input, output, session) {



  ############ Read the imported csv file ######################

  # data <- readUploadedCSVData(input, output, session)
  data <- InputTabServer("readUploadedCSVData")

  ########### Vizualization Tab #################

  # displayDynamicUI() # contain all the options
  #  addLinePlot()
  addVizServer("Viz", data)
  addPredictServer("Predict",data)



}
