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
        uiOutput("tablecol1"), # Reactive Input
        uiOutput("tablecol2"),
        uiOutput("tablecol3")
      ),
      box(
        width = 9,
        uiOutput("LinePlot"),
        uiOutput("tableplot")
      )
    )
  )
}
