source("packages.R")
source("global.R")

ui <- dashboardPage(
  dashboardHeader(title = "Mon Dashboard"),
  dashboardSidebar(
    pickerInput(
      inputId = "continent_filter",
      label = "Choisir un continent",
      choices = c("Tous les continents", unique(countrycode(data$store_location, "iso2c", "continent"))),
      options = list(`actions-box` = TRUE),
      multiple = FALSE
    ),
    br(),
    br(),
    br(),
    br(),
    br(),
    pickerInput(
      inputId = "country_filter",
      label = "Choisir un pays",
      choices = unique(countrycode(data$store_location, "iso2c", "country.name")),
      options = list(`actions-box` = TRUE),
      multiple = TRUE
    ),
    br(),
    br(),
    br(),
    br(),
    br(),
    br(),
    br(),
    br(),
    br(),
    br(),
    br(),
    br(),
    br(),
    dateRangeInput(
      inputId = "date_range_filter",
      label = "Choisir une plage de dates",
      start = min(data$mois_annee),
      end = max(data$mois_annee),
      min = min(data$mois_annee),
      max = max(data$mois_annee),
      format = "yyyy-mm-dd",
      separator = " - "
    ),
    div(
      actionButton("generatePDFButton", "Extraire en PDF", class = "bottom-button"),
      style = "position: absolute; bottom: 10px"
    )
  ),
  dashboardBody(
    tabsetPanel(
      tabPanel("Menu",
               fluidRow(
                 column(3, valueBoxOutput("filtered_avg_rating", width = 12)),
                 column(3, valueBoxOutput("filtered_count", width = 12)),
                 column(3, valueBoxOutput("nb_5_note", width = 12)),
                 column(3, valueBoxOutput("filtered_ratio_percentage", width = 12))
               ),
               fluidRow(
                 actionButton("toggleButton", "On/Off"),
                 uiOutput("dynamicGraph"),
               ),
               actionButton("refreshButton", "Actualiser")
      ), # Fin du premier onglet "Menu"
      tabPanel("Graphique",
               fluidRow(
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
                   )
                 )
               ),
      ),
      tabPanel("Données",
               fluidRow(
                  p("test")
               ),
      ),
      
    )
  )
)