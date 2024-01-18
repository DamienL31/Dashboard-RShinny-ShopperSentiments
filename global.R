data <- read.csv("DATA/TeePublic_review.csv")

#voir les différents types de données 

dplyr::glimpse(data)


#colonne date et month en INT transformation et concaténation 
data$date <- as.character(data$date)
data$month <- as.character(data$month)

data$mois_annee <- paste(data$month, data$date, sep = "-")
data$mois_annee <- as.Date(paste("01", data$mois_annee, sep = "-"), format = "%d-%m-%Y")