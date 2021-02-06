library(shinydashboard)
library(shiny)


addDataManServer <- function(id, data) {
  moduleServer(
    id,
    function(input, output, session) {

      addDataObjectParamater <- function(){

        output$DateObjects <- renderUI({
            choices <- unique(colnames(data()))
            selectInput(session$ns("DateColumns"),
                        "Select Date Columns",
                        choices = choices,
                        multiple = TRUE
            )

        })

        output$DateTimeObjects <- renderUI({
          choices <- unique(colnames(data()))
          selectInput(session$ns("DateTimeColumns"),
                      "Select DateTime Columns",
                      choices = choices,
                      multiple = TRUE
          )

        })

        output$Text <- renderUI({
          choices <- unique(colnames(data()))
          selectInput(session$ns("TextColumns"),
                      "Select Text Columns",
                      choices = choices,
                      multiple = TRUE
          )

        })

        output$Double <- renderUI({
          choices <- unique(colnames(data()))
          selectInput(session$ns("ValueColumns"),
                      "Select Numeric Columns",
                      choices = choices,
                      multiple = TRUE
          )

        })

        output$Query <- renderUI({
          DT::dataTableOutput(outputId = session$ns("table")) %>% withSpinner(type = 4, color = "#0dc5c1")

        })


      }





      addDataObjectParamater()


    }

  )

}
