#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
navbarPage("My Apps",
           tabPanel("Flower Plot",

    # Application title
    titlePanel("Plot Your Flower"),
    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            sliderInput("Petalos",
                        "Number of Petals:",
                        min = 2,
                        max = 50,
                        value = 2),
            checkboxInput("show_xlab", "Show or Hide Theta", value = TRUE),
            checkboxInput("show_ylab", "Show or Hide Rho", value = TRUE),
            selectInput("variable", "Color:",
                        c("Blue" = "Blue",
                          "Red" = "red",
                          "Purple" = "purple"))
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("FlowerPlot")
        )
    )
),
tabPanel("Nice Looking Graph",
         titlePanel("Play with the Graph"),
         sidebarLayout(
             sidebarPanel(
                 sliderInput("a", "A", min = -10, max = 10, value = 4.23),
                 sliderInput("b", "B", min = -10, max = 10, value = 2.35),
                 numericInput("numeric", "Line Width", value = 3, min = 1, 
                              max = 10, step = 1)
             ),
             mainPanel(
                 plotOutput("NiceGraph", height = "700px", width = "700px")
             )
         )
    ),
tabPanel("Diamonds",
         titlePanel("Diamonds Analysis"),
         sidebarLayout(
             sidebarPanel(
                 sliderInput("alph", "Alpha transparency", min = 0, max = 1, value = 0.8),
                 selectInput("variableX", "Variable X to Plot:",
                             c("Price" = "price",
                               "Carat" = "carat",
                               "Cut" = "cut",
                               "X Dimension" = "x",
                               "Y Dimension" = "y",
                               "Z Dimension" = "z")),
                 selectInput("variableY", "Variable Y to Plot:",
                             c("Carat" = "carat",
                               "Cut" = "cut",
                               "Price" = "price",
                               "X Dimension" = "x",
                               "Y Dimension" = "y",
                               "Z Dimension" = "z")),
                 h3("Select the Cuts to Plot"),
                 checkboxInput("show_fair", "Fair Cuts", value = TRUE),
                 checkboxInput("show_good", "Good Cuts", value = TRUE),
                 checkboxInput("show_verygood", "Very Good Cuts", value = TRUE),
                 checkboxInput("show_premium", "Premium Cuts", value = TRUE),
                 checkboxInput("show_ideal", "Ideal Cuts", value = TRUE),
                 selectInput("colorbrew", "Color of the Plot:",
                             c("Set 1" = "Set1",
                               "Set 2" = "Set2",
                               "Set 3" = "Set3",
                               "Set 4" = "Paired",
                               "Set 5" = "Accent",
                               "Set 6" = "Dark2"))
                 
             ),
             mainPanel(
                 tabsetPanel(type = "tabs",
                             tabPanel("Scatter Plot", br(), plotOutput("D1Graph"), 
                                      textOutput("fit1"), textOutput("fit2")),
                             tabPanel("BoxPlots", br(), plotOutput("D2Graph"), 
                                      h4("Statistical Summary By type of Cut"),
                                      verbatimTextOutput("sum")),
                             tabPanel("Density Plots", br(), plotOutput("D3Graph"))
                 )
             )
         )
    )
)
