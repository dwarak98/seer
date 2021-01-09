source("UI_widgets.R")

addInputTabContent <- function(id) {
  ns <- NS(id)
  tabItem(
    tabName = "Widgets",
    addLoadFilesFromDirectory(ns("file1")),
    addNumericInput(ns("n"), "Enter Number of Rows to be displayed"),
    DT::dataTableOutput(ns("head"))

  )
}
