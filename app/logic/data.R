box::use(
  utils[read.csv]
)

box::use(
  here
)

#' @export
fetch_data <- function(){
  read.csv(here::here("data","founder_crops.csv"))
}

#' @export
fetch_founder_crop_map <- function(){
  read.csv(here::here("data","founder_crop_map.csv"))
}