# Class Activity 23

## Example 1: The data on `CricketChirps` were collected by E.A. Bessey and C.A. Bessey who measured chirp rates for crickets and temperatures during the summer of 1898. Conduct a simple linear regression analysis to predict the temperature by cricket chirp rate.



```r
cricket <- read.csv("https://www.lock5stat.com/datasets3e/CricketChirps.csv")
cricket
```

```
  Temperature Chirps
1        54.5     81
2        59.5     97
3        63.5    103
4        67.5    123
5        72.0    150
6        78.5    182
7        83.0    195
```



```r
mod <- lm(Temperature~Chirps, data = cricket)
summary(mod)
```

```

Call:
lm(formula = Temperature ~ Chirps, data = cricket)

Residuals:
      1       2       3       4       5       6       7 
-1.8625 -0.5532  2.0628  1.4495 -0.2785 -1.1598  0.3416 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept) 37.67858    1.97817   19.05 7.35e-06 ***
Chirps       0.23067    0.01423   16.21 1.63e-05 ***
---
Signif. codes:  
0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Residual standard error: 1.528 on 5 degrees of freedom
Multiple R-squared:  0.9813,	Adjusted R-squared:  0.9776 
F-statistic: 262.9 on 1 and 5 DF,  p-value: 1.626e-05
```

### (1a) What is the equation for the regression line? Define all the variables.

*Answer:*

\vspace*{1in}


### (1b) What is the Standard Error(SE) for the slope?

*Answer:*

\vspace*{1in}

### (1c) Find a 95% confidence interval for the slope of the cricket temperature model.

*Answer:*

\vspace*{1in}

### (1d) Conduct a hypotheis test for the slope. Include all the steps. 

*Answer:*

\vspace*{3in}

### (1e) Conduct a hypothesis test to see if there exists some association between temperature and chirp rate.


```r
anova(mod)
```

```
Analysis of Variance Table

Response: Temperature
          Df Sum Sq Mean Sq F value    Pr(>F)    
Chirps     1 613.69  613.69  262.92 1.626e-05 ***
Residuals  5  11.67    2.33                      
---
Signif. codes:  
0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```

*Answer:*

\vspace*{3in}

### (1f) What is the coefficient of determination ($R^2$) in this example? Interpret it.


*Answer:*

\vspace*{2in}

### (1g) Lastly, verify if the conditions for linear model are met.



```r
plot(cricket$Chirps, cricket$Temperature, type = "p", pch = 19)
abline(mod)
```

<img src="Class_Activity_23_files/figure-epub3/unnamed-chunk-4-1.png" width="100%" />

```r
plot(cricket$Temperature, mod$residuals, type = "p", pch = 19)
abline(h = 0, col = "red")
```

<img src="Class_Activity_23_files/figure-epub3/unnamed-chunk-4-2.png" width="100%" />

```r
qqnorm(mod$residuals)
qqline(mod$residuals, col = "blue")
```

<img src="Class_Activity_23_files/figure-epub3/unnamed-chunk-4-3.png" width="100%" />


*Answer:*

\vspace*{2in}


### Example 2: Nutrition information for a sample of 30 breakfast cereals, derived from nutrition labels are stored under `Cereals` dataset. Calorie values are per cup of cereal and sugars are measured in grams per cup. We would like to predict the calorie count by the suger content of the cereal.


```r
cerealdat <- read.csv("https://www.lock5stat.com/datasets3e/Cereal.csv")
```


```r
mod <- lm(Calories~Sugars, data = cerealdat)
summary(mod)
```

```

Call:
lm(formula = Calories ~ Sugars, data = cerealdat)

Residuals:
    Min      1Q  Median      3Q     Max 
-36.574 -25.282  -2.549  17.796  51.805 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept)  88.9204    10.8120   8.224 5.96e-09 ***
Sugars        4.3103     0.9269   4.650 7.22e-05 ***
---
Signif. codes:  
0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Residual standard error: 26.61 on 28 degrees of freedom
Multiple R-squared:  0.4357,	Adjusted R-squared:  0.4156 
F-statistic: 21.62 on 1 and 28 DF,  p-value: 7.217e-05
```

```r
anova(mod)
```

```
Analysis of Variance Table

Response: Calories
          Df Sum Sq Mean Sq F value    Pr(>F)    
Sugars     1  15316 15316.5  21.623 7.217e-05 ***
Residuals 28  19834   708.3                      
---
Signif. codes:  
0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```

### (2a) What is the equation for the regression line? Define all the variables.

*Answer:*

\vspace*{1in}

### (2b) Check the conditions for using linear model.

*Answer:*




```r
plot(cerealdat$Sugars, cerealdat$Calories, type = "p", pch = 19)
abline(mod)
```

<img src="Class_Activity_23_files/figure-epub3/unnamed-chunk-7-1.png" width="100%" />

```r
plot(cerealdat$Sugars, mod$residuals, type = "p", pch = 19)
abline(h = 0, col = "red")
```

<img src="Class_Activity_23_files/figure-epub3/unnamed-chunk-7-2.png" width="100%" />

```r
qqnorm(mod$residuals)
qqline(mod$residuals, col = "blue")
```

<img src="Class_Activity_23_files/figure-epub3/unnamed-chunk-7-3.png" width="100%" />


\vspace*{1in}


### (2c) Conduct a hypotheis test to determine if the linear model is effective. Include all the steps. Remember, we can still proceed with the hypothesis tests if some of the assumptions are slightly violated.

*Answer:*

\vspace*{1in}




