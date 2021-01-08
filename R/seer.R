source("R/Front_End/frontEnd.R",  chdir = TRUE)

source("R/Back_End/backEnd.R",  chdir = TRUE)



shinyApp(ui, server)
