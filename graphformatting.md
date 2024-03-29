# Graph Formatting

This worksheet provides a comprehensive guide on graph formatting in R using the ggplot2 package. We will explore various aspects of formatting, such as adding figure numbers, captions, titles, axes labels, customizing themes, and using different color scales.

## Load the required packages and datasets


```r
Cereals <- read.csv("http://people.carleton.edu/~kstclair/data/Cereals.csv")
```

## Graph theme and colors

### Adding figure numbers and captions

To automatically add figure numbers and captions, include the option fig_caption: true in the output options at the top of your markdown file. To add captions to the figures, use the fig.cap argument in the R code chunk that creates the figure.



```r
ggplot(Cereals, aes(x = calgram)) +
  geom_histogram(binwidth = 0.3, fill = "skyblue", color = "black") +
  labs(title = "Histogram of Calorie Content in Cereals",
       x = "Calorie Content (g)",
       y = "Count") +
  theme_minimal()
```

<div class="figure">
<img src="graphformatting_files/figure-html/unnamed-chunk-2-1.png" alt="A nice figure" width="100%" />
<p class="caption">(\#fig:unnamed-chunk-2)A nice figure</p>
</div>


### Customizing titles, axis labels, and legends

You can customize titles, axis labels, and legends using the labs() function.


```r
ggplot(data = diamonds, aes(x = carat, y = price, color = cut)) +
  geom_point(alpha = 0.5) +
  labs(title = "Price vs. Carat of Diamonds",
       subtitle = "Color represents the cut of the diamond",
       x = "Carat",
       y = "Price (USD)",
       color = "Diamond Cut") +
  theme_minimal()
```

<img src="graphformatting_files/figure-html/unnamed-chunk-3-1.png" width="100%" />

### Customizing themes

You can customize themes using the `theme()` function and various `element_*()` functions.


```r
ggplot(mtcars, aes(x = hp, y = mpg)) +
  geom_point() +
  labs(title = "Miles per Gallon vs. Horsepower",
       x = "Horsepower",
       y = "Miles per Gallon") +
  theme_minimal() +
  theme(plot.title = element_text(size = 16, face = "bold", color = "darkblue"),
        axis.title = element_text(size = 12, face = "bold", color = "darkblue"),
        axis.text = element_text(size = 10, color = "black"),
        panel.grid.major = element_line(color = "gray", size = 0.5),
        panel.grid.minor = element_line(color = "gray", size = 0.25))
```

<img src="graphformatting_files/figure-html/unnamed-chunk-4-1.png" width="100%" />


### Using different color scales

You can use different color scales for both continuous and discrete variables using the `scale_color_*()` and `scale_fill_*()` functions.


```r
ggplot(data = diamonds, aes(x = carat, y = price, color = cut)) +
  geom_point(alpha = 0.5) +
  labs(title = "Price vs. Carat of Diamonds",
       subtitle = "Color represents the cut of the diamond",
       x = "Carat",
       y = "Price (USD)",
       color = "Diamond Cut") +
  scale_color_brewer(palette = "Set1") +
  theme_minimal()
```

<div class="figure">
<img src="graphformatting_files/figure-html/fig4-1.png" alt="Figure 4: Scatterplot of price vs. carat of diamonds with color representing the cut and custom color scale." width="100%" />
<p class="caption">(\#fig:fig4)Figure 4: Scatterplot of price vs. carat of diamonds with color representing the cut and custom color scale.</p>
</div>


### Customizing plot elements

You can customize plot elements such as points, lines, and bars using the corresponding `geom_*()` functions and their arguments.


```r
ggplot(mtcars, aes(x = hp, y = mpg, shape = factor(gear), size = gear)) +
  geom_point(aes(color = factor(gear))) +
  labs(title = "Miles per Gallon vs. Horsepower",
       x = "Horsepower",
       y = "Miles per Gallon",
       color = "Number of Gears",
       shape = "Number of Gears",
       size = "Number of Gears") +
  theme_minimal() +
  scale_shape_manual(values = c(16, 17, 18)) +
  scale_color_brewer(palette = "Set2")
```

<img src="graphformatting_files/figure-html/unnamed-chunk-5-1.png" width="100%" />


### Faceting

You can create multiple plots based on a categorical variable using the `facet_wrap()` and `facet_grid()` functions.


```r
ggplot(data = diamonds %>% filter(carat < 3), aes(x = carat, y = price)) +
  geom_point(aes(color = clarity), alpha = 0.5) +
  labs(title = "Price vs. Carat of Diamonds",
       x = "Carat",
       y = "Price (USD)",
       color = "Clarity") +
  facet_wrap(~ cut, ncol = 2) +
  theme_minimal()
```

<img src="graphformatting_files/figure-html/unnamed-chunk-6-1.png" width="100%" />


## Graph Sizing in R

This worksheet demonstrates how to adjust the size of various plots in R using ggplot2. We will explore different techniques to control the size of the plots and their elements.

### Load the necessary libraries and data


```r
library(ggplot2)
library(dplyr)

# Load the built-in datasets
data("mtcars")
data("diamonds")
data("iris")
```


### Adjusting the overall size of the plot

You can control the overall size of the plot using the width and height options within the R Markdown output settings. Another way is to use the ggsave() function when saving the plot as an image file.



```r
scatter_plot <- ggplot(mtcars, aes(x = hp, y = mpg)) +
  geom_point() +
  labs(title = "Miles per Gallon vs. Horsepower",
       x = "Horsepower",
       y = "Miles per Gallon") +
  theme_minimal()

scatter_plot
```

<img src="graphformatting_files/figure-html/unnamed-chunk-8-1.png" width="100%" />


### Adjusting the size of points, lines, and bars

Use the size parameter within the geom_*() functions to control the size of points, lines, and bars.


```r
scatter_plot_large_points <- scatter_plot +
  geom_point(size = 3)

scatter_plot_large_points
```

<img src="graphformatting_files/figure-html/unnamed-chunk-9-1.png" width="100%" />


### Adjusting the size of text elements

You can change the size of text elements, such as axis labels and titles, using the theme() function.


```r
scatter_plot_custom_text <- scatter_plot_large_points +
  theme(plot.title = element_text(size = 24, face = "bold"),
        axis.title.x = element_text(size = 18),
        axis.title.y = element_text(size = 18),
        axis.text.x = element_text(size = 14),
        axis.text.y = element_text(size = 14))

scatter_plot_custom_text
```

<img src="graphformatting_files/figure-html/unnamed-chunk-10-1.png" width="100%" />

### Adjusting the size of legend elements

You can modify the size of the legend elements using the theme() function along with element_text() and element_rect().


```r
iris_scatter_plot <- ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
  geom_point(size = 3) +
  labs(title = "Sepal Length vs. Sepal Width",
       x = "Sepal Length",
       y = "Sepal Width",
       color = "Species") +
  theme_minimal() +
  theme(legend.title = element_text(size = 18),
        legend.text = element_text(size = 14),
        legend.key.size = unit(1.5, "cm"))

iris_scatter_plot
```

<img src="graphformatting_files/figure-html/unnamed-chunk-11-1.png" width="100%" />


### Adjusting the size of facet labels

You can control the size of facet labels using the theme() function along with element_text().


```r
diamonds_facet_plot <- ggplot(data = diamonds %>% filter(carat < 3), aes(x = carat, y = price)) +
geom_point(alpha = 0.5) +
facet_wrap(~cut) +
labs(title = "Price vs. Carat of Diamonds, Faceted by Cut",
x = "Carat",
y = "Price") +
theme_minimal() +
theme(strip.text = element_text(size = 18, face = "bold"))

diamonds_facet_plot
```

<img src="graphformatting_files/figure-html/unnamed-chunk-12-1.png" width="100%" />



### Adjusting the size of axis ticks

You can modify the size of axis ticks using the `theme()` function along with `element_line()`.


```r
scatter_plot_custom_ticks <- scatter_plot +
  theme(axis.ticks = element_line(size = 1.5),
        axis.ticks.length = unit(0.3, "cm"))

scatter_plot_custom_ticks
```

<div class="figure">
<img src="graphformatting_files/figure-html/fig6-1.png" alt="Figure 6: Scatterplot of mpg vs. hp with customized axis tick size." width="100%" />
<p class="caption">(\#fig:fig6)Figure 6: Scatterplot of mpg vs. hp with customized axis tick size.</p>
</div>


### Adding text labels to points

Use the geom_text() or geom_label() functions to add text labels to points.


```r
mtcars$car_name <- rownames(mtcars)

scatter_plot_labels <- ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point(aes(color = gear)) +
  geom_text(aes(label = car_name), check_overlap = TRUE, vjust = 1.5) +
  labs(title = "Scatter plot of MPG vs Weight with Car Labels",
       x = "Weight",
       y = "Miles Per Gallon",
       color = "Gears")

scatter_plot_labels
```

<img src="graphformatting_files/figure-html/unnamed-chunk-13-1.png" width="100%" />

### Modifying axis limits and scales

Use scale_x_continuous() and scale_y_continuous() to modify axis limits and scales.


```r
data("gapminder", package = "gapminder")

ggplot(gapminder, aes(x = gdpPercap, y = lifeExp, color = continent)) +
  geom_point() +
  scale_x_log10() +
  scale_x_continuous(limits = c(500, 50000), breaks = c(1000, 10000, 30000), labels = scales::dollar_format()) +
  scale_y_continuous(limits = c(20, 90), breaks = seq(20, 90, 10)) +
  labs(title = "Life Expectancy vs. GDP per Capita",
       x = "GDP per Capita (log scale)",
       y = "Life Expectancy")
```

<img src="graphformatting_files/figure-html/unnamed-chunk-14-1.png" width="100%" />

