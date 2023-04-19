box::use(
  shiny[navbarPage, moduleServer, NS],
  bslib[bs_theme,bs_themer],
  thematic[thematic_shiny]
)

box::use(
  app/view/Founder_Crop_Map
)

#' @export
ui <- function(id) {
  thematic::thematic_shiny()
  ns <- NS(id)
  navbarPage(
    "Neolithic Founder Crops",
    theme = bs_theme(bootswatch = "zephyr",
                     primary = "#EDEFF7"),
    
    Founder_Crop_Map$ui(ns("fcmtab"))
    
  )
}

#' @export
server <- function(id) {
  #bslib::bs_themer()
  moduleServer(id, function(input, output, session) {
    
    Founder_Crop_Map$server("fcmtab")
  
  })
}