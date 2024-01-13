source("packages.R")
source("global.R")

shinyServer(function(input, output, session) {
  
  filtered_data <- reactive({
    print(input$country_filter)
    filtered <- data %>% filter(countrycode(store_location, "iso2c", "country.name") %in% input$country_filter)
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
