
source("Front_End/frontEnd.R",  chdir = TRUE)

source("Back_End/backEnd.R",  chdir = TRUE)


shinyApp(ui, server)
