library(fresh)

create_theme(
  
  adminlte_color(
    light_blue = "darkblue"
  ),
  
  adminlte_global(
    content_bg = "lightpink"
  ),
  
  adminlte_sidebar(
    dark_bg = "lightblue",
    dark_hover_bg = "purple",
    dark_color = "lightgreen",
    width = "400px"
  ),
  
  output_file = here::here("shinydashboard/www/dashboard-fresh-theme.css")
  
)