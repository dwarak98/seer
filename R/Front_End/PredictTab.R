source("UI_widgets.R")

addPredictTabContent <- function(id) {
  ns <- NS(id)
  tabItem(
    tabName = "Prediction",
    fluidRow(
      box(
        width = 3,
        addPredictorOptions(),
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
