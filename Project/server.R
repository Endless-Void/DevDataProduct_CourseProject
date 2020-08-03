#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    output$FlowerPlot <- renderPlot({
        
        p <- input$Petalos
        t <- (seq(0, 360 * p/2, by = 1)*pi/180)
        y <- 2*sin(2*t)
        xlab <- ifelse(input$show_xlab, "Theta", "")
        ylab <- ifelse(input$show_ylab, "Rho", "")
        # draw the histogram with the specified number of bins
        ggplot(data.frame(t, y), aes(t, y)) + 
            geom_line(color = input$variable) + 
            coord_polar() +
            xlab(xlab) + ylab(ylab)
        
    })
    
    output$NiceGraph <- renderPlot({
        
        a <- input$a
        b <- input$b
        t <- seq(-15, 20, by = 0.1)
        x <- ((a + b)*cos(t) - b*cos((a/b + 1)*t))
        y <- ((a + b)*sin(t) - b*sin((a/b + 1)*t))
        plot(x,y, type = "l", lwd = input$numeric)
    })
    
    output$D1Graph <- renderPlot({
        data <- diamonds
        bfair <- ifelse(input$show_fair, "Fair", "")
        bgood <- ifelse(input$show_good, "Good", "")
        bvgood <- ifelse(input$show_verygood, "Very Good", "")
        bprem <- ifelse(input$show_premium, "Premium", "")
        bideal <- ifelse(input$show_ideal, "Ideal", "")
        cuts <- c(bfair, bgood, bvgood, bprem, bideal)
        data <- subset(data, cut %in% cuts)
        fit <- lm(reformulate(input$variableX, input$variableY), data = data)
        output$fit1 <-  renderText({paste("Betha0 = ",round(coef(fit)[1], digits = 6))})
        output$fit2 <-  renderText({paste("Betha1 = ",round(coef(fit)[2], digits = 6))})
        ggplot(data, aes_string(input$variableX, input$variableY)) + 
            geom_point(aes(color = cut), alpha = input$alph) +
            scale_colour_brewer(palette = input$colorbrew, direction = -1) + 
            geom_abline(intercept = ({coef(fit)[1]}), slope = ({coef(fit)[2]}),
                        linetype = "dashed", size = 2, color = "black") +
            theme(axis.text=element_text(size=12),
                  legend.text = element_text(size = 15)) +
            guides(colour = guide_legend(override.aes = list(size=10)))
        
    })
    
    output$D2Graph <- renderPlot({
        data <- diamonds
        bfair <- ifelse(input$show_fair, "Fair", "")
        bgood <- ifelse(input$show_good, "Good", "")
        bvgood <- ifelse(input$show_verygood, "Very Good", "")
        bprem <- ifelse(input$show_premium, "Premium", "")
        bideal <- ifelse(input$show_ideal, "Ideal", "")
        cuts <- c(bfair, bgood, bvgood, bprem, bideal)
        data <- subset(data, cut %in% cuts)
        ggplot(data, aes_string("cut", input$variableY)) + 
            geom_boxplot(aes(fill = cut)) +
            scale_fill_brewer(palette = input$colorbrew, direction = -1) +
            theme(legend.position="none") +
            theme(axis.text=element_text(size=15),
                  plot.caption = element_text(size = 15, face = "italic")) +
            labs(caption = "Note: Here the X Axis and the Alpha Transparency (1) are Fixed")
    })
    
    output$sum <- renderPrint({
        
        data <- diamonds
        bfair <- ifelse(input$show_fair, "Fair", "")
        bgood <- ifelse(input$show_good, "Good", "")
        bvgood <- ifelse(input$show_verygood, "Very Good", "")
        bprem <- ifelse(input$show_premium, "Premium", "")
        bideal <- ifelse(input$show_ideal, "Ideal", "")
        cuts <- c(bfair, bgood, bvgood, bprem, bideal)
        data <- subset(data, cut %in% cuts)
        for (i in 1:length(cuts)) {
            if(cuts[i] != ""){
                print(cuts[i])
                data  %>% subset( cut %in% cuts[i]) %>% select(c(input$variableY, "cut")) %>% summary() %>% print()
            }
        }
        
    })
    
    output$D3Graph <- renderPlot({
        data <- diamonds
        bfair <- ifelse(input$show_fair, "Fair", "")
        bgood <- ifelse(input$show_good, "Good", "")
        bvgood <- ifelse(input$show_verygood, "Very Good", "")
        bprem <- ifelse(input$show_premium, "Premium", "")
        bideal <- ifelse(input$show_ideal, "Ideal", "")
        cuts <- c(bfair, bgood, bvgood, bprem, bideal)
        data <- subset(data, cut %in% cuts)
        ggplot(data, aes_string(input$variableX)) + 
            geom_density(aes(fill = cut), alpha = input$alph) +
            scale_fill_brewer(palette = input$colorbrew, direction = -1) +
            theme(axis.text=element_text(size=15),
                  plot.caption = element_text(size = 15, face = "italic"),
                  legend.text = element_text(size = 15)) +
            labs(caption = "Note: Here the X Axis its Fixed")
    })
    
})

