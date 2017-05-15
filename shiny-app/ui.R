library(shiny)
source('setup.R')

shinyUI(fluidPage(
  titlePanel('Economic Impact of Public Art in LA'),
  sidebarLayout(
    sidebarPanel(
      selectInput(inputId = 'category',
                  choices = categs,
                  label = 'category',
                  selected = 'perc_Unemployment_2015')
    ),
    mainPanel(
      textOutput(outputId = 'scatter_sep'),
      plotOutput(outputId = 'scatter'),
      textOutput(outputId = 'boxplot_sep'),
      plotOutput(outputId = 'boxplot')
    )
    ,
    position = c("left", "right"))
))