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
    )
    
    
  ),
  dashboardBody(
    tabsetPanel(
      tabPanel("Menu",
               fluidRow(
                 column(1), # Colonne vide pour le padding
                 column(3,
                        box(title = "Note moyenne ",
                            style = "height: 70px;",
                            textOutput("Moyenne_note")
                        )
                 ),
                 column(1), # Colonne vide pour l'espace
                 column(3,
                        box(title = "Nombre total d'avis",
                            style = "height: 70px;",
                            textOutput("nb_avis")
                        )
                 ),
                 column(1), # Colonne vide pour l'espace
                 column(3,
                        box(title = HTML("Ratio de notes 5 <i class='fa fa-star'></i>"),
                            style = "height: 70px;",
                            textOutput("ratio_5")
                        )
                 )
               ),
               fluidRow(
                 textOutput("filtered_count"),
                 actionButton("toggleButton", "On/Off"),
                 uiOutput("dynamicGraph")

               )
      ), # Fin du premier onglet "Menu"
      tabPanel("Graphique",
               fluidRow(
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
      ) # Fin du deuxième onglet "Graphique"
    ) # Fin de tabsetPanel
  ) # Fin de dashboardBody
) # Fin de dashboardPage
