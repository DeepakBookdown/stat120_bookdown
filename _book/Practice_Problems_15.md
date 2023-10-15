# Practice Problems 15


## Problem 1: SAT Verbal scores

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


## Problem 2: Standard Normal

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


