library(shinydashboard)
library(shiny)

InputTabServer <- function(id) {
  moduleServer(
    id,
    function(input, output, session){
      data <- reactive({
        req(input$file1)
        inFile <- input$file1
        print(inFile$datapath)
        read_csv(inFile$datapath)
      })

      ########## Displays top 5 rows of the imported csv #############
      output$head <- DT::renderDataTable({
        data() # input$n,
      },filter =  'top',
      options = list(scrollX = TRUE)
      )

      return(data)
    }
  )
}


