box::use(
  app/logic/data
)

box::use(
  app/view/Controls/founder_crop_selector
)

box::use(
  shiny[NS,tabPanel,fluidRow,column,moduleServer,reactive],
  dplyr[filter],
  leaflet[leaflet,setView,addTiles,addMarkers,renderLeaflet,
          leafletOutput],
  bslib[card,card_header,card_body_fill],
  htmltools[htmlEscape]
)

#' @export
ui <- function(id) {
  ns <- NS(id)
  
  tabPanel("Founder Crop Map",
           fluidRow(
             column(3,
                    card(
                         height = 500,
                         card_header("Controls"),
                         card_body_fill(founder_crop_selector$selection(ns("founder_crop_selection"))
                        )
                    )
             ),
             column(9,
                    card(
                         height = 800,
                         card_header("Map"),
                         card_body_fill(leafletOutput(ns("founder_crop_map")))
                    )
             )
           )
  ) 
  
}

#' @export
server <- function(id) {
  moduleServer(id, function(input, output, session) {
    
    output$founder_crop_map <- renderLeaflet ({
    
      data$fetch_founder_crop_map() |>
      filter(founder_crop == input$founder_crop_selection) |>
      leaflet() |>
      setView(lng = 39,lat = 35, zoom = 6) |>
      addTiles() |>
      addMarkers(lng = ~longitude,lat = ~latitude,label = ~htmlEscape(site_name))
    
    })
  })
}