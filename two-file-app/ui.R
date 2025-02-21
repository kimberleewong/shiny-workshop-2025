# user interface ----
ui <- navbarPage(
  
  title = "LTER Animal Data Explorer",
  
  # (Page 1) intro tabPanel ----
  tabPanel(title = "About this app",
           
           # intro text fluidRow ----
           fluidRow(
             
             column(1),
             column(10, includeMarkdown("text/about.md")),
             column(1)
             
           ), # END intro text fluidRow
           
           hr(),
           
           # footer text ----
           includeMarkdown("text/footer.md")
           
  ), # END (Page 1) intro tabPanel
  
  # (Page 2) data viz tabPanel ----
  tabPanel(title = "Explore the Data",
           
           # tabsetPanel to contain tabs for data viz ----
           tabsetPanel(
             
             # trout tabPanel ----
             tabPanel(title = "Trout",
                      
                      # trout sidebar layout ----
                      sidebarLayout(
                        
                        # trout sidebarPanel ----
                        sidebarPanel(
                          
                          # channel type pickerInput ----
                          pickerInput(inputId = "channel_type_input",
                                      label = "Select channel type(s):",
                                      choices = unique(clean_trout$channel_type),
                                      selected = c("cascade", "pool"),
                                      multiple = TRUE,
                                      options = pickerOptions(actionsBox = TRUE)),
                          
                          # section checkboxGroupButtons ----
                          checkboxGroupButtons(inputId = "section_input",
                                               label = "Select sampling sections(s)",
                                               choices = c("Clear Cut Forests" = "clear cut forest",
                                                           "Old Growth Forests" = "old growth forest"),
                                               selected = c("clear cut forest",
                                                            "old growth forest"),
                                               # buttons take full width of box
                                               justified = TRUE,
                                               checkIcon = list(
                                                 yes = icon("check", lib = "font-awesome"),
                                                 no = icon("xmark", lib = "font-awesome")
                                               ))
                          
                        ), # END trout sidebarPanel
                        
                        # trout main panel
                        mainPanel(
                          
                          # trout scatterplot output ----
                          plotOutput(outputId = "trout_scatterplot_output") %>% 
                            withSpinner(color = "dodgerblue")
                            
                        ), # END trout mainPanel
                        
                      ) # END trout sidebarLayout)
             ), # END trout tabpanel
             
             # penguin tabPanel ----
             tabPanel(title = "Penguin",
                      
                      # penguin sidebar layout ----
                      sidebarLayout(
                        
                        # penguin sidebarPanel ----
                        sidebarPanel(
                          
                          # island picker
                          pickerInput(inputId = "island_input",
                                      label = "Select island(s)",
                                      choices = unique(penguins$island),
                                      selected = c("Dream"),
                                      multiple = TRUE,
                                      options = pickerOptions(actionsBox = TRUE)),
                          
                          # number of bins slider
                          sliderInput(inputId = "bin_input",
                                      label = "Select number of bins:",
                                      min = 1,
                                      max = 100,
                                      value = 25)
                        ), # END penguing sidebarPanel
                        
                        # penguin main panel
                        mainPanel(
                          
                          # penguin histogram
                          plotOutput(outputId = "penguin_histogram_output") %>% 
                            withSpinner(color = "hotpink", type = 4, size = 2)
                        ),# END penguin mainPanel
                        
                      ) # END penguin sidebarlayout
             ) # END penguin tabpanel
             
           ) # END tabsetPanel
           
  ) # END (Page 2) data viz tabPanel
  
  
) # END ui