##################### PREDICTION #########################


addPredictServer <- function(id, data) {
  moduleServer(
    id,
    function(input, output, session) {
      output$y_variable <- renderUI({
        if (input$algo == "ARIMA") {
          choices <- unique(colnames(data()))
          selectInput(session$ns("y_variable1"),
            "What to Predict",
            choices = choices,
            multiple = TRUE
          )
        }
      })

      output$y_variable <- renderUI({
        if (input$algo == "ARIMA") {
          choices <- unique(colnames(data()))
          selectInput(session$ns("y_variable1"),
            "What to Predict",
            choices = choices,
            multiple = TRUE
          )
        }
      })

      output$P <- renderUI({
        if (input$algo == "ARIMA") {
          numericInput(session$ns("P1"),
            h3("Auto Regressive Coeffcienct (P)"),
            value = 1
          )
        }
      })

      output$Q <- renderUI({
        if (input$algo == "ARIMA") {
          numericInput(session$ns("Q1"),
            h3("Moving Average Coeffcienct (P)"),
            value = 1
          )
        }
      })

      output$D <- renderUI({
        if (input$algo == "ARIMA") {
          numericInput(session$ns("D1"),
            h3("Differencing (D)"),
            value = 1
          )
        }
      })

      #  ARIMA(data(),input$y_variable1,input$P1,input$Q1,input$D1)
    }
  )
}
