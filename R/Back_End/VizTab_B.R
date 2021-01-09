library(shinydashboard)
library(shiny)


addVizServer <- function(id, data) {
  moduleServer(
    id,
    function(input, output, session) {
      addInputParamForLine <- function() {
        output$lineplotVar1 <- renderUI({
          if (input$charttype == "Line") {
            choices <- unique(colnames(data()))
            selectInput(session$ns("xaxis"),
              "X_Axis",
              choices = choices,
              multiple = TRUE
            )
          }
        })

        output$lineplotVar2 <- renderUI({
          if (input$charttype == "Line") {
            choices <- unique(colnames(data()))

            selectInput(session$ns("yaxis"),
              "Y_Axis",
              choices = choices,
              multiple = TRUE
            )
          }
        })

        output$lineplotVar3 <- renderUI({
          if (input$charttype == "Line") {
            choices <- unique(colnames(data()))
            selectInput(session$ns("category"),
              "Category",
              choices = choices,
              multiple = TRUE
            )
          }
        })

        output$LinePlot <- renderUI({
          if (input$charttype == "Line") {
            validate(
              need(input$xaxis != "", "Choose X Axis"),
              need(input$yaxis != "", "Choose Y Axis"),
              need(input$category != "", "Choose Category")
            )
            plotlyOutput(outputId = session$ns("dline"), height = 400) %>% withSpinner(type = 4, color = "#0dc5c1")
            # addLinePlot()
          }
        })
      }

      addInputParamForTable <- function() {

        ####################### Table Display ###################

        output$tableValue <- renderUI({
          if (input$charttype == "Table") {
            choices <- unique(colnames(data()))
            selectInput(session$ns("VALUE"),
              "Value/Amount",
              choices = choices,
              multiple = TRUE
            )
          }
        })

        output$tableRow <- renderUI({
          if (input$charttype == "Table") {
            choices <- unique(colnames(data()))

            selectInput(session$ns("Row"),
              "Rows (Multi-Select)",
              choices = choices,
              multiple = TRUE
            )
          }
        })

        output$tableCol <- renderUI({
          if (input$charttype == "Table") {
            choices <- append(" ", unique(colnames(data())))

            selectInput(session$ns("Column"),
              "Column (Uni-Select)",
              choices = choices,
              multiple = FALSE,
              selected = NULL
            )
          }
        })



        output$tableplot <- renderUI({
          if (input$charttype == "Table") {
            # validate(
            #   need(input$Row != "", "Choose Amount"),
            #   need(input$VALUE != "", "Choose Rows"),
            #   need(input$Column != "", "Choose Column")
            # )
            DT::dataTableOutput(outputId = session$ns("table")) %>% withSpinner(type = 4, color = "#0dc5c1")
          }
        })
      }

      addTable <- function() {
        new_data <- reactive({
          rowname <- input$Row
          if (input$Column[1] != " ") {
            newdata1 <- data() %>% rename(
              Col1 = input$Column[1],
              Vue = input$VALUE,
            )


            newdata1 %>%
              select(Col1, Vue, input$Row) %>%
              pivot_wider(names_from = Col1, values_from = Vue, values_fn = list(Vue = sum))
          }
          else {
            data() %>%
              select(input$VALUE, input$Row) %>%
              group_by(!!!rlang::syms(input$Row)) %>%
              summarise_all(funs(sum))
          }

          # else if (!is.na(input$Column[2])) {
          #   newdata1 <- data1() %>% rename(
          #     Col1 = input$Column[1],
          #     Col2 = input$Column[2],
          #     Vue = input$VALUE,
          #     Rws = input$Row
          #   )
          #   newdata1 %>%
          #     group_by(Col1, Col2) %>%
          #     summarise(Value = sum(as.numeric(Vue)))
          #   # aggregate(newdata1$input$VALUE, by=list(newdata1$input$Column), FUN=sum)
          # }
        })


        output$table <- DT::renderDataTable(
          {
            new_data()
          },
          filter = "top",
          options = list(scrollX = TRUE)

          # ,options = list(pageLength = 5,initComplete = I("function(settings, json) {alert('Done.');}"))
        )
      }

      addLinePlot <- function() {
        output$dline <- renderPlotly({
          p1 <-
            data() %>%
            rename(
              col1 = input$xaxis,
              col2 = input$yaxis,
              category = input$category
            ) %>%
            ggplot(aes(
              x = col1,
              y = col2,
              fill = category,
              text = paste(
                "</br>X-axis: ",
                col1,
                "</br>Y-Axis: ",
                col2,
                "</br>Category: ",
                category
              )
            )) +
            geom_col() +
            theme_minimal() +
            labs(
              y = input$yaxis,
              x = input$xaxis,
              col = input$category
            )
          ggplotly(p1, tooltip = c("text"))
        })
      }

      addInputParamForTable()
      addInputParamForLine()
      addTable()
      addLinePlot()
    }
  )
}
