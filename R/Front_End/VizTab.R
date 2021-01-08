source("UI_widgets.R")

addVisuTabContent <- function() {
  tabItem(
    tabName = "Visualization",
    fluidRow(
      box(
        width = 3,
        addChartOptions(),
        uiOutput("lineplotVar1"), # Reactive Input
        uiOutput("lineplotVar2"), # Reactive Input
        uiOutput("lineplotVar3"), # Reactive Input
        uiOutput("tableRow"), # Reactive Input
        uiOutput("tableCol"),
        uiOutput("tableValue")
      ),
      box(
        width = 9,
        uiOutput("LinePlot"),
        uiOutput("tableplot")
      )
    )
  )
}
