#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @import shinydashboard
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # Your application UI logic
    dashboardPage(
      # Set up the dashboard header.
      dashboardHeader(
        title="Iris Data Viewer"
      ),
      # Set up the dashboard sidebar.
      dashboardSidebar(
        sidebarMenu(
          id="sidebarID",
          menuItem("Iris", tabName="iris", icon=icon("home"))
        )
      ),
      dashboardBody(
        tabItems(
          tabItem(
            tabName="iris",
            mod_iris_ui("iris_1")
          )
        )
      )
    )
  )
}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function() {
  add_resource_path(
    "www",
    app_sys("app/www")
  )

  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys("app/www"),
      app_title = "IrisViewer"
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )
}
