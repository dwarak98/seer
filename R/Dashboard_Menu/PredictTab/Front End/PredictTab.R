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
        uiOutput(ns("P")),
        uiOutput(ns("Q")),
        uiOutput(ns("D")),
        uiOutput(ns("y_variable")),
        uiOutput(ns("x"))
      ),
      box(
        width = 9,
        uiOutput(ns("table1plot"))
      )
    )
  )
}
