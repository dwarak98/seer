# source("UI_widgets.R")

addLoadFilesFromDirectory <- function(id) {
  fileInput(
    id,
    "Choose CSV File",
    accept = c("text/csv", "text/comma-separated-values,text/plain", ".csv")
  )
}

addNumericInput <- function(id, caption = "Enter Numeric Input") {
  numericInput(
    id,
    caption,
    value = 5,
    min = 1,
    step = 1
  )
}

addInputTabContent <- function(id) {
  ns <- NS(id)
  tabItem(
    tabName = "Widgets",
    addLoadFilesFromDirectory(ns("file1")),
    # addNumericInput(ns("n"), "Enter Number of Rows to be displayed"),
    DT::dataTableOutput(ns("head"))

  )
}
