source("packages.R")
source("global.R")

shinyServer(function(input, output, session) {
  
  observe({
    if (input$continent_filter == "Tous les continents") {
      updatePickerInput(session, "country_filter", choices = unique(countrycode(data$store_location, "iso2c", "country.name")))
    } else {
      countries_in_continent <- countrycode(data$store_location, "iso2c", "country.name")[countrycode(data$store_location, "iso2c", "continent") %in% input$continent_filter]
      updatePickerInput(session, "country_filter", choices = unique(countries_in_continent))
    }
  })
  
  filtered_data <- reactive({
    if (input$continent_filter == "Tous les continents") {
      filtered <- data
    } else {
      filtered <- data %>%
        filter(countrycode(store_location, "iso2c", "continent") %in% input$continent_filter)
    }
    
    if (!is.null(input$country_filter)) {
      filtered <- filtered %>%
        filter(countrycode(store_location, "iso2c", "country.name") %in% input$country_filter)
    }
    
    filtered$full_country_name <- countrycode(filtered$store_location, "iso2c", "country.name")
    return(filtered)
  })
  
  
  output$filtered_table <- renderTable({
    filtered_data()
  }) 
  
  output$filtered_count <- renderText({
    paste("Nombre de résultats : ", nrow(filtered_data()))
  })
  
  
  
  # Variable pour suivre l'état du bouton
  graphState <- reactiveVal(TRUE)
  
  # Observer le bouton
  observeEvent(input$toggleButton, {
    graphState(!graphState()) # Basculer l'état
  })
  
  # Afficher ce qu'on veut  en fonction de l'état
  output$dynamicGraph <- renderUI({
    if (graphState()) {
      plotOutput("scores_distribution", height = "500px")
    } else if (graphState()) {
      plotOutput("trends_5", height = "500px")
    } else {
      plotOutput("temporal_analysis", height = "500px") 
    }
  })
  
  
  # Graph 1 distribution of review by label
  output$scores_distribution <- renderPlot({ 
    filtered_data <- filtered_data()
    
    ggplot(filtered_data, aes(x = review.label)) +
      geom_histogram(binwidth = 1, fill = "skyblue", color = "black", alpha = 0.8) +
      labs(title = "Scores distribution",
           x = "score",
           y = "Count") +
      geom_text(stat = "count", aes(label = stat(count)), vjust = -0.3)
    
    
  })
  
  #Graph2 trends over years 
  
  output$trends_5 <- renderPlot({ 
    filtered_data <- filtered_data()
    
    top_avis_filtre <- filtered_data %>%
      filter(review.label == 5) %>%
      group_by(review.label,mois_annee) %>%
      summarise(count = n())
    
    ggplot(top_avis_filtre, aes(x = mois_annee, y = count)) +
      geom_line() +
      labs(title = "Trends in 5 review label over the years",
           x = "Years",
           y = "count") +
      theme(axis.text.x = element_text(angle = 90, hjust = 1))+
      scale_x_date(date_labels = "%Y", date_breaks = "1 year")
  })
  
  #Graph 3 Temporal analysis 
  
  output$temporal_analysis <- renderPlot({ 
    filtered_data <- filtered_data()
    
    #DF pour avoir le count par mois-année
    top_avis <- filtered_data %>%
      group_by(review.label,mois_annee) %>%
      summarise(count = n())
    
    
    #Graph stack bar reviewlabel by month-year
    ggplot(top_avis, aes(x = mois_annee, y = count, fill = as.factor(review.label))) +
      geom_bar(stat = "identity", position = "stack") +
      labs(title = "Temporal analysis of reviews",
           x = "Month-Year",
           y = "Count by labels") +
      theme(axis.text.x = element_text(angle = 90, hjust = 1))+
      scale_x_date(date_labels = "%Y-%m", date_breaks = "1 month")
  })
  
  
  #suite du code où y aura vos calculs
})
