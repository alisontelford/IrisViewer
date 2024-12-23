#' iris UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#' @import DT
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_iris_ui <- function(id) {
  ns <- NS(id)
  tagList(
    fluidRow(
      column(
        width=12,
        DT::DTOutput(NS(id, "iris_data"))
      )
    )
  )
}
    
#' iris Server Functions
#'
#' @noRd
#' @import datasets
#'
mod_iris_server <- function(id){
  moduleServer(id, function(input, output, session){
    ns <- session$ns
    observe({
      output$iris_data=DT::renderDT(datasets::iris, filter="top",
      options=list(
        autoWidth=TRUE,
        bAutoWidth=FALSE)
      )
    })
  })
}
    
## To be copied in the UI
# mod_iris_ui("iris_1")
    
## To be copied in the server
# mod_iris_server("iris_1")
