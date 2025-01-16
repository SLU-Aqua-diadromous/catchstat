## code to prepare 'gear' dataset
gear <- readxl::read_excel("data-raw/gear.xlsx")
usethis::use_data(gear, overwrite = TRUE)

## code to prepare 'gear' dataset
species <- readxl::read_excel("data-raw/species.xlsx")
usethis::use_data(species, overwrite = TRUE)

##
## code to prepare 'ackflagg' dataset
ackflagg <- readxl::read_excel("data-raw/ackflagg.xlsx")
usethis::use_data(ackflagg, overwrite = TRUE)

##
## code to prepare 'fleet_key' dataset
fleet_key <- readxl::read_excel("data-raw/fleet_key.xlsx")
usethis::use_data(fleet_key, overwrite = TRUE)

##
## code to prepare 'fishing_area' dataset
fishing_area <- data.frame(
  SUBDIV = c("22", "23", "24", "25", "26", "27", "28", "281", "282", "29", "29N",
             "29S", "30", "31", "32"),
  FishingArea = c("27.3.c.22", "27.3.b.23", "27.3.d.24", "27.3.d.25", "27.3.d.26",
                  "27.3.d.27", "27.3.d.28", "27.3.d.28", "27.3.d.28", "27.3.d.29",
                  "27.3.d.29", "27.3.d.29", "27.3.d.30", "27.3.d.31", "27.3.d.32"),
  stringsAsFactors = FALSE)
usethis::use_data(fishing_area, overwrite = TRUE)
