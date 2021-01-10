# source("UI_widgets.R")
addChartOptions <- function(id) {
  selectInput(
    id,
    "Plot Type",
    choices = c("Table", "Line", "Bar"),
    multiple = FALSE
  )
}
addVisuTabContent <- function(id) {
  ns <- NS(id)
  tabItem(
    tabName = "Visualization",
    fluidRow(
      box(
        width = 3,
        addChartOptions(ns("charttype")),
        uiOutput(ns("lineplotVar1")), # Reactive Input
        uiOutput(ns("lineplotVar2")), # Reactive Input
        uiOutput(ns("lineplotVar3")), # Reactive Input
        uiOutput(ns("tableRow")), # Reactive Input
        uiOutput(ns("tableCol")),
        uiOutput(ns("tableValue"))
      ),
      box(
        width = 9,
        uiOutput(ns("LinePlot")),
        uiOutput(ns("tableplot"))
      )
    )
  )
}
