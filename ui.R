library(shiny)
# Define UI for application that draws a histogram
shinyUI(fluidPage(
  titlePanel("mpgPlot"),
  sidebarLayout(
    sidebarPanel(
      helpText("Create a plot of Fuel Economy from mpg dataset using ggplot2."),
      selectInput("var1",
                  label = "Choose City/Highway",
                  choices = c("City", "Highway"),
                  selected = "City"),
      selectInput("var2",
                  label = "Choose Class/Manufacturer",
                  choices = c("Class", "Mfg"),
                  selected = "Class")
    ),
    mainPanel(
      h4('Input Data1'),
      verbatimTextOutput("oVar1"),
      h4('Input Data2'),
      verbatimTextOutput("oVar2"),
      plotOutput("plot", width="800px", height="600px")
    )
  )
))