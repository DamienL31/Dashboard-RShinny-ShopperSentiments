# Etudes des avis suivant un achat
## A propos du sujet 
Après une expérience d'achat, nous avons pris l'habitude de laisser une note et/ou un commentaire. Ces notes sont de plus en plus utilisées par les potentiels acheteurs qui veulent découvrir les avis des personnes ayant testé le produit/service avant eux. 
Pour cette application, nous nous sommes servis d'une base de données qui contient des informations sur des magasins, leur localisation ainsi que des avis laissés par des clients. Toutefois, celle-ci marchera avec différentes base de données si celles-ci sont du même format.

## Pour commencer
### Les prérequis

R (version 3.6.0 minimum)
RStudio
Shiny package

### Installation


    1- Cloner le lien du repository :
    2- Télécharger une base de données (par exemple en cliquant sur ce  [lien]( https://www.kaggle.com/datasets/bayusuarsa/crime-data-from-2020-to-present) ou importer la votre directement (penser au même format). 
    3- Ouvrir le projet avec l'application Rstudio
    4- Ouvrir le fichier packages.R
    5- Installer tous les packages présents dans les library (avec install.packages"nom_du_packages)
    6- Sélectionner tous les install.packages puis cliquer sur run pour installer tous les packages
    7- Supprimer toutes les lignes install.packages
    8- Sélectionner toutes les library pui éxécuter en cliquant sur run
    9- Ouvrir un des fichiers (global.R, server.R ou ui.R)
    10- Sélectionner l'ensemble des lignes puis cliquer sur run App


### Structure de l'application 
* La partie ui correspond à l'interface utilisateur, à savoir ce que l'utilisateur verra
  * La partie Dashboardsidebar correspond à la partie de l'interface qui est en interaction avec l'utilisateur
  * La partie Dashboardbody renvoie les résultats en fonction des choix de l'utilisateur
* La partie server correspond à ce qui se passe quand l'utilisateur fais ces choix et n'apparait pas sur l'application


#### Contact 
Pour de plus amples informations n'hésitez pas à nous contacter 

Par mail : corentingilles81@gmail.com

Via [LinkedIn](https://www.linkedin.com/in/corentin-gilles-bb25961b7/)



    
