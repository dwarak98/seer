source("UI_widgets.R")

addPredictTabContent <- function() {
  tabItem(
    tabName = "Prediction",
    fluidRow(
      box(
        width = 3,
        addPredictorOptions(),
        uiOutput("P"),
        uiOutput("Q"),
        uiOutput("D"),
        uiOutput("y_variable"),
        uiOutput("x")
      ),
      box(
        width = 9,
        uiOutput("table1plot")
      )
    )
  )
}
