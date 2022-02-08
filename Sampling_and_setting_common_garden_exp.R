##################### Loading R packages    ######################################
install.packages("googlesheets4")

library(googlesheets4) 
library (tidyverse)

## Para dar permisos  ----
gs4_deauth()
gs4_auth() # aunque no aparezca la opcion, mete 0. 

## Ejemplo sencillo cargando googlesheet ----

sheet_url_ej_sencillo <- "https://docs.google.com/spreadsheets/d/10pSd-ekF2wUUVdhB-PYxT3XhgOPKXfTQirA8krfWGY4/edit#gid=0"
ej <- read_sheet(sheet_url_ej_sencillo)
ej

# ejemplo con la base de datos de SEMILLAS NUDIFLORA
sheet_url2 <- "https://docs.google.com/spreadsheets/d/14pP1Y4OcKa89fHpmX1k59cxjDnW_1KTJVJUD5-QuYJ8/edit?usp=sharing"
rn_seeds <- read_sheet(sheet_url2)

names (rn_seeds) # viendo los nombres de las columnas. 

# NOTA: cambiar 'num madre' por num_madre o mejor por id_madre

#### Creando una tidy database (reshaping database)  #####
seeds <-  # la nueva base de datos sera salvada en el objeto seeds. 
  rn_seeds %>%           # ingresa el objeto tibble 
  select(ciudad:ID, "28_sep_2021":"31_feb_2022") %>% # del tibble selecciona columnas que van de ciudad:ID y de fecha a fehca
  pivot_longer(cols = c("28_sep_2021":"31_feb_2022"), values_to = "sampled_seeds") %>% # modifica el tibble y genera una base larga con una nuve 
                                                                               # columna llamada dates y que tiene las fechas de registros
  mutate_if(is.character, as.factor)   # cambia el typo de objeto de character a factor. 

##### Contabilizando el numero de frutos CL colectado por planta madre  #####

seeds %>% na.omit() %>% # elimina NaS
  group_by(ID, sampled_seeds) %>%  # agrupa por ID y categoria de sampled_seeds
        summarise(n()) %>% # cuenta cuantos casos de cada categoria por cada ID hay
  filter (sampled_seeds == "CL") # muestra solo los casos para CL. 

