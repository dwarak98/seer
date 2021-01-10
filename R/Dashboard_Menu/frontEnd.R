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
library(ggplot2)
library(forecast)
library(tseries)
library(sjmisc)
library(shinycssloaders)


source("InputTab/Front End/InputTab.R", chdir = TRUE)
# source("DataPreProcessTab.R")
source("VizTab/Front End/VizTab.R", chdir = TRUE)
source("PredictTab/Front End/PredictTab.R", chdir = TRUE)

# Options for Spinner
options(spinner.color = "#0275D8", spinner.color.background = "#ffffff", spinner.size = 1)

addDashboardMenu <- function(id, logo = "dashboard") {
  menuItem(id, tabName = id, icon = icon(logo))
}

ui <- dashboardPage(
  dashboardHeader(
    title = "Seer"
  ),
  dashboardSidebar(sidebarMenu(
    addDashboardMenu(id = "Widgets", logo = "upload"),
    addDashboardMenu(id = "Visualization", logo = "chart-bar"),
    addDashboardMenu(id = "Prediction", logo = "search")
  )),
  dashboardBody( # Boxes need to be put in a row (or column)
    tabItems(
      # 1st tab content
      addInputTabContent("readUploadedCSVData"),
      # 2nd tab content
      # addDataProsTabContent(),
      # 3rd tab
      addVisuTabContent("Viz"),
      addPredictTabContent("Predict")
    )
  )
)
