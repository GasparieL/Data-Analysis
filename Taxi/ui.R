# Load libraries
library(shiny)
library(tidyverse)

# Application Layout
shinyUI(
  fluidPage(
    br(),
    
    titlePanel(title = " Taxi Dataset"),
    p("For our exploration of taxi data in Portugal."),
    wellPanel(
      tabsetPanel(
        tabPanel(
          "Ride Lengths", fluidRow(column(12, plotOutput("p1")))
          
        ),
        tabPanel(
          "Durations by categorization", fluidRow(column(3, selectInput("categorization", "Select categorization", c(
                                                                                                    "CALL_TYPE",
                                                                                                    "ORIGIN_STAND"
                                                                                                    ), selected = "ORIGIN_STAND")), column(9, plotOutput("p2")))
          
        )
      )
    )
    
    
    
    #
    
    # # TASK 2: Add first fluidRow to select input for country
    # fluidRow(
    #   column(12,
    #          # Well panels are just containers for other objects.
    #          wellPanel(
    #            selectInput("country",
    #                        "Select country",
    #                        c(
    #                          "United-States",
    #                          "Canada",
    #                          "Mexico",
    #                          "Germany",
    #                          "Philipines"
    #                        ),
    #                        selected = "United-States"),
    #          )  # add select input 
    #   )
    # ),
    # 
    # # TASK 3: Add second fluidRow to control how to plot the continuous variables
    # fluidRow(
    #   column(3, 
    #          wellPanel(
    #            p("Select a continuous variable and graph type (histogram or boxplot) to view on the right."),
    #            radioButtons("continuous_variable",
    #                         "Continuous variable:",
    #                         choices = c(
    #                           "age",
    #                           "hours_per_week"
    #                         )
    #            ),   # add radio buttons for continuous variables
    #            radioButtons("graph_type",
    #                         "Graph type:",
    #                         choices = c(
    #                           "histogram",
    #                           "boxplot"
    #                         )
    #            )    # add radio buttons for chart type
    #          )
    #   ),
    #   column(9, plotOutput("p1"))  # add plot output
    # ),
    # 
    # # TASK 4: Add third fluidRow to control how to plot the categorical variables
    # fluidRow(
    #   column(3, 
    #          wellPanel(
    #            p("Select a categorical variable to view bar chart on the right. Use the check box to view a stacked bar chart to combine the income levels into one graph. "),
    #            radioButtons("categorical_variable",
    #                         "Categorical variable:",
    #                         choices = c(
    #                           "education",
    #                           "workclass",
    #                           "sex"
    #                         )
    #            ),    # add radio buttons for categorical variables
    #            checkboxInput(
    #              "is_stacked",
    #              "Stack bars",
    #              value = FALSE)     # add check box input for stacked bar chart option
    #          )
    #   ),
    #   column(9, plotOutput("p2"))  # add plot output
    # )
  )
)
