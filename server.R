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
    if(graphState()) {
      plotOutput("graph1", height = "500px")
    } else {
      plotOutput("graph2", height = "500px")
    }
  })
  
  # Génération des graphiques (Remplacez avec votre propre logique de graphique)
  output$graph1 <- renderPlot({ 
    # Votre code pour générer le premier graphique
    # on fait une map mais ça devrait marcher quand même 
    
  })
  output$graph2 <- renderPlot({ 
    # Votre code pour générer le second graphique
    # ici on va pas générer un graphique mais j'imagine que c'est la même chose
    
  })
  
  #suite du code où y aura vos calculs
  
})
