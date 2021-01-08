source("UI_widgets.R")

addInputTabContent <- function() {
  tabItem(
    tabName = "Widgets",
    addLoadFilesFromDirectory("file1"),
    addNumericInput("n", "Enter Number of Rows to be displayed"),
    DT::dataTableOutput("head")

  )
}
