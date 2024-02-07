# Practice Problems 15


## Problem 1: Student Survey

This example explores the survey dataset from the MASS package, with a focus on the `Height` and `Age` variables. First, let's examine the survey dataset, paying special attention to `Height` and `Age`:



```r
survey <- MASS::survey # load the data
summary(survey$Age)
```

```
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  16.75   17.67   18.58   20.37   20.17   73.00 
```

```r
summary(survey$Height)
```

```
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's 
  150.0   165.0   171.0   172.4   180.0   200.0      28 
```

### (a). Proportion Below a Given Value

**Q1:** What proportion of individuals have a height below 160 cm, based on our sample?

Hint: Calculate the mean and standard deviation for the `Height` variable first.

<details><summary><red>Click for answer</red></summary>


```r
# Mean and standard deviation for Height
Height_mean <- mean(survey$Height, na.rm = TRUE)
Height_sd <- sd(survey$Height, na.rm = TRUE)

# Proportion below 160 cm
pnorm(160, mean = Height_mean, sd =Height_sd)
```

```
[1] 0.1043305
```

</details><br>

### (b). Determining a Specific Percentile

**Q2:** What is the age cutoff for the lower 75% of our sample distribution?

Hint: Determine the mean and standard deviation of the `Age` variable to find the age at the 75th percentile.

<details><summary><red>Click for answer</red></summary>


```r
# Mean and standard deviation for Age
age_mean <- mean(survey$Age, na.rm = TRUE)
age_sd <- sd(survey$Age, na.rm = TRUE)

# Age at the 75th percentile
qnorm(0.75, mean = age_mean, sd = age_sd)
```

```
[1] 24.74139
```

</details><br>

### (c). Calculating the Middle 95 Percentile for Age

**Q3:** What are the age cutoffs that define the middle 95% of our sample distribution?

*Hint: Calculate the 5th and 95th percentiles for the `Age` variable to find the ages that bound the middle 95% of the distribution.*

<details><summary><red>Click for answer</red></summary>


```r
# Age at the 25th percentile
age_25th <- qnorm(0.05, mean = age_mean, sd = age_sd)
age_25th
```

```
[1] 9.725181
```

```r
# Age at the 75th percentile
age_75th <- qnorm(0.95, mean = age_mean, sd = age_sd)
age_75th
```

```
[1] 31.02385
```


</details><br>



## Problem 2: SAT Verbal scores

Suppose that the verbal SAT scores in a population are normally distributed with a mean $\mu=580$ and standard deviation $\sigma = 70$. If $X$ is shorthand for a verbal SAT score, then we can write this as $X \sim N(580,70)$.

#### (a) What proportion of scores are above 650?

<details><summary><red>Click for answer</red></summary>
*Answer:* About 15.9% of the scores are above 650.


```r
pnorm(650,mean=580,sd=70) # proportion below
```

```
[1] 0.8413447
```

```r
1-pnorm(650,mean=580,sd=70) # proportion above
```

```
[1] 0.1586553
```
</details><br>


#### (b) What is the 25th percentile (Q1)?

<details><summary><red>Click for answer</red></summary>
*Answer:* The score of about 533 is the 25th percentile, meaning 25% of the scores are below this value.


```r
qnorm(.25,mean=580,sd=70)
```

```
[1] 532.7857
```
</details><br>

#### (c) What is the IQR for verbal SAT scores in this population? (Hint: find Q1 and Q3)

<details><summary><red>Click for answer</red></summary>
*Answer:* The 25th percentile (Q1) is 533 and the 75th percentile (Q3) is 627. The IQR for this normally distributed variable is about 94 points.


```r
q1 <- qnorm(.25,mean=580,sd=70);q1
```

```
[1] 532.7857
```

```r
q3 <- qnorm(.75,mean=580,sd=70);q3
```

```
[1] 627.2143
```

```r
q3-q1
```

```
[1] 94.42857
```
</details><br>

#### (d) What score, high or low, will be deemed an outlier according the boxplot rules for outliers?

<details><summary><red>Click for answer</red></summary>
*Answer:* Using the 1.5IQR's boxplot rule gives a lower fence of 392 and an upper fence of 768. So any score below 392 and above 768 will be called an outlier according to this rule.


```r
1.5*94
```

```
[1] 141
```

```r
q1 - 1.5*94
```

```
[1] 391.7857
```

```r
q3 + 1.5*94
```

```
[1] 768.2143
```

</details><br>

#### (e) What percent of the population will be deemed an outlier?

<details><summary><red>Click for answer</red></summary>
*Answer:* We need to find the proportion of scores below 392 and above 768. With this symmetric distribution, we find about 0.004 in both tails. About 0.8% of the population will be deemed outliers according to the boxplot rule.


```r
pnorm(392,mean=580,sd=70)
```

```
[1] 0.003618747
```

```r
1-pnorm(768,mean=580,sd=70)
```

```
[1] 0.003618747
```
</details><br>


## Problem 3: Standard Normal

The standard normal distribution has a mean of 0 and standard deviation of 1.

#### (a) What percent of SAT scores are at least 1 standard deviation above average?

<details><summary><red>Click for answer</red></summary>


```r
pnorm(1)  # proportion below
```

```
[1] 0.8413447
```

```r
1-pnorm(1) # proportion above
```

```
[1] 0.1586553
```


*Answer:* About 16% of scores will be at least 1 standard deviation above average. (Note that the score of 580+70 = 650 is 1 standard deviation above average.)
</details><br>

#### (b) How many standard deviations away from average is the 25th percentile of SAT scores?

<details><summary><red>Click for answer</red></summary>
*Answer:* The 25th percentile of SAT scores (or any normally distributed values) is 0.67 standard deviations below average. We could also find this value using our answer to (1b):


```r
qnorm(.25)
```

```
[1] -0.6744898
```


$$
z = \dfrac{533 - 580}{70} = -0.67
$$


```r
(533 - 580)/70
```

```
[1] -0.6714286
```

</details><br>


