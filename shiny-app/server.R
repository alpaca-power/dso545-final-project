library(shiny)
library(ggplot2)
library(dplyr)
library(stringr)
source('setup.R')

shinyServer(function(input, output) {
  
  output$scatter_sep <- renderText('Scatter Plot')
  
  output$scatter <- renderPlot({
    df %>%
      group_by(num_of_Art_Projects) %>%
      summarise_(average = lazyeval::interp(~mean(x), x = as.name(input$category))) %>%
      ggplot(aes(x = num_of_Art_Projects, y = average)) +
      geom_point(shape = 1, color = '#009999', size = 4) +
      xlab('# of Art Projects') +
      ggtitle(input$category) +
      geom_smooth(method = "lm", formula = y ~ splines::bs(x, 3), se = FALSE, color = 'gray') +
      theme_minimal()
  })
  
  output$boxplot_sep <- renderText('Box Plot')
  
  output$boxplot <- renderPlot({
    df %>%
      filter(!is.na(num_of_Art_Projects)) %>%
      ggplot(aes_string(x = sprintf("factor(%s)", 'num_of_Art_Projects'), y = as.name(input$category))) +
      geom_boxplot(outlier.colour = "red", outlier.shape = 1, fill = '#86dcea') +
      xlab('# of Art Projects') +
      theme_minimal()
  })
})
