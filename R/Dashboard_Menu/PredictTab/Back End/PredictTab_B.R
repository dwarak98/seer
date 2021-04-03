##################### PREDICTION #########################


addPredictServer <- function(id, data) {
  moduleServer(
    id,
    function(input, output, session) {
      output$y <- renderUI({
        if (input$algo == "Linear Regression") {
          choices <- unique(colnames(data()))
          selectInput(session$ns("predictor"),
            "What to Predict",
            choices = choices,
            multiple = TRUE
          )
        }
      })

      output$x <- renderUI({
        if (input$algo == "Linear Regression") {
          choices <- unique(colnames(data()))
          selectInput(session$ns("variables"),
            "Input Variables",
            choices = choices,
            multiple = TRUE
          )
        }
      })


      Predict <- function(df2){
        if (input$algo == "Linear Regression" && input$variables!=""){
          # fit <- lm(data[[input$predictor]] ~ data[[input$variables[1]]])



          # fit <- lm(df2[[input$predictor]] ~ df2[[input$variables[1]]])
          #fit <- lm(as.formula(paste(input$predictor," ~ ",paste(input$variables,collapse="+"))),data=df2)
          fit <- lm(y ~ ., data = df2)
          print("Printing results")
          print(summary(fit))
          new <- data.frame(x = df2$x)
          df <- predict(fit, new, se.fit = TRUE)
          #
          print("displaying results")
          x1 <- data.frame(Input = df2$x,Predictor_variable = df2$y, Forecasted = df$fit)
          print(x1)
          return(x1)


        }



      }

      output$ForecastTable <- DT::renderDataTable({
        df2 <- data() %>%
          select(input$predictor, input$variables) %>%
          group_by(!!!rlang::syms(input$variables)) %>%
          summarise_all(funs(sum))
        #
        # data2<-data[complete.cases(data),]
        # df2<-df1[complete.cases(df1),]
        print(df2)
        df2 <- df2 %>%
           rename(y = input$predictor,
            x = input$variables)

        if (input$algo == "Linear Regression" && input$variables!=""){
          # fit <- lm(data[[input$predictor]] ~ data[[input$variables[1]]])



          # fit <- lm(df2[[input$predictor]] ~ df2[[input$variables[1]]])
          #fit <- lm(as.formula(paste(input$predictor," ~ ",paste(input$variables,collapse="+"))),data=df2)
          fit <- lm(y ~ ., data = df2)
          print("Printing results")
          print(summary(fit))
          new <- data.frame(x = 1:length(df2$y))
          df <- predict(fit, new, se.fit = TRUE)
          #
          print("displaying results")
          x1 <- data.frame(Input = df2$x,Predictor_variable = df2$y, Forecasted = df$fit)

        }
        # Predict(df2)
      },filter =  'top',
      options = list(scrollX = TRUE)
      )

      data1 <- reactive({
        Predict(data())
      })



      #  ARIMA(data(),input$y_variable1,input$P1,input$Q1,input$D1)
    }
  )
}
