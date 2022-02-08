##################### Loading R packages    ######################################
# install.packages("googlesheets4")

library(googlesheets4) 
library (tidyverse)

## Para dar permisos  ----
gs4_deauth()
gs4_auth() # aunque no aparezca la opcion, mete 0. 


## Ejemplo cargando googlesheet ----
# ejemplo sencillo
sheet_url <- "https://docs.google.com/spreadsheets/d/10pSd-ekF2wUUVdhB-PYxT3XhgOPKXfTQirA8krfWGY4/edit#gid=0"
ej <- rn_seeds <- read_sheet(sheet_url) 
ej

# ejemplo con la base de datos de SEMILLAS NUDIFLORA
sheet_url2 <- "https://docs.google.com/spreadsheets/d/14pP1Y4OcKa89fHpmX1k59cxjDnW_1KTJVJUD5-QuYJ8/edit?usp=sharing"
rn_seeds <- read_sheet(sheet_url2)
ej <- rn_seeds <- read_sheet(sheet_url2) 
ej

View(rn_seeds)



