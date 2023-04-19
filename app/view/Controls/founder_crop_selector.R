box::use(
  app/logic/data
)

box::use(
  dplyr[select,pull],
  shiny[selectInput]
)


#' @export
selection <- function(fcArg){
  
    data$fetch_founder_crop_map() |>
    select(founder_crop) |>
    unique() |>
    pull() -> founder_crops
  
  selectInput(inputId = fcArg,
              "Select a founder crop",
              choices = founder_crops,
              selected = 1)
  
}