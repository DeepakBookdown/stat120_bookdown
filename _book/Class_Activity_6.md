# Class Activity 6

## Your Turn 1

### Beer Example

A study of 16 Ohio State University students looked at the relationship between the number of beers a student consumes and their blood alcohol content (BAC) 30 minutes after their last beer.  The regression information from R to predict BAC from number of beers consumed is given below. 



```r
bac <- read.csv("https://raw.githubusercontent.com/deepbas/statdatasets/main/BAC.csv")
```

 (a). Always start with a visual!!!!

Plot the response (BAC) on the y-axis and the explantory ("predictor") on the x-axis. 


```r
plot(BAC ~ Beers, data=bac)  
```

<img src="Class_Activity_6_files/figure-epub3/unnamed-chunk-2-1.png" width="100%" />

- Is there a relationship?
    + direction?
    + strength?
    + form?


You can modify this basic graph by adding a title and changing the plotting symbol. The `pch=19` argument changes the symbols to filled circles.


```r
plot(BAC ~ Beers, data=bac, pch=19, 
     main="Beer and BAC", xlab="Number of beers drank", ylab = "Blood Alcohol Content")
```

<img src="Class_Activity_6_files/figure-epub3/unnamed-chunk-3-1.png" width="100%" />

<br>

 (b). Computing correlation

Since the *form* of the relationship is linear, we can use **correlation** to measure its strength:


```r
cor(bac$BAC, bac$Beers)
```

```
[1] 0.8943381
```

<br>

 (c).	Fitting a regression line

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
# Need to call the plot function again!!

plot(BAC ~ Beers, data=bac, pch=19, 
     main="Beer and BAC", xlab="Number of beers drank", ylab = "Blood Alcohol Content")
abline(bac.lm) # adds regression line to the plot above
```

<img src="Class_Activity_6_files/figure-epub3/unnamed-chunk-6-1.png" width="100%" />

</details>

<br>

 (d).	Interpret the slope in context.

<details>
<summary><red>Click for answer</red></summary>
*Answer:* Drinking one more beer is associated with a 0.0180 unit increase in predicted BAC.
</details>
<br>

 (e).	Interpret the intercept in context, if it makes sense to do so. 

<details>
<summary><red>Click for answer</red></summary>
*Answer:* The intercept is -0.0127.  A student who drinks 0 beers would be predicted to have a negative blood alcohol content. This is not possible so the intercept does not make sense in this context, but the intercept is included in the model to get the best fit line for the data collected.
</details>
<br>

 (f).	If your friend at Ohio State drank 2 beers, what would you predict their BAC to be?

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
</details>
<br>

 (g).	Find the residual for the student in the dataset who drank 2 beers and had a BAC of 0.03.
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

</details>
<br>

 (h). Getting residuals in R

<details>
<summary><red>Click for answer</red></summary>
We can use the `resid` command to get the residuals for each case in the data set:


```r
# part h
resid(bac.lm)
```

```
           1            2            3            4 
 0.022881795  0.006773080  0.041026747 -0.011009491 
           5            6            7            8 
-0.001190682 -0.018045729  0.028809318 -0.017118205 
           9           10           11           12 
-0.021190682 -0.027118205  0.010845557  0.004918033 
          13           14           15           16 
 0.007881795 -0.023045729  0.004736842 -0.009154443 
```

Notice that case 2 in the data drank 2 beers and had a BAC recorded as 0.03. We can see that their residual value matches our answer to (g) up to some rounding error. 


```r
# part h
bac$BAC[2]
```

```
[1] 0.03
```

```r
bac$Beers[2]
```

```
[1] 2
```

```r
resid(bac.lm)[2]
```

```
         2 
0.00677308 
```
</details>
<br>

 (i). Getting $R^2$ value
<details>
<summary><red>Click for answer</red></summary>
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
</details>
<br>

 (j). Making a residuals plot
 
<details>
<summary><red>Click for answer</red></summary>
The regression of `BAC` on `Beers` has a residuals plot that plots the model's residuals on the y-axis and the explantory ("predictor") on the x-axis. We add a horizontal reference line (the detrended regression line) with the `abline(h=0)` command:


```r
# code for residual plot
plot(resid(bac.lm) ~ Beers, data=bac, pch=19, main = "residuals plot")  
abline(h=0)
```

<img src="Class_Activity_6_files/figure-epub3/unnamed-chunk-12-1.png" width="100%" />
<br>


**Interpret:** There is one case of 9 beers with a large residual (much higher BAC than predicted), but since there is no clear pattern (trend) in this plot it looks like our regression model adequately describes the relationship between number of beers and BAC. 
</details>

- Is the magnitude of the scatter around the horizontal 0-line in the residuals plot greater than, less than, or the same as the magnitude of the scatter around the regression line in the scatterplot?
<br>

<details>
<summary><red>Click for answer</red></summary>
*Answer:* The same! The residuals plot is only a "detrended" scatterplot, meaning the vertical distances between a point and the regression line on the scatterplot or a point and the 0-line on the residuals plot are exactly the same. The residual plot looks more scattered because the trend is removed and the scale of the y-axis compressed. 
</details>
<br>

 (k). Identifying points
The `which` command can be used to identify points by their row number in a scatterplot. 

We can use `==` to see which case drank exactly 9 beers. Which is the row number of the case that drank 9 beers? 


```r
plot(BAC ~ Beers, data=bac, pch=19)  
```

<img src="Class_Activity_6_files/figure-epub3/unnamed-chunk-13-1.png" width="100%" />

```r
which(bac$Beers == 9)
```

```
[1] 3
```

<details>
<summary><red>Click for answer</red></summary>
*Answer:* Row 3. 
</details>


What is the row number of the case with the most negative residual?

<details>
<summary><red>Click for answer</red></summary>

```r
plot(resid(bac.lm) ~ Beers, data=bac, pch=19)  
abline(h=0)
```

<img src="Class_Activity_6_files/figure-epub3/unnamed-chunk-14-1.png" width="100%" />
<br>


We could eyeball the graph to see that the most negative residual is less than -0.02:


```r
# which case has resid less than -0.02?

resid(bac.lm)[which(resid(bac.lm) < -0.02)]
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

</details>
<br>

 (l). Checking outlier influence

Will the regression line slope increase, decrease or stay the same if we remove case 3, the 9 beer case, from our model? 

Check your answer by adding `subset = -3` to the `lm` command (this removes row 3):

<details>
<summary><red>Click for answer</red></summary>

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
<br>

- After removing case 3, how has the slope changed? Explain the why the change occurred.


*Answer:* The slope drops from 0.0180 to 0.0146. Explanation given above.
</details>

- After removing case 3, how has the $R^2$ changed? Explain the why the change occurred.

<details>
<summary><red>Click for answer</red></summary>
*Answer:* The $R^2$ decreases from 79.9% to 76.8%. This small decrease happens because case 3 actually enhances the overall linear trend and removing it results is a slight decrease to correlation and $R^2$. 
</details>
<br>

 (m). Adding a categorical variable to your plot

We can create a scatterplot with plotting symbols color coded by a categorical grouping variable using `ggplot2` package.  We use the `geom_point()` plot geometry to get a scatterplot with the `x`, `y`, and `color` aesthetics specified. Here we look at the `BAC` vs. `Beers` plot with `Gender` added:


```r
library(ggplot2)
ggplot(bac, aes(x=Beers, y=BAC, color=Gender)) + geom_point()
```

<img src="Class_Activity_6_files/figure-epub3/unnamed-chunk-19-1.png" width="100%" />

- Are the associations similar? (form, strength, direction)

<details>
<summary><red>Click for answer</red></summary>
*Answer:* Both females and males have similar strong, positive linear associations.
</details>
<br>

 (n). Regression lines by groups

A quick way to get the male and female regression line formulas for part (c) is to add a `subset` argument to the `lm` command:


```r
bac.lm.female <- lm(BAC ~ Beers, data=bac, subset = Gender == "female")
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
# enter code for the male model

bac.lm.male <- lm(BAC ~ Beers, data=bac, subset = Gender == "male")
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
</details>

- Which gender has the largest slope? What does this suggest about the relationship between number of beers and BAC for this gender?

<details>
<summary><red>Click for answer</red></summary>
*Answer:* The slope for females is slightly higher. This shows that the effect of one more beer on predicted BAC in females is larger than males (a 0.021 increase vs. a 0.015 increase).

<br>

Another way to obtain regression models by `Gender` is to split the data set in a female and male data set, then run your `lm` on these two data sets. The benefit of this method is you can then create a residuals plot for your model much easier than the quicker method above:


```r
bac.female <- subset(bac, sub = Gender == "female")
lm(BAC ~ Beers, data=bac.female)
```

```

Call:
lm(formula = BAC ~ Beers, data = bac.female)

Coefficients:
(Intercept)        Beers  
   -0.01567      0.02067  
```

```r
bac.male <- subset(bac, sub = Gender == "male")
lm(BAC ~ Beers, data=bac.male)
```

```

Call:
lm(formula = BAC ~ Beers, data = bac.male)

Coefficients:
(Intercept)        Beers  
  -0.009785     0.015341  
```
</details>
<br>

-------------------------------------------------------------------------------

### Mice Mass Example

The time of day in which calories are consumed can affect weight gain.  At least, that appears to be true in mice.   Mice normally eat all their calories at night, but when mice ate some of their calories during the day (when mice are supposed to be sleeping), they gained more weight even though all the mice ate the same total amount of calories.  Here we look at the regression of body mass gain in grams, `BMGain`, against the percent of calories eaten during the day, `DayPct` for a study involving 27 mice.  The R commands needed to answer the questions below are:


```r
mice <- read.csv("https://raw.githubusercontent.com/deepbas/statdatasets/main/MICE.csv")
  
plot(BMGain ~ DayPct, data=mice, pch=19)
mice.lm <- lm(BMGain ~ DayPct, data=mice)
mice.lm
```

```

Call:
lm(formula = BMGain ~ DayPct, data = mice)

Coefficients:
(Intercept)       DayPct  
     1.1128       0.1273  
```

```r
cor(mice$BMGain, mice$DayPct)
```

```
[1] 0.7398623
```

```r
abline(mice.lm) # adds regression line to previously created scatterplot
```

<img src="Class_Activity_6_files/figure-epub3/unnamed-chunk-22-1.png" width="100%" />

 (a).  What are the coordinates (roughly) of the case with the largest positive residual?


```r
mice[which(resid(mice.lm) == max(resid(mice.lm))),]
```

```
    X Light BMGain Corticosterone DayPct Consumption
25 25    LL   17.4         66.679 81.636       7.177
   GlucoseInt   GTT15  GTT120 Activity
25        Yes 435.644 405.941     6702
```

<details>
<summary><red>Click for answer</red></summary>
*Answer:* The case with the largest residual is located at about 80% calories and 17g body mass gain. We can find which row this corresponds to using the `which` command shown below. 
</details>
<br>

 (b).  What are the coordinates (roughly) of the case with the most negative residual?


```r
mice[which(resid(mice.lm) == min(resid(mice.lm))),]
```

```
    X Light BMGain Corticosterone DayPct Consumption
10 10    DM   3.42         208.26 55.051       3.857
   GlucoseInt   GTT15  GTT120 Activity
10         No 271.717 148.485     1084
```

<details>
<summary><red>Click for answer</red></summary>
*Answer:* The case with the most negative residual is located at about 55% calories and 3g body mass gain. We can find which row this corresponds to using the `which` command shown below. The code below also highlights the cases in (a) with a circle and (b) with a square.
</details>
<br>

 (c).  What is the predicted body mass gain for a mouse that eats 50% of its calories during the day?

$$
\widehat{BMGain} =1.1128+0.1273(50)=7.48
$$

```r
1.1128 + .1273*50
```

```
[1] 7.4778
```

<details>
<summary><red>Click for answer</red></summary>
*Answer:* A mouse that eats 50% of its calories during the day is predicted to gain 7.48 grams.
</details>
<br>

 (d).  Find the residual for the mouse who ate 48.3% of its calories during the day and gained 5.82 grams.

<details>
<summary><red>Click for answer</red></summary>
*Answer:* We first find the predicted body mass gain: 
$$
\widehat{BMGain} = 1.1128+0.1273(48.3)=7.26
$$

The residual is then:  
$$
Residual = BMGain  -   \widehat{BMGain} =  5.82 – 7.26 = –1.44.
$$

```r
1.1128 + .1273*48.3
```

```
[1] 7.26139
```

```r
5.82 - (1.1128 + .1273*48.3)
```

```
[1] -1.44139
```
</details>
<br>

 (e).  Interpret the slope of the regression line in context.

<details>
<summary><red>Click for answer</red></summary>
*Answer:* The slope is 0.1273.  When a mouse eats one more percent of its calories during the day, its predicted body mass gain goes up by 0.1273 grams.
</details>
<br>

 (f).  Interpret the intercept of the line in context, if it makes sense to do so.

<details>
<summary><red>Click for answer</red></summary>
*Answer:* The intercept is 1.1128.  A mouse who eats 0% of its calories during the day (and all of them at night when a mouse normally eats all its food) is predicted to gain 1.11 grams.  But this would be **extrapolation** because the range of observed percents is, roughly, 20-90. It does not make sense to interpret the intercept in this context.
</details>
<br>

 (g). Use the correlation value to compute $R^2$, then interpret (in context) the $R^2$ value for this model. 


```r
r <- 0.7398623
r^2
```

```
[1] 0.5473962
```

<br>


 (h). Get the value of $R^2$ from the regression output, then interpret (in context) the $R^2$ value for this model. 


```r
summary(mice.lm)
```

```

Call:
lm(formula = BMGain ~ DayPct, data = mice)

Residuals:
    Min      1Q  Median      3Q     Max 
-4.6990 -1.1694  0.0728  0.9174  5.8975 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept)  1.11280    1.38211   0.805    0.428    
DayPct       0.12727    0.02315   5.499 1.03e-05 ***
---
Signif. codes:  
0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Residual standard error: 2.231 on 25 degrees of freedom
Multiple R-squared:  0.5474,	Adjusted R-squared:  0.5293 
F-statistic: 30.24 on 1 and 25 DF,  p-value: 1.032e-05
```

<details>
<summary><red>Click for answer</red></summary>
*Answer:* From `Multiple R-squared`, we get $R^2 =  0.547$. The percent of calories that a mouse eats during the day explains about 55% of the variability in weight gain for this study.

</details>

<br>

---------------------------------

### Forbes Example

In the mid 1800s, James D. Forbes conducted a experiments designed to determine if the atmospheric pressure at a given location can just be determined by the boiling temp of water at that location. 


(a). Fit the linear regression of `Pressure` on `Temp`:



```r
forbes <-  read.csv("https://raw.githubusercontent.com/deepbas/statdatasets/main/forbes.csv")
plot(Pressure ~ Temp, data=forbes, pch=19, main = "Pressure vs. Temp")
forbes.lm <- lm(Pressure ~ Temp, data=forbes)
abline(forbes.lm)
```

<img src="Class_Activity_6_files/figure-epub3/unnamed-chunk-29-1.png" width="100%" />

```r
summary(forbes.lm)
```

```

Call:
lm(formula = Pressure ~ Temp, data = forbes)

Residuals:
     Min       1Q   Median       3Q      Max 
-0.25717 -0.11246 -0.05102  0.14283  0.64994 

Coefficients:
             Estimate Std. Error t value Pr(>|t|)    
(Intercept) -81.06373    2.05182  -39.51   <2e-16 ***
Temp          0.52289    0.01011   51.74   <2e-16 ***
---
Signif. codes:  
0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Residual standard error: 0.2328 on 15 degrees of freedom
Multiple R-squared:  0.9944,	Adjusted R-squared:  0.9941 
F-statistic:  2677 on 1 and 15 DF,  p-value: < 2.2e-16
```
<br>

- Describe the relationship between pressure and temp (strength, form, direction).

<details>
<summary><red>Click for answer</red></summary>
*Answer:* This is a strong, positive relationship that looks linear.
</details>

- Interpret the value of $R^2$

<details>
<summary><red>Click for answer</red></summary>
*Answer:* About 99.4% of the variation observed in pressure can be explained by the boiling point temps. 
</details>

<br>


 (b). Check the residuals plot


```r
plot(resid(forbes.lm) ~ Temp, data=forbes, pch=19, main = "Residuals plot")
abline(h=0)
```

<img src="Class_Activity_6_files/figure-epub3/unnamed-chunk-30-1.png" width="100%" />

- Is the relationship between pressure and temp linear?

<details>
<summary><red>Click for answer</red></summary>
*Answer:* No! There is curvature, which means the linear model is systematically underestimating pressure at low and high temps and overestimating pressure at mid-range temps. 
</details>

- Does the residual plot highlight an unusual case? Explain.

<details>
<summary><red>Click for answer</red></summary>
*Answer:* Yes, there is one case that has an unusually high pressure value given its temp. 
</details>


<br>

 (c). "Fixing" the model

A linear model can be used with this data if we **transform**  the response  variable to the logarithmic scale. Here `log(y)` gives the natural log of the variable `y`. 


```r
plot(log(Pressure) ~ Temp, data=forbes, pch=19, main = "Pressure vs. Temp")
forbes.lm2 <- lm(log(Pressure) ~ Temp, data=forbes)
abline(forbes.lm2)
```

<img src="Class_Activity_6_files/figure-epub3/unnamed-chunk-31-1.png" width="100%" />

```r
plot(resid(forbes.lm2) ~ Temp, data=forbes, pch=19, main = "Residuals plot")
abline(h=0)
```

<img src="Class_Activity_6_files/figure-epub3/unnamed-chunk-31-2.png" width="100%" />

- Has the curvature in the scatterplot and residuals plots been reduced by logging the variables? 

<details>
<summary><red>Click for answer</red></summary>
*Answer:* Yes, there is less curvature
</details>
<br>

- Has the outlier been eliminated by logging the variables?

<details>
<summary><red>Click for answer</red></summary>
*Answer:* No, the outlier is still present.
</details>

<br>


 (d). Removing bad measurement

Identify which case has the large residual value around 0.03. 


```r
resid(forbes.lm2)[which(resid(forbes.lm2) > 0.02)]
```

```
        12 
0.03131388 
```

Repeat part (c) but this time remove the case you identified. The easiest way to do this is to create a new version of the data with row 12 removed:

<details>
<summary><red>Click for answer</red></summary>

```r
forbes2 <- forbes[-12, ]
plot(log(Pressure) ~ Temp, data=forbes2, pch=19, main = "Pressure vs. Temp")
forbes.lm2 <- lm(log(Pressure) ~ Temp, data=forbes2)
abline(forbes.lm2)
```

<img src="Class_Activity_6_files/figure-epub3/unnamed-chunk-33-1.png" width="100%" />

```r
plot(resid(forbes.lm2) ~ Temp, data=forbes2, pch=19, main = "Residuals plot")
abline(h=0)
```

<img src="Class_Activity_6_files/figure-epub3/unnamed-chunk-33-2.png" width="100%" />

</details>
