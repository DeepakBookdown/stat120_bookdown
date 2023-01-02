# Class Activity 25


## Example 1: Beer

A study of 16 Ohio State University students looked at the relationship between the number of beers a student consumes and their blood alcohol content (BAC) 30 minutes after their last beer.  The regression information from R to predict BAC from number of beers consumed is given below.


```r
library(psych)
bac <- read.csv("https://raw.githubusercontent.com/deepbas/statdatasets/main/BAC.csv")
pairs.panels(bac[,2:5], method = "pearson", ellipses = FALSE, smooth = FALSE)
```

<img src="Class_Activity_25_files/figure-epub3/unnamed-chunk-1-1.png" width="100%" />

```r
bac.lm <- lm(BAC ~ Beers, data=bac)
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

```r
confint(bac.lm)
```

```
                  2.5 %     97.5 %
(Intercept) -0.03980535 0.01440414
Beers        0.01281262 0.02311490
```

```r
qt(.975,14)
```

```
[1] 2.144787
```

### (a)	Show how the test stat for slope is computed when testing $H_0: \beta_1=0$ vs. $H_A: \beta_1 \neq 0$.

*Answer:* The t test stat has the usual form:
$$
t = \dfrac{0.017964 - 0}{0.002402} = 7.48
$$


```r
0.017964/0.002402
```

```
[1] 7.478768
```


### (b)	Is the effect of beers on BAC statistically significant?

*Answer:* Yes, the effect of the number of beers on BAC is statistically significant (t=7.48, df=14, p<0.0001). The observed slope of 0.018 is 7.48 SEs away from the hypothesized slope of 0. If we repeated this experiment many times, less than 0.01% of the time we would see an observed slope that is 7.48 SEs or more away from 0 if the true slope was 0.

### (c)	Interpret the 95% confidence interval for slope in context.

*Answer:* Each additional beer is associated with an average increase in BAC of 0.018 (95% CI 0.013 to 0.023).
$$
0.017964 \pm  (2.144787)0.002402 = 0.013, 0.023
$$

```r
0.017964 - (2.144787)*0.002402
```

```
[1] 0.01281222
```

```r
0.017964 + (2.144787)*0.002402
```

```
[1] 0.02311578
```

\newpage

```r
bac.lm2 <- lm(BAC ~ Beers + Weight, data=bac)
summary(bac.lm2)
```

```

Call:
lm(formula = BAC ~ Beers + Weight, data = bac)

Residuals:
       Min         1Q     Median         3Q        Max 
-0.0162968 -0.0067796  0.0003985  0.0085287  0.0155621 

Coefficients:
              Estimate Std. Error t value Pr(>|t|)    
(Intercept)  3.986e-02  1.043e-02   3.821  0.00212 ** 
Beers        1.998e-02  1.263e-03  15.817 7.16e-10 ***
Weight      -3.628e-04  5.668e-05  -6.401 2.34e-05 ***
---
Signif. codes:  
0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Residual standard error: 0.01041 on 13 degrees of freedom
Multiple R-squared:  0.9518,	Adjusted R-squared:  0.9444 
F-statistic: 128.3 on 2 and 13 DF,  p-value: 2.756e-09
```

```r
confint(bac.lm2)
```

```
                    2.5 %        97.5 %
(Intercept)  0.0173236162  0.0624030896
Beers        0.0172473838  0.0227040401
Weight      -0.0004852704 -0.0002403715
```

### (d) What is the fitted line for the multiple regression of BAC on Beers and Weight?

*Answer:* The fitted regression line is 
$$
\widehat{BAC} = \hat{\mu}(BAC | weight,beers) = 0.03986 + 0.01998(Beers) - 0.0003628(Weight)
$$

### (e) Predict the BAC for: John who weighs 160 lbs and drank 4 beers; and Bob who weighs 160 lbs and drank 5 beers. What is the difference in these predictions?

*Answer:* John's predicted BAC is 
$$
\widehat{BAC}_{john} = 0.03986 + 0.01998(4) - 0.0003628(160) = 0.061732
$$
Bob's predicted BAC is
$$
\widehat{BAC}_{bob} = 0.03986 + 0.01998(5) - 0.0003628(160) = 0.081712
$$
The difference in predicted BAC between Bob and John is
$$
\widehat{BAC}_{bob} - \widehat{BAC}_{john} = 0.081712 - 0.061732 = 0.01998
$$
If John and Bob both weigh 160 pounds but Bob drank one more beer than John, then we would predict Bob’s BAC to be 0.01998 units higher than John’s BAC. This is exactly the coefficient value for `Beers` in the model!.


```r
(john <- 0.03986 + 0.01998*4 - 0.0003628*160)
```

```
[1] 0.061732
```

```r
(bob <- 0.03986 + 0.01998*5 - 0.0003628*160)
```

```
[1] 0.081712
```

```r
bob - john
```

```
[1] 0.01998
```


### (f) Interpret the effect of Beers on BAC in context. 

*Answer:* One more beer increases predicted BAC by 0.01998 holding weight constant.

### (g) Interpret the effect of Weight on BAC in context. 

*Answer:* Holding the number of beers constant, the average BAC would be lowered by 0.00036 in we increase weight by 1 pound. Put another way, if John and Ann drank 4 beers but John weighs 30 pounds more than Ann, then we predict John’s BAC to be 0.0108 ($30 \times 0.00036$) units lower than Ann’s BAC.

### (h) Are the effects of Beers and Weight on BAC statistically significant?

*Answer:* Both number of beers and weight are statistically significant predictors of mean BAC (p-value < 0.0001).


```r
bac.lm3 <- lm(BAC ~ Beers + Weight + Gender, data=bac)
summary(bac.lm3)
```

```

Call:
lm(formula = BAC ~ Beers + Weight + Gender, data = bac)

Residuals:
      Min        1Q    Median        3Q       Max 
-0.018125 -0.005713  0.001501  0.007896  0.014655 

Coefficients:
              Estimate Std. Error t value Pr(>|t|)    
(Intercept)  3.871e-02  1.097e-02   3.528 0.004164 ** 
Beers        1.990e-02  1.309e-03  15.196 3.35e-09 ***
Weight      -3.444e-04  6.842e-05  -5.034 0.000292 ***
Gendermale  -3.240e-03  6.286e-03  -0.515 0.615584    
---
Signif. codes:  
0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Residual standard error: 0.01072 on 12 degrees of freedom
Multiple R-squared:  0.9528,	Adjusted R-squared:  0.941 
F-statistic: 80.81 on 3 and 12 DF,  p-value: 3.162e-08
```

### (i) Predict the BAC for: Barb who weighs 160 lbs, drank 4 beers and is female; and John who weighs 160 lbs, drank 4 beers and is male. What is the difference in these predictions?

*Answer:* Barb's predicted BAC is 
$$
\widehat{BAC}_{barb} = 0.03871 + 0.01990(4) - 0.0003444(160) - 0.003240(0) = 0.063206
$$
John's predicted BAC is
$$
\widehat{BAC}_{john} =  0.03871 + 0.01990(4) - 0.0003444(160) - 0.003240(1) = 0.059966
$$
The difference in predicted BAC between Bob and John is
$$
\widehat{BAC}_{bob} - \widehat{BAC}_{john} = 0.063206 - 0.059966 = 0.00324
$$
If John and Barb both weigh 160 pounds and drank 4 beers but Barb is female and John male,   then we would predict Barb’s BAC to be 0.00324 units higher than John’s BAC. This is exactly the coefficient value for `Gender` in the model!.


```r
(barb <- 0.03871 + 0.01990*4 - 0.0003444*160 - 0.003240*0)
```

```
[1] 0.063206
```

```r
(john <- 0.03871 + 0.01990*4 - 0.0003444*160 - 0.003240*1)
```

```
[1] 0.059966
```

```r
barb - john
```

```
[1] 0.00324
```

### (j) Interpret the effect of Gender on BAC in context. 

*Answer:* Holding weight and beers constant, we estimate that the
BAC of males is 0.0032 units lower than females on average.

### (k) Is the effect of Gender on BAC statistically signficant after accounting for weight and number of beers drank? 

*Answer:* No, the p-value of 0.6155 shows that there is no
statistically significant difference between the mean BAC of males and females after accounting for their weight and number of beers drank!
