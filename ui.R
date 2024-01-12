# ui.R

library(shiny)
library(shinydashboard)

shinyUI(
  dashboardPage(
    dashboardHeader(title = "Mon Dashboard"),
    dashboardSidebar(
    #Partie Filtre
    ),
    dashboardBody(

      tabsetPanel(
        tabPanel("Menu",
                h2("Bienvenue sur le tableau de bord!"),
                p("C'est votre page d'accueil. Vous pouvez personnaliser cela.")
                #Partie Menu
        ),
        tabPanel("Graphique",
                plotOutput("plot1", height = "400px")
                #Partie Graphique
        )
      )
    )
  )
)
