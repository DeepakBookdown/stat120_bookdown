
# Tutorial 3: Dive Deeper into Data Manipulation with dplyr in R


## Introduction

In this tutorial, we will introduce you to the `dplyr` package, a crucial tool in R for data manipulation. You will learn about various `dplyr` functions such as `group_by`, `summarise`, and `filter`.

---

## dplyr Essentials

### Introduction to dplyr

`dplyr` is a package for data manipulation, offering a set of useful functions to perform operations like filtering, summarizing, and grouping your data. To use `dplyr`, you'll first need to install and load the package.


```r
# install.packages("dplyr")   # uncomment to install
library(dplyr)
```


### Using `group_by()` Function

The `group_by()` function is used to group your data based on one or multiple columns.



```r
# Using inbuilt dataset 'mtcars'
data(mtcars)
head(mtcars)
```

```
                   mpg cyl disp  hp drat    wt  qsec vs am
Mazda RX4         21.0   6  160 110 3.90 2.620 16.46  0  1
Mazda RX4 Wag     21.0   6  160 110 3.90 2.875 17.02  0  1
Datsun 710        22.8   4  108  93 3.85 2.320 18.61  1  1
Hornet 4 Drive    21.4   6  258 110 3.08 3.215 19.44  1  0
Hornet Sportabout 18.7   8  360 175 3.15 3.440 17.02  0  0
Valiant           18.1   6  225 105 2.76 3.460 20.22  1  0
                  gear carb
Mazda RX4            4    4
Mazda RX4 Wag        4    4
Datsun 710           4    1
Hornet 4 Drive       3    1
Hornet Sportabout    3    2
Valiant              3    1
```



```r
# Grouping by number of gears
grouped_data <- mtcars %>% group_by(gear)
```


### Summarization using `summarise()`


After grouping, `summarise()` can help to create summary statistics for each group.



```r
# Continuing with the 'mtcars' dataset
summary_stats <- grouped_data %>%
  summarise(
    Mean_MPG = mean(mpg),
    Max_MPG = max(mpg),
    Min_MPG = min(mpg)
  )

summary_stats
```

```
# A tibble: 3 × 4
   gear Mean_MPG Max_MPG Min_MPG
  <dbl>    <dbl>   <dbl>   <dbl>
1     3     16.1    21.5    10.4
2     4     24.5    33.9    17.8
3     5     21.4    30.4    15  
```


### Data Filtering using `filter()`

The `filter()` function filters rows based on a certain condition.


```r
# Filter cars with 4 gears
filtered_data <- mtcars %>% filter(gear == 4)
```

### Identifying Outliers with `filter()`

You can use `filter()` to identify outliers based on calculated fences or boundaries.



```r
# For demonstration, calculate lower and upper fence for mpg
Q1 <- quantile(mtcars$mpg, 0.25)
Q3 <- quantile(mtcars$mpg, 0.75)
IQR <- Q3 - Q1
lower_fence <- Q1 - 1.5 * IQR
upper_fence <- Q3 + 1.5 * IQR

outliers <- filter(mtcars, mpg < lower_fence | mpg > upper_fence)
outliers
```

```
                mpg cyl disp hp drat    wt qsec vs am gear
Toyota Corolla 33.9   4 71.1 65 4.22 1.835 19.9  1  1    4
               carb
Toyota Corolla    1
```


### Combining All Together

By mastering these `dplyr` functions, you can significantly streamline your data manipulation tasks in R. From grouping and summarizing data to filtering out specific information, `dplyr` offers a powerful toolkit for data manipulation.


```r
# Combining group_by and summarise
mtcars %>% 
  group_by(gear) %>% 
  summarise(Mean_MPG = mean(mpg), N = n())
```

```
# A tibble: 3 × 3
   gear Mean_MPG     N
  <dbl>    <dbl> <int>
1     3     16.1    15
2     4     24.5    12
3     5     21.4     5
```



This tutorial covers the `group_by`, `summarise`, and `filter` functions of the `dplyr` package and demonstrates their use with the built-in dataset `mtcars`. 

