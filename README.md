# Analyse des avis de la plateforme TeePublic

## À propos du sujet

Bienvenue dans notre projet d'analyse de données RShiny dédié à explorer et à comprendre les avis des clients de TeePublic, une plateforme en ligne renommée pour sa vaste collection d'articles de mode. TeePublic se distingue par son offre diversifiée, incluant des vêtements, des accessoires et bien d'autres articles qui captent l'intérêt d'une clientèle variée.

Après une expérience d'achat, nous avons pris l'habitude de laisser une note et/ou un commentaire. Ces notes sont de plus en plus utilisées par les potentiels acheteurs qui veulent découvrir les avis des personnes ayant testé le produit avant eux.

Pour cette application, nous nous sommes servis d'une base de données qui contient des informations sur des magasins, leurs localisations ainsi que des avis laissés par des clients. Toutefois, celle-ci fonctionnera avec différentes bases de données si celles-ci sont du même format.

View of application : 

<img width="952" alt="read" src="https://github.com/DamienL31/Dashboard-RShinny-ShopperSentiments/assets/152622955/e9a94f4d-e759-425d-ad4f-10f1ea6ec9aa">

## Pour commencer

### Les prérequis

- R (version 3.6.0 minimum)
- RStudio
- Shiny package

### Installation

1. Cloner le lien du repository.
2. Télécharger une base de données (par exemple en cliquant sur ce [lien](https://www.kaggle.com/datasets/bayusuarsa/crime-data-from-2020-to-present)) ou importer la vôtre directement (penser au même format).
3. Ouvrir le projet avec l'application RStudio.
4. Ouvrir le fichier `packages.R`.
5. Installer tous les packages présents dans les `library` (avec `install.packages("nom_du_package")`).
6. Sélectionner tous les `install.packages` puis cliquer sur `Run` pour installer tous les packages.
7. Supprimer toutes les lignes `install.packages`.
8. Sélectionner toutes les `library` puis exécuter en cliquant sur `Run`.
9. Ouvrir un des fichiers (`global.R`, `server.R` ou `ui.R`).
10. Sélectionner l'ensemble des lignes puis cliquer sur `Run App`.

### Structure de l'application

- La partie `UI.R` correspond à l'interface utilisateur, à savoir ce que l'utilisateur verra.
  - La partie `DashboardSidebar` correspond à la partie de l'interface qui est en interaction avec l'utilisateur.
  - La partie `DashboardBody` renvoie les résultats en fonction des choix de l'utilisateur.
- La partie `SERVER.R` correspond à ce qui se passe quand l'utilisateur fait ses choix et n'apparaît pas sur l'application.

#### Contact

Pour de plus amples informations, n'hésitez pas à nous contacter.

- Par mail : corentingilles81@gmail.com
- Via [LinkedIn](https://www.linkedin.com/in/corentin-gilles-bb25961b7/)
