setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

source("Front_End/frontEnd.R")
source("Back_End/backEnd.R")


shinyApp(ui, server)
