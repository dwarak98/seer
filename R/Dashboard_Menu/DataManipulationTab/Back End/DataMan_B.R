library(shinydashboard)
library(shiny)
library(anytime)



addDataManServer <- function(id, data) {
  # sheet_write(data(),ss, sheet = "Data")

  moduleServer(
    id,
    function(input, output, session) {

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

        applyFormatting <- function(data){
          for (col in input$DateColumns) {
            data[[(col)]] <- anydate(data[[col]])
          }

          for (col in input$DateTimeColumns) {
            data[[(col)]] <- anytime(data[[col]])
          }

          for (col in input$TextColumns) {
            data[[(col)]] <- as.character(data[[col]])
          }

          for (col in input$ValueColumns) {
            data[[(col)]] <- as.numeric(data[[col]])
          }

          return(data)

        }




        output$DataTable <- DT::renderDataTable({
          applyFormatting(data()) # input$n,
        },filter =  'top',
        options = list(scrollX = TRUE)
        )

        data1 <- reactive({
          applyFormatting(data())
        })

        return(data1)


      }

  )

}
