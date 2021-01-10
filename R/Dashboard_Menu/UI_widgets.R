



addDashboardMenu <- function(id, logo = "dashboard") {
  menuItem(id, tabName = id, icon = icon(logo))
}

addDateRangeSelector <- function(id, start = Sys.Date() - 1, end = Sys.Date() + 1) {
  dateRangeInput(inputId = id, label = id, start = start, end = end)
}

addHourSlider <- function(id = "Hour") {
  sliderInput(
    id,
    label = id,
    value = c(0, 23),
    min = 0,
    max = 23
  )
}



addPlot <- function(id, height = 400) {
  plotlyOutput(
    outputId = id, height =
      height
  ) %>% withSpinner(type = 4, color = "#0dc5c1")
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

addChartOptions <- function(id) {
  selectInput(
    id,
    "Plot Type",
    choices = c("Table", "Line", "Bar"),
    multiple = FALSE
  )
}

addPredictorOptions <- function() {
  selectInput(
    "algo",
    "Algorithm",
    choices = c("ARIMA", "Linear Regression"),
    multiple = FALSE
  )
}






