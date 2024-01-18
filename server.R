source("packages.R")
#source("global.R")

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
  
  output$filtered_count <- renderValueBox({
    valueBox(
      value = nrow(filtered_data()),
      subtitle = "Nombre d'avis",
      icon = icon("list-ul"),
      color = "fuchsia",
      
    )
  })
  
  output$nb_5_note <- renderValueBox({
    filtered <- filtered_data()
    
    # Compter le nombre de notes égales à 5 dans la colonne review.label
    count_5 <- sum(filtered$review.label == 5)
    
    
    valueBox(
      value = count_5,
      subtitle = "Nombre d'avis à 5 étoiles",
      icon = icon("star"),
      color = "light-blue",
      
    )
  })
  
  output$filtered_avg_rating <- renderValueBox({
    filtered <- filtered_data()
    
    avg_rating <- mean(filtered$review.label)
    
    valueBox(
      value = round(avg_rating,2),
      subtitle = "Note moyenne",
      icon = icon("bar-chart"),
      color = "light-blue",
      
    )
  })
  
  output$filtered_ratio_percentage <- renderValueBox({
    filtered <- filtered_data()
    
    ratio_percentage <- (sum(filtered$review.label == 5) / nrow(filtered)) * 100
    
    valueBox(
      value = paste0(round(ratio_percentage, 1),"%"),
      subtitle = "Ratio d'avis à 5 étoiles",
      icon = icon("star-half-alt"),
      color = "fuchsia",
      
    )
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
      random_boxes <- reactiveVal(NULL)
      
      observeEvent(input$refreshButton, {
        random_boxes(sample_n(data, 3))
      })
      
      output$dynamicGraph <- renderUI({
        boxes <- random_boxes()
        
        if (!is.null(boxes)) {
          box_list <- lapply(seq_len(nrow(boxes)), function(i) {
            box(
              title = h4(boxes$title[i]),
              width = 4,
              status = "primary",
              background = "black",
              tags$div(
                style = "color:white;",
                lapply(seq_len(boxes$review.label[i]), function(j) {
                  icon("star")
                })),
              footer = tags$div(
                style = "color: black;",  
                boxes$review[i]
              )
            )
            
          })
          
          tagList(box_list)
        } else {
          HTML("Appuyez sur le bouton Actualiser pour afficher des commentaires.")
        }
      })
    } else {
      p("test")
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
