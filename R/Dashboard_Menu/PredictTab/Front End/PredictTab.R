# source("UI_widgets.R")
addPredictorOptions <- function(id) {
  selectInput(
    id,
    "Algorithm",
    choices = c("ARIMA", "Linear Regression"),
    multiple = FALSE
  )
}
addPredictTabContent <- function(id) {
  ns <- NS(id)
  tabItem(
    tabName = "Prediction",
    fluidRow(
      box(
        width = 3,
        addPredictorOptions(ns("algo")),
        uiOutput(ns("y")),
        uiOutput(ns("x"))
      ),
      box(
        width = 9,
        DT::dataTableOutput(ns("ForecastTable"))
      )
    )
  )
}
