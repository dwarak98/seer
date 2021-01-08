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

source("InputTab.R")
source("VizTab.R")
source("PredictTab.R")

# Options for Spinner
options(spinner.color = "#0275D8", spinner.color.background = "#ffffff", spinner.size = 1)


ui <- dashboardPage(
  dashboardHeader(
    title = "Basic dashboard"
  ),
  dashboardSidebar(sidebarMenu(
    addDashboardMenu(id = "Widgets", logo = "th"),
    addDashboardMenu(id = "Visualization", logo = "th"),
    addDashboardMenu(id = "Prediction", logo = "th")
  )),
  dashboardBody( # Boxes need to be put in a row (or column)
    tabItems(
      # 1st tab content
      addInputTabContent(),
      # 2nd tab content
      addVisuTabContent(),
      # 3rd tab
      addPredictTabContent()
    )
  )
)
