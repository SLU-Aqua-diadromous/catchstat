## code to prepare 'gear' dataset
gear <- readxl::read_excel("data-raw/gear.xlsx")
usethis::use_data(gear, overwrite = TRUE)
## code to prepare 'gear' dataset
species <- readxl::read_excel("data-raw/species.xlsx")
usethis::use_data(species, overwrite = TRUE)
##
