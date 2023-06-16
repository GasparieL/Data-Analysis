# Load libraries
library(shiny)
library(tidyverse)

# Read in data
df <- read_csv("updated_taxi_data.csv", col_types = cols("ORIGIN_STAND" = col_factor(), "CALL_TYPE" = col_factor(levels = c("A", "B", "C"))))# factor is enum in R  - enum is a type in which there are finite possibilities for values

p99 <- quantile(df$NUM_SEC, probs = 0.99)
df_inliers <- df %>% filter(NUM_SEC < p99) 




# Define server logic
shinyServer(function(input, output) {

  
  output$p1 <- renderPlot({
      ggplot(df_inliers, aes(x = NUM_SEC)) +
        geom_histogram(aes(fill = CALL_TYPE)) +  # histogram geom
        labs(y = "Number of Rides", title = "Ride lengths, grouped by call type") + # labels
        facet_wrap(~CALL_TYPE)    # facet by CALL_TYPE
  })
  
  output$p2 <- renderPlot({
    df_box <-reactive({
      if(input$categorization == "ORIGIN_STAND") drop_na_origin_stand else df_inliers
    }) 
    ggplot(df_box(), aes_string(x = input$categorization, y = "NUM_SEC")) +
      geom_boxplot(aes(fill = .data[[input$categorization]])) +  # boxplot geom
      scale_y_continuous(limits = quantile(df$NUM_SEC, c(0.1, 0.9))) + # Comment this to show outliers
      coord_flip() +  # flip coordinates
      labs(y = "NUM_SEC", title = paste("Box plot for ride duration for each call type")) # labels
    
  })
  
})
