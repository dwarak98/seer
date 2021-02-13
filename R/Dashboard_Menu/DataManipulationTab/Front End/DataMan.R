addDataManTabContent <- function(id){

  ns <- NS(id)
  tabItem(
    tabName = "DataManipulation",
    fluidRow(
      box(
        width = 3,
        uiOutput(ns("DateObjects")) # Reactive Input
      ),
      box(
        width = 3,
        uiOutput(ns("DateTimeObjects"))

      ),
      box(
        width = 3,

        uiOutput(ns("Text"))
      ),
      box(
        width = 3,
        uiOutput(ns("Double"))
      )),
    fluidRow(
      box(
        width = 12,
        DT::dataTableOutput(ns("DataTable"))
      )
    )
  )

}
