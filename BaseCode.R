library(ggplot2)
library(RColorBrewer)
library(plotly)
library(dplyr)
##1 Flower
p <- 6
t <- (seq(0, 360 * p/2, by = 1)*pi/180)
y <- 2*sin(2*t)
ggplot(data.frame(t, y), aes(t, y)) + geom_line(color = "red") + coord_polar()
##2 Nice Looking Graph
a <- 4.23
b <- 2.35
t <- seq(-15, 20, by = 0.1)
x <- ((a + b)*cos(t) - b*cos((a/b + 1)*t))
y <- ((a + b)*sin(t) - b*sin((a/b + 1)*t))
plot(x,y, type = "l")
##3.1 ScatterPlot
data <- diamonds
names(data)
cuts <- c(as.character(unique(data$cut)), "")
data <- subset(data, cut %in% cuts)
fit <- lm(price ~ carat, data = data)
plot <- ggplot(data, aes(carat, price)) + 
        geom_point(aes(color = cut), alpha = 0.1) +
        scale_colour_brewer(palette = "Set1", direction = -1) +
        geom_abline(intercept = coef(fit)[1], slope = coef(fit)[2])
predict(fit, newdata = data.frame(carat = 2))
plot
##3.2 Boxplot
ggplot(data, aes(cut, price)) + 
        geom_boxplot(aes(fill = cut)) +
        scale_fill_brewer(palette = "Set1", direction = -1) +
        theme(legend.position="none") 
sdf <- data.frame()
for (i in 1:length(cuts)) {
        if(cuts[i] != ""){
                data %>% subset( cut %in% cuts[i]) %>% select("carat") %>% summary() %>% print()
                }
}
###3.3 Density
ggplot(data, aes(price)) + 
        geom_density(aes(fill = cut), alpha = 0.5) +
        scale_fill_brewer(palette = "Set1", direction = -1) 

library(rsconnect)
rsconnect::deployApp('/Users/giovannygranados/Desktop/Data_Scientist/R/DevDataProducts/W4/DevDataProduct_CourseProject/Project')
