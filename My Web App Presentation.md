My Web App Presentation
========================================================
author: Endless-Void    
date: 4 August 2020
autosize: true

My Web Apps
========================================================



Hi. My apps are divided in two kinds:

- Play with graphs: Uses some functions that give us some interesting forms that you can change.
- Preset your exploratory analysis of "Diamonds": Select the variables to plot and see the most statistical plots used. 

Here you can see the url of my web [application](https://endless-void.shinyapps.io/project/)


First Panel "Flower Plot"
========================================================

<font size="6">Using polar coordinates we can do some impressive plots, in this case we do a plot that looks like a flower, and you can say how many petals the flower haves and her color.</font>

&nbsp;  

<font size="6">

```r
p <- 6
t <- (seq(0, 360 * p/2, by = 1)*pi/180)
y <- 2*sin(2*t)
ggplot(data.frame(t, y), aes(t, y)) + geom_line(color = "purple", lwd = 4) + coord_polar()
```
</font>

***
<font size="6">
The User Inputs are: 

- The number of petals.      
- The color of the flower.
- Show or Hide the y and x axis.
</font>

<img src="My Web App Presentation-figure/unnamed-chunk-3-1.png" title="plot of chunk unnamed-chunk-3" alt="plot of chunk unnamed-chunk-3" width="40%" style="display: block; margin: auto;" />


Second Panel "Nice Looking Graph"
========================================================

<font size="6">In this case we are ploting the interaction of two functions that change by the value of three parameters but only one its fixed, so we can modify the other two making some interesting figures.</font>

&nbsp;  

<font size="6">

```r
a <- 4.23
b <- 2.35
t <- seq(-15, 20, by = 0.1)
x <- ((a + b)*cos(t) - b*cos((a/b + 1)*t))
y <- ((a + b)*sin(t) - b*sin((a/b + 1)*t))
plot(x,y, type = "l")
```
</font>
***

The User Inputs are: 

- The value of the parameters "a" and "b".      
- The width of the plot line.


<img src="My Web App Presentation-figure/unnamed-chunk-5-1.png" title="plot of chunk unnamed-chunk-5" alt="plot of chunk unnamed-chunk-5" width="40%" style="display: block; margin: auto;" />
<font size="2">
Credits of the function source to the user [Ramana Balachandhran](https://www.quora.com/What-is-the-most-aesthetically-beautiful-graph-surface-in-mathematics-topology-etc) in the "Quora" web site. 
</font>

Third Panel "Diamonds"
========================================================

<font size="6">This final panel uses the "diamonds" data set to do some user driven exploratory analysis. also we have three other sub panels:</font>

- Scatter Plot: We can do a lm for the relation (y ~ x) preset, showing their coefficients, a predicted value from an input value set by the user and the summary info of the lm.
- Boxplot: Show the boxplot of the Y axis preset by the type of cut displaying a statistical summary for each one.
- Density Plot. Only show the density plot for the X axis preset by type of cut. 

In those we can change the X and Y axis, the types of cuts shown, the alpha transparency and the color set used to represent each type of cut. 


