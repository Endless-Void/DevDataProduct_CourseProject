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
            h3("Input the number of petals and the available color of the flower you want."),
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
                              max = 20, step = 1)
             ),
             mainPanel(
                 h3("Set the A and B parameter to make some interesting plots with the line width you want."),
                 plotOutput("NiceGraph", height = "500px", width = "500px")
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
                               "Set 6" = "Dark2")),
                 numericInput("predictor", "Input your predictor value:", value = 1000, min = 1, 
                              max = 50000, step = 1),
                 h5("Note: Predictions Available Only For The Scatter Plot.")
                 
             ),
             mainPanel(
                 tabsetPanel(type = "tabs",
                             tabPanel("Scatter Plot", br(), 
                                      h3("Preset the scatter plot you want, you can also predict a input value depends of the scatter plot you set"), 
                                      plotOutput("D1Graph"),
                                      h4("Lineal Model Coefficients"),
                                      textOutput("fit1"), textOutput("fit2"),
                                      h4("Prediction Value From the Input:"),
                                      textOutput("predout"),
                                      h4("Summary Info. About the Linear Model:"),
                                      verbatimTextOutput("sumfit")),
                             tabPanel("BoxPlots", br(), h3("Define the Boxplot that you want discretized by type of cut."), 
                                      plotOutput("D2Graph"), 
                                      h4("Statistical Summary By Type of Cut"),
                                      verbatimTextOutput("sum")),
                             tabPanel("Density Plots", br(), 
                                      h3("Select the density plot of the variable you want discretized by type of cut,"), 
                                      plotOutput("D3Graph"))
                 )
             )
         )
    )
)
