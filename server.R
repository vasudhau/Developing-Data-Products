library(shiny)
require(graphics)
require(ggplot2)
# Define server logic required to draw ggplot
shinyServer(function(input, output) {
  var1 <- reactive(function() {
    input$var1
  })
  var2 <- reactive(function() {
    input$var2
  })

  output$oVar1 <- renderPrint({input$var1})
  output$oVar2 <- renderPrint({input$var2})
  
  output$plot <- reactivePlot(function() {
    if(var1() == "City") {
      if(var2() == "Class") {
        p <- ggplot(mpg, aes(reorder(class, -cty, median), cty)) +
          ggtitle("Miles per gallon performance for Class/City") +
          theme(plot.title = element_text(lineheight=.8)) +
          geom_boxplot(fill = "thistle1", colour = "#3366FF") +
          coord_flip() + scale_x_discrete("class")
      }
      else {
        p <- ggplot(mpg, aes(reorder(manufacturer, -cty, median), cty)) +
          ggtitle("Miles per gallon performance for Manufacturer/City") +
          theme(plot.title = element_text(lineheight=.8)) +
          geom_boxplot(fill = "thistle1", colour = "#3366FF") +
          coord_flip() + scale_x_discrete("manufacturer")
      }
    }
    if(var1() == "Highway") {
      if(var2() == "Class") {
        p <- ggplot(mpg, aes(reorder(class, -hwy, median), hwy)) +
          ggtitle("Miles per gallon performance for Class/Highway") +
          theme(plot.title = element_text(lineheight=.8)) +
          geom_boxplot(fill = "thistle1", colour = "#3366FF") +
          coord_flip() + scale_x_discrete("class")
      }
      else {
        p <- ggplot(mpg, aes(reorder(manufacturer, -hwy, median), hwy)) +
          ggtitle("Miles per gallon performance for Manufacturer/Highway") +
          theme(plot.title = element_text(lineheight=.8)) +
          geom_boxplot(fill = "thistle1", colour = "#3366FF") +
          coord_flip() + scale_x_discrete("manufacturer")
      }
    }
    print(p)
  })
})