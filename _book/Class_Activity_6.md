# Class Activity 6

## Your Turn 1

### Beer Example

A study of 16 Ohio State University students looked at the relationship between the number of beers a student consumes and their blood alcohol content (BAC) 30 minutes after their last beer.  The regression information from R to predict BAC from number of beers consumed is given below. 



```r
library(readr)
bac <- read_csv("https://raw.githubusercontent.com/deepbas/statdatasets/main/BAC.csv")
```

### (a) Always start with a visual!!!!

Plot the response (BAC) on the y-axis and the explanatory ("predictor") on the x-axis. 


```r
ggplot(data = bac, aes(x = Beers, y = BAC)) + geom_point()
```


\includegraphics[width=1\linewidth]{Class_Activity_6_files/figure-latex/unnamed-chunk-2-1} 

You can modify this basic graph by adding a title and axes labels.


```r
ggplot(data = bac, aes(x = Beers, y = BAC)) + 
     geom_point(shape = 19) +
     labs(title = "Beer and BAC",
          x = "Number of beers drank",
          y = "Blood Alcohol Content") +
     theme_minimal()
```


\includegraphics[width=1\linewidth]{Class_Activity_6_files/figure-latex/unnamed-chunk-3-1} 


- Is there a relationship?
    + direction?
    + strength?
    + form?


### (b) Computing correlation

Since the *form* of the relationship is linear, we can use **correlation** to measure its strength:


```r
cor(bac$BAC, bac$Beers)
```

```
[1] 0.8943381
```


If there are any missing values (`NA`'s) on either of the variables involved in the correlation calculation, use `use = "complete.obs"` as an extra argument to the `cor` function.


```r
cor(bac$BAC, bac$Beers, use = "complete.obs")
```

```
[1] 0.8943381
```

### (c)	Fitting a regression line

We use the `lm(y ~ x, data=mydata)` function to fit a **l**inear (regression) **m**odel for a response y given an explanatory variable x. This command creates a **linear model object** that needs to be assigned a name, here we call it `bac.lm`. You can get the slope and intercept by typing out the object name:


```r
bac.lm <- lm(BAC ~ Beers, data=bac)
bac.lm
```

```

Call:
lm(formula = BAC ~ Beers, data = bac)

Coefficients:
(Intercept)        Beers  
   -0.01270      0.01796  
```

- After running the `lm` command above in your R console, check the **Environment** tab to see that the object `bac.lm` is now one of the objects stored in R's memory (for this session of Rstudio).
- Write down the fitted regression equation to predict BAC from number of beers. 

<details>
<summary><red>Click for answer</red></summary>
*Answer:* $\hat{y} = \ldots$

- You can add this regression line to your scatterplot from part (a) by creating the plot and using the `abline` command: 



```r
# Customized scatter plot with regression line
ggplot(data = bac, aes(x = Beers, y = BAC)) + 
     geom_point(shape = 19) +
     geom_smooth(method = "lm", se = FALSE, color = "blue") +
     labs(title = "Beer and BAC",
          x = "Number of beers drank",
          y = "Blood Alcohol Content") +
     theme_minimal()
```


\includegraphics[width=1\linewidth]{Class_Activity_6_files/figure-latex/unnamed-chunk-7-1} 

</details><br>

### (d)	Interpret the slope in context.

<details>
<summary><red>Click for answer</red></summary>
*Answer:* Drinking one more beer is associated with a 0.0180 unit increase in predicted BAC.
</details><br>

### (e)	Interpret the intercept in context, if it makes sense to do so. 

<details>
<summary><red>Click for answer</red></summary>
*Answer:* The intercept is -0.0127.  A student who drinks 0 beers would be predicted to have a negative blood alcohol content. This is not possible so the intercept does not make sense in this context, but the intercept is included in the model to get the best fit line for the data collected.
</details><br>


### (f)	If your friend at Ohio State drank 2 beers, what would you predict their BAC to be?

<details>
<summary><red>Click for answer</red></summary>
*Answer:* The predicted BAC is 

$$
\widehat{BAC} = -0.0127 + 0.0180(2) = 0.0233.
$$

```r
y.hat <- -0.0127 + 0.0180*(2) 
y.hat
```

```
[1] 0.0233
```

</details><br>

### (g)	Find the residual for the student in the dataset who drank 2 beers and had a BAC of 0.03.

<details>
<summary><red>Click for answer</red></summary>
*Answer:* The residual is 

$$
BAC - \widehat{BAC} = .03 - .0233=0.0067
$$

```r
0.03 - (-0.0127 + 0.0180*(2)) 
```

```
[1] 0.0067
```

</details><br>

### (h) Getting residuals in R

We can use the `resid` command to get the residuals for each case in the data set:


```r
# Residuals 
residuals <- data.frame(Beers = bac$Beers, Residuals = resid(bac.lm))
residuals
```

```
   Beers    Residuals
1      5  0.022881795
2      2  0.006773080
3      9  0.041026747
4      8 -0.011009491
5      3 -0.001190682
6      7 -0.018045729
7      3  0.028809318
8      5 -0.017118205
9      3 -0.021190682
10     5 -0.027118205
11     4  0.010845557
12     6  0.004918033
13     5  0.007881795
14     7 -0.023045729
15     1  0.004736842
16     4 -0.009154443
```



### (i) Getting $R^2$ value

You can use the `summary` command on an `lm` object to get a more detailed print out of your linear model, along with the $R^2$ value for your model:


```r
summary(bac.lm)
```

```

Call:
lm(formula = BAC ~ Beers, data = bac)

Residuals:
      Min        1Q    Median        3Q       Max 
-0.027118 -0.017350  0.001773  0.008623  0.041027 

Coefficients:
             Estimate Std. Error t value Pr(>|t|)    
(Intercept) -0.012701   0.012638  -1.005    0.332    
Beers        0.017964   0.002402   7.480 2.97e-06 ***
---
Signif. codes:  
0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Residual standard error: 0.02044 on 14 degrees of freedom
Multiple R-squared:  0.7998,	Adjusted R-squared:  0.7855 
F-statistic: 55.94 on 1 and 14 DF,  p-value: 2.969e-06
```


### (j) Making a residuals plot

The regression of `BAC` on `Beers` has a residuals plot that plots the model's residuals on the y-axis and the explanatory ("predictor") on the x-axis. We add a horizontal reference line (the detrended regression line) with the `geom_hline()` command:


```r
# code for residual plot
ggplot(data = residuals, aes(x = Beers, y = Residuals)) +
           geom_point(shape = 19) +
           geom_hline(yintercept = 0, color = "blue") +
           labs(title = "Residuals Plot",
                x = "Number of beers drank",
                y = "Residuals") +
           theme_minimal()
```


\includegraphics[width=1\linewidth]{Class_Activity_6_files/figure-latex/unnamed-chunk-12-1} 

**Interpret:** There is one case of 9 beers with a large residual (much higher BAC than predicted), but since there is no clear pattern (trend) in this plot it looks like our regression model adequately describes the relationship between number of beers and BAC. 

- Is the magnitude of the scatter around the horizontal 0-line in the residuals plot greater than, less than, or the same as the magnitude of the scatter around the regression line in the scatterplot?

<details>
<summary><red>Click for answer</red></summary>
*Answer:* The same! The residuals plot is only a "detrended" scatterplot, meaning the vertical distances between a point and the regression line on the scatterplot or a point and the 0-line on the residuals plot are exactly the same. The residual plot looks more scattered because the trend is removed and the scale of the y-axis compressed. 
</details><br>

### (k) Identifying points

We can use the functions `filter` and `row_number` from the `dplyr` package to find the index of Beers equal to 9.


```r
# Use `which` to find the index of Beers equal to 9
index <- which(bac$Beers == 9)
index
```

```
[1] 3
```

<details>
<summary><red>Click for answer</red></summary>
*Answer:* Row 3. 
</details><br>

What is the row number of the case with the most negative residual? We could eyeball the graph to see that the most negative residual is less than -0.02:



```r
# Find residuals less than -0.02
resid_less_than_neg_002 <- resid(bac.lm) < -0.02
resid(bac.lm)[resid_less_than_neg_002]
```

```
          9          10          14 
-0.02119068 -0.02711821 -0.02304573 
```


But this identifies 3 cases. We also can see that the lowest residual drank 5 beers. We can add this statement to the original one using the "and" sign `&`:


```r
# which case had resid less than -0.02 AND drank 5 beers
resid(bac.lm)[which(resid(bac.lm) < -0.02 & bac$Beers == 5)]
```

```
         10 
-0.02711821 
```

### (l) Checking outlier influence

Will the regression line slope increase, decrease or stay the same if we remove case 3, the 9 beer case, from our model? 

Check your answer by adding `subset = -3` to the `lm` command (this removes row 3):


```r
# define a different linear model with row 3 removed 
bac.lm2 <- lm(BAC ~ Beers, data=bac, subset = -3)
```


```r
# Compare the two models
summary(bac.lm2)
```

```

Call:
lm(formula = BAC ~ Beers, data = bac, subset = -3)

Residuals:
      Min        1Q    Median        3Q       Max 
-0.023685 -0.010068 -0.003685  0.011985  0.027208 

Coefficients:
             Estimate Std. Error t value Pr(>|t|)    
(Intercept) 2.481e-05  1.088e-02   0.002    0.998    
Beers       1.455e-02  2.216e-03   6.568  1.8e-05 ***
---
Signif. codes:  
0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Residual standard error: 0.01624 on 13 degrees of freedom
Multiple R-squared:  0.7684,	Adjusted R-squared:  0.7506 
F-statistic: 43.14 on 1 and 13 DF,  p-value: 1.802e-05
```

```r
summary(bac.lm)
```

```

Call:
lm(formula = BAC ~ Beers, data = bac)

Residuals:
      Min        1Q    Median        3Q       Max 
-0.027118 -0.017350  0.001773  0.008623  0.041027 

Coefficients:
             Estimate Std. Error t value Pr(>|t|)    
(Intercept) -0.012701   0.012638  -1.005    0.332    
Beers        0.017964   0.002402   7.480 2.97e-06 ***
---
Signif. codes:  
0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Residual standard error: 0.02044 on 14 degrees of freedom
Multiple R-squared:  0.7998,	Adjusted R-squared:  0.7855 
F-statistic: 55.94 on 1 and 14 DF,  p-value: 2.969e-06
```

- After removing case 3, how has the slope changed? Explain the why the change occurred.

<details>
<summary><red>Click for answer</red></summary>
*Answer:* The slope drops from 0.0180 to 0.0146. Explanation given above.

- After removing case 3, how has the $R^2$ changed? Explain the why the change occurred.
</details><br>

<details>
<summary><red>Click for answer</red></summary>
*Answer:* The $R^2$ descreases from 79.9% to 76.8%. This small decrease happens because case 3 actually enhances the overall linear trend and removing it results is a slight decrease to correlation and $R^2$. 
</details><br>

### (m) Adding a categorical variable to your plot

We can create a scatterplot with plotting symbols color coded by a categorical grouping variable using `ggplot2` package.  We use the `geom_point()` plot geometry to get a scatterplot with the `x`, `y`, and `color` aesthetics specified. Here we look at the `BAC` vs. `Beers` plot with `Gender` added:


```r
ggplot(bac, aes(x=Beers, y=BAC, color=Gender)) + geom_point()
```


\includegraphics[width=1\linewidth]{Class_Activity_6_files/figure-latex/unnamed-chunk-18-1} 

- Are the associations similiar? (form, strength, direction)

<details>
<summary><red>Click for answer</red></summary>
*Answer:* Both females and males have similar strong, positive linear associations.
</details><br>

### (n) Regression lines by groups

A quick way to get the male and female regression line formulas for part (c) is to add a `subset` argument to the `lm` command:


```r
# Fit linear regression model for female
bac.lm.female <- lm(BAC ~ Beers, data = bac, subset = Gender == "female")
bac.lm.female
```

```

Call:
lm(formula = BAC ~ Beers, data = bac, subset = Gender == "female")

Coefficients:
(Intercept)        Beers  
   -0.01567      0.02067  
```



```r
# Fit linear regression model for male
bac.lm.male <- lm(BAC ~ Beers, data = bac, subset = Gender == "male")
bac.lm.male
```

```

Call:
lm(formula = BAC ~ Beers, data = bac, subset = Gender == "male")

Coefficients:
(Intercept)        Beers  
  -0.009785     0.015341  
```

- What is the regression line for females? for males?

<details>
<summary><red>Click for answer</red></summary>
*Answer:* For females: $\widehat{BAC} = -0.016 +0.021(BAC)$ and for males:  $\widehat{BAC} = -0.01 +0.015(BAC)$
</details><br>

- Which gender has the largest slope? What does this suggest about the relationship between number of beers and BAC for this gender?

<details>
<summary><red>Click for answer</red></summary>
*Answer:* The slope for females is slightly higher. This shows that the effect of one more beer on predicted BAC in females is larger than males (a 0.021 increase vs. a 0.015 increase).


Another way to obtain regression models by `Gender` is to split the data set in a female and male data set, then run your `lm` on these two data sets. The benefit of this method is you can then create a residuals plot for your model much easier than the quicker method above:


```r
# Filter data for female
bac_female <- filter(bac, Gender == "female")

# Fit linear regression model for female
bac_lm_female <- lm(BAC ~ Beers, data = bac_female)
bac_lm_female
```

```

Call:
lm(formula = BAC ~ Beers, data = bac_female)

Coefficients:
(Intercept)        Beers  
   -0.01567      0.02067  
```

```r
# Filter data for male
bac_male <- filter(bac, Gender == "male")

# Fit linear regression model for male
bac_lm_male <- lm(BAC ~ Beers, data = bac_male)
bac_lm_male
```

```

Call:
lm(formula = BAC ~ Beers, data = bac_male)

Coefficients:
(Intercept)        Beers  
  -0.009785     0.015341  
```
</details><br>

