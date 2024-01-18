source("packages.R")
source("global.R")

ui <- dashboardPage(
  dashboardHeader(title = "Mon Dashboard"),
  dashboardSidebar(
    # Partie Filtre
    
    pickerInput(
      inputId = "continent_filter",
      label = "Choisir un continent",
      choices = c("Tous les continents", unique(countrycode(data$store_location, "iso2c", "continent"))),
      options = list(`actions-box` = TRUE),
      multiple = FALSE
    ),
    pickerInput(
      inputId = "country_filter",
      label = "Choisir un pays",
      choices = unique(countrycode(data$store_location, "iso2c", "country.name")),
      options = list(`actions-box` = TRUE),
      multiple = TRUE
    ),
    div(
      actionButton("generatePDFButton", "Extraire en PDF", class = "bottom-button"),
      style = "position: absolute; bottom: 10px"
    )

    
    
    
    
  ),
  dashboardBody(
    
<<<<<<< HEAD
=======
    
>>>>>>> e3dc4389f25eaea6bd69a59551b016bcfa7a54fd
    tabsetPanel(
      tabPanel("Menu",
               fluidRow(
                 column(3,
                        valueBoxOutput("filtered_avg_rating", width = 12)
                 ),                 
                 column(3,
                        valueBoxOutput("filtered_count", width = 12)
                 ),
                 column(3,
                        valueBoxOutput("nb_5_note", width = 12)
                 ),
                 column(3,
                        valueBoxOutput("filtered_ratio_percentage", width = 12)
                 )
               ),
               
               
               fluidRow(
                 actionButton("toggleButton", "On/Off"),
                 uiOutput("dynamicGraph"),
                 actionButton("refreshButton", "Actualiser")
                 
               )
      ), # Fin du premier onglet "Menu"
      tabPanel("Graphique",
               fluidRow(
<<<<<<< HEAD
                 column(12,
                        h3("Scores Distribution",  class = "text-center"),
                        plotOutput("scores_distribution", height = "300px") 
                 ),
                 fluidRow(
                   column(12,
                          h3("Trends in 5 review label over the years",  class = "text-center"),
                          plotOutput("trends_5", height = "300px")
                   )
                 ),
                 fluidRow(
                   column(12,
                          h3("Temporal analysis of reviews",  class = "text-center"),
                          plotOutput("temporal_analysis", height = "400px")
                   ) ) )
               # Partie Graphique
=======
                 column(6,
                        h3("Répartition des avis",  class = "text-center"),
                        plotOutput("repart_avis", height = "300px")
                 ),
                 column(6,
                        h3("Inchallah on trouve",  class = "text-center"),
                        plotOutput("graph2", height = "300px")
                 )
               ),
               fluidRow(
                 column(12,
                        h3("Evolution des avis en fonction du temps",  class = "text-center"),
                        plotOutput("evo_avis_temps", height = "400px")
                 ) )       # Partie Graphique
>>>>>>> e3dc4389f25eaea6bd69a59551b016bcfa7a54fd
      ) # Fin du deuxième onglet "Graphique"
    ) # Fin de tabsetPanel
  ) # Fin de dashboardBody
) # Fin de dashboardPage