# Practice Problems 22

## Problem 1: Food Preferences

Suppose in a survey, 300 of the 1000 individuals preferred beef, 400 preferred chicken, and 300 preferred vegetarian meals. As researchers, we want to test the hypothesis that the proportions of individuals preferring each type of meal are equal ($p_{beef} = p_{chicken} = p_{vegetarian} = \frac{1}{3}$). Conduct an appropriate hypothesis test.


### (a) What are the null and alternate hypotheses?

<details><summary><red>Click for answer</red></summary>

*Answer:*

\begin{align*}
H_0 &: p_{\text{beef}} = p_{\text{chicken}} = p_{\text{vegetarian}} = \frac{1}{3} \\
H_a &: \text{At least one proportion is different}
\end{align*}

</details><br>



```r
# Observed counts
observed_counts <- c(300, 400, 300)

# Expected counts
expected_counts <- rep(1000 / 3, 3)

# Chi-square test statistic calculation
chi_square_stat <- sum((observed_counts - expected_counts)^2 / expected_counts)
chi_square_stat
```

```
[1] 20
```



### (b) Verify the above chi-square statistics calculation by hand.

<details><summary><red>Click for answer</red></summary>

*Answer:*

\begin{align*}
\chi^2 & = \sum \frac{(O - E)^2}{E} \\
& = \frac{(300 - 333.33)^2}{333.33} + \frac{(400 - 333.33)^2}{333.33} + \frac{(300 - 333.33)^2}{333.33} \\
& = \frac{(-33.33)^2}{333.33} + \frac{(66.67)^2}{333.33} + \frac{(-33.33)^2}{333.33} \\
& = \frac{1110.9889}{333.33} + \frac{4443.9489}{333.33} + \frac{1110.9889}{333.33} \\
& = 20
\end{align*}
</details><br>


The degrees of freedom corresponding to this test is 2 (categories - 1). So, the p-value can be calculated as:


```r
p_value <- 1 - pchisq(chi_square_stat, df = 2)
p_value
```

```
[1] 4.539993e-05
```


We can also do the test in R using the `chisq.test` function.


```r
chisq_test <- chisq.test(x = observed_counts)
chisq_test
```

```

	Chi-squared test for given probabilities

data:  observed_counts
X-squared = 20, df = 2, p-value = 4.54e-05
```

The chi-square test can also be performed using a randomization approach. By setting `simulate.p.value = TRUE` in the `chisq.test()` function, R will simulate p-values based on permutations of the data. This can be especially useful when the assumptions of the chi-square test are not met, such as when some expected counts are too small.


```r
set.seed(7)
chisq_test_simulated <- chisq.test(x = observed_counts, simulate.p.value = TRUE, B = 10000)
chisq_test_simulated
```

```

	Chi-squared test for given probabilities with
	simulated p-value (based on 10000 replicates)

data:  observed_counts
X-squared = 20, df = NA, p-value = 9.999e-05
```

By setting `B = 10000`, the function will use 10,000 permutations to compute the simulated p-value. This method can provide a more accurate p-value in situations where the traditional method might be questionable due to small expected counts. In the output of the above code, R will provide a chi-square statistic and a simulated p-value based on 10,000 permutations. Since this simulated p-value (0.0001) is significantly smaller than 0.05, it suggests that the null hypothesis is rejected in favor of the alternate hypothesis, meaning there is evidence to suggest at least one proportion is different from the others.




### (c) Write the conclusion of the hypothesis test.

<details><summary><red>Click for answer</red></summary>

*Answer:*

We reject the null hypothesis ($\chi^2 = 20.000, df = 2, p-value < 0.05$). There is statistically discernible evidence that the proportions of individuals preferring each type of meal are not equal.
</details><br>


## Problem 2: Transportation Preferences

Suppose in a city survey, 200 of the 800 individuals preferred cars, 400 preferred bicycles, and 200 preferred public transportation for commuting. We want to test the hypothesis that the proportions of individuals preferring each type of transportation are $p_{car} = 0.2, p_{bicycle} = 0.6, p_{public} = 0.2$. Conduct an appropriate hypothesis test.

### (a) What are the null and alternate hypotheses?

<details><summary><red>Click for answer</red></summary>

*Answer:*

\begin{align*}
H_0 &: p_{\text{car}} = 0.2, \quad p_{\text{bicycle}} = 0.6, \quad p_{\text{public}} = 0.2 \\
H_a &: \text{At least one proportion is different}
\end{align*}

</details><br>



```r
# Observed counts
observed_counts <- c(200, 400, 200)

# Expected counts
expected_counts <- c(800 * 0.2, 800 * 0.6, 800 * 0.2)

# Chi-square test statistic calculation
chi_square_stat <- sum((observed_counts - expected_counts)^2 / expected_counts)
chi_square_stat
```

```
[1] 33.33333
```




### (b) Verify the above chi-square statistics calculation by hand.

<details><summary><red>Click for answer</red></summary>

*Answer:*

\begin{align*}
\text{Observed counts} & : O_{\text{car}} = 200, \quad O_{\text{bicycle}} = 400, \quad O_{\text{public}} = 200 \\
\text{Expected counts} & : E_{\text{car}} = 800 \cdot 0.2 = 160, \quad E_{\text{bicycle}} = 800 \cdot 0.6 = 480, \quad E_{\text{public}} = 800 \cdot 0.2 = 160 \\
\chi^2 & = \sum \frac{(O - E)^2}{E} \\
& = \frac{(200 - 160)^2}{160} + \frac{(400 - 480)^2}{480} + \frac{(200 - 160)^2}{160} \\
& \approx 33.333
\end{align*}

</details><br>


The degrees of freedom corresponding to this test is 2 (categories - 1). So, the p-value can be calculated as:


```r
p_value <- 1 - pchisq(chi_square_stat, df = 2)
p_value
```

```
[1] 5.777749e-08
```

We can also do the test in R using the `chisq.test` function.


```r
chisq_test <- chisq.test(x = observed_counts, p = c(0.2, 0.6, 0.2))
chisq_test
```

```

	Chi-squared test for given probabilities

data:  observed_counts
X-squared = 33.333, df = 2, p-value = 5.778e-08
```

### (c) Write the conclusion of the hypothesis test.

<details><summary><red>Click for answer</red></summary>

*Answer:*

We reject the null hypothesis ($\chi^2 = 33.333, df = 2, p-value < 0.05$). There is statistically discernible evidence that the proportions of individuals preferring each type of transportation are not as stated in the null hypothesis.

</details><br>



