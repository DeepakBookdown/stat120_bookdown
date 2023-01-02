# Class Activity 17


## Example 1:  Change in gun ownership 

A 2016 study described in The Guardian found that a random sample of US adults in 1994 found a female rate of gun ownership of 9%. A similar random sample in 2015 found the rate of female gun ownership rose to 12%. In the section 3.2 handout, we assumed that the SE for the difference in these two sample proportions is 2%. Show how this SE was computed using the appropriate SE formula from chapter 6. Assume that the sample sizes in both 1994 and 2015 were 500.

*Answer:*


We have a 1994 sample proportion of $\hat{p}_{1994} = 0.09$  and a 2015 sample proportion of $\hat{p}_{2015} = 0.12$ . The SE of the difference in two sample proportions for a confidence interval is given by:

$$SE = \sqrt{\frac{\hat{p}_{1994} (1 - \hat{p}_{1994} )}{n_{1994}} + \frac{\hat{p}_{2015} (1 - \hat{p}_{2015} )}{n_{2015}}} = 0.0194 \approx 0.02 $$



## Example 2:  Accuracy of Lie Detectors

Participants in a study to evaluate the accuracy of lie detectors were divided into two groups, with one group reading true material and the other group reading false material, while connected to a lie detector.  Both groups received electric shocks to add stress.  The two way table indicates whether the participants were lying or telling the truth and also whether the lie detector indicated they were lying or not.  


\begin{tabular}{|c|c|c|c|} \hline
& {Detector Says Lying} & {Detector Says Not} & {Total}\\  \hline
{Person Lying} & 31 & 17 & 48 \\ \hline
{Person Not Lying} & 27 & 21 & 48 \\ \hline
{Total} & 58 & 38 & 96 \\ \hline
\end{tabular}


### (a)  Are the conditions met for using the normal distribution?


*Answer:* Yes (all cell counts at least 10)


### (b) Find the three sample proportions for the proportion of times the lie detector says the person is lying (the proportion for the lying people, the proportion for the truthful people, and the pooled proportion).


*Answer:* We see that the proportion for the lying people is $\hat{p}_L = \frac{31}{48}= 0.6458$, the proportion for the not lying people is $\hat{p}_N = 0.5625$ , and the pooled proportion for all 96 people is $\hat{p} = \frac{58}{96}= 0.6042$.


### (c) Test to see if there is a difference in the proportion of times the lie detector says the person is lying, depending on whether the person is lying or telling the truth.  Show all details of the hypothesis test.
  

*Answer:*

We are testing $H_0:p_L = p_N$   vs   $H_a:p_L \neq p_N$.    

The test statistic is

$$z = \frac{statistic-null}{SE} = \frac{(\hat{p}_L - \hat{p}_N) - 0}{\sqrt{\frac{\hat{p}(1-\hat{p})}{n_l} + \frac{\hat{p}(1-\hat{p})}{n_N}}} = \frac{0.6458 - 0.5625}{\sqrt{\frac{0.6042(1-0.6042)}{48}} + \frac{0.6042*(1-0.6042)}{48}} = 0.834 $$

This is a two-tail test, and the area to the right of 0.834 in a normal distribution is 0.202 (1-pnorm(0.834)), so the p-value is  2(0.202) = 0.404. The R command is: 2*(1-pnorm(0.834))


We fail to reject H0 and conclude that there is not enough evidence that a lie detector can tell whether a person is lying or telling the truth.  


## Example 3:  Smoking and Pregnancy Rate?

Does smoking negatively affect a person’s ability to become pregnant?  A study collected data on 678 women who were trying to get pregnant.  The two-way table shows the proportion who successfully became pregnant during the first cycle trying and smoking status.  Find a 90% confidence interval for the difference in proportion of women who get pregnant, between smokers and non-smokers.  Interpret the interval in context.  

\begin{tabular}{|c|c|c|c|} \hline
& {Smoker} & {Non-smoker} & {Total}\\  \hline
{Pregnant} & 38 & 206 & 244 \\ \hline
{Not Pregnant} & 97 & 337 & 434 \\ \hline
{Total} & 135 & 543 & 678 \\ \hline
\end{tabular}
\normalsize

The conditions are met for using the normal distribution (at least 10 values in each cell of the table).  We see that the proportion of smokers who got pregnant is 38/135 = 0.281 while the proportion of non-smokers who got pregnant is 206/543 = 0.379.  The confidence interval is given by:

$$statistic \pm z^* \cdot SE $$
$$(\hat{p}_S - \hat{p}_N) \pm z^* \cdot \sqrt{\frac{\hat{p}_S(1- \hat{p}_S)}{n_S} + \frac{\hat{p}_N(1- \hat{p}_N)}{n_N}} $$

$$(0.281 - 0.379) \pm 1.645\cdot \sqrt{\frac{0.281(1-0.281)}{135} + \frac{0.379(1-0.379)}{543}} $$
$$-0.098 \pm 0.072 = (-0.170, -0.026) $$
We are 90% sure that the proportion of smokers who get pregnant in the first cycle is between 0.170 and 0.026 less than the proportion of non-smokers who get pregnant on the first cycle.   Note that if we had subtracted the other way, the interval would have only positive values, but the interpretation would be the same.




## Example 4: Florida Lakes pH

The textbook dataset `FloridaLakes` contains data on 53 lakes in Florida. We want to know if the average pH of lakes in Florida is different from a neutral value of 7. 


```r
lakes <- read.csv("http://www.lock5stat.com/datasets1e/FloridaLakes.csv")
head(lakes)
```

```
  ID         Lake Alkalinity  pH Calcium Chlorophyll
1  1    Alligator        5.9 6.1     3.0         0.7
2  2        Annie        3.5 5.1     1.9         3.2
3  3       Apopka      116.0 9.1    44.1       128.3
4  4 Blue Cypress       39.4 6.9    16.4         3.5
5  5        Brick        2.5 4.6     2.9         1.8
6  6       Bryant       19.6 7.3     4.5        44.1
  AvgMercury NumSamples MinMercury MaxMercury
1       1.23          5       0.85       1.43
2       1.33          7       0.92       1.90
3       0.04          6       0.04       0.06
4       0.44         12       0.13       0.84
5       1.20         12       0.69       1.50
6       0.27         14       0.04       0.48
  ThreeYrStdMercury AgeData
1              1.53       1
2              1.33       0
3              0.04       0
4              0.44       0
5              1.33       1
6              0.25       1
```

#### (a) EDA 

Always plot your data and get summary stats:


```r
hist(lakes$pH)
```

<img src="Class_Activity_17_files/figure-epub3/unnamed-chunk-2-1.png" width="100%" />

```r
mean(lakes$pH)
```

```
[1] 6.590566
```

```r
sd(lakes$pH)
```

```
[1] 1.288449
```

- What are the sample mean and standard deviation? Use appropriate notation.
- Can we use t-inference methods with the pH variable?

*Answer:* The average pH was $\bar{x} = 6.591$ with a standard deviation of $s=1.288$. The distribution of pH is symmetric with no outliers, so we can use t-inference methods.  


#### (b) SE for the sample mean

What is the estimated SE for the sample mean?

*Answer:* The estimated SE for the sample mean is $SE_{\bar{x}} = 0.1770$.

```r
sd(lakes$pH)/sqrt(53)
```

```
[1] 0.1769821
```

#### (c) t-test statistic
Using your SE from (b) to compute the t-test statistic for testing if the population mean pH is equal, or not, to 7. Write down your hypotheses then show how the t test statistic is calculated. Interpret this value in context. 

*Answer:* The hypotheses are $H_0: \mu = 7$ vs $H_A: \mu \neq 7$. The test stat is 

$$
t = \dfrac{6.591 - 7}{1.288/\sqrt{53}} = -2.3134
$$

The observed mean of 6.591 is 2.3 SEs below the hypothesized mean of 7.

```r
(mean(lakes$pH) - 7)/(sd(lakes$pH)/sqrt(53)) 
```

```
[1] -2.31342
```

### (d) One-sample t-test
The function `t.test(x, mu=)` can be used for a one sample test comparing the sample mean of `x` to the hypothesized value given to  `mu=`. Here we are testing whether the population mean is equal to 7 or not:


```r
t.test(lakes$pH, mu = 7)
```

```

	One Sample t-test

data:  lakes$pH
t = -2.3134, df = 52, p-value = 0.02469
alternative hypothesis: true mean is not equal to 7
95 percent confidence interval:
 6.235425 6.945707
sample estimates:
mean of x 
 6.590566 
```

- What is the t test stat given in the output? Verify that it matches your answer to (c), within reasonable rounding error.

*Answer:* The test stat  is -2.31. 

- What is the p-value for the test? Interpret this value.

*Answer:* The p-value is 0.025. If the mean pH of all lakes is 7, then we would see a sample mean that is at least 2.31 SEs away from 7 about 2.5% of the time in samples of 53 lakes. 

- What is your test conclusion?

*Answer:* There is a statistically significant difference between the observed mean pH of 6.591 and the hypothesized mean of 7 (t=-2.31, df=52, p=0.025).


#### (e) One-sample t confidence interval
What is the 95% confidence interval for the population mean pH? Interpret this CI. 

*Answer:* We are 95% confident that the mean pH of all lakes in Florida is between 6.24 and 6.95.

#### (f) `qt` and `pt`

Show how to compute the p-value for your test in (d) using the `pt` command. Then show how the confidence interval in (e) is computed with a `qt` value. 

*Answer:* For the two-sided test, the p-value is twice the proportion below the test stat $t=-2.313$ under a t-distribution with $df=53-1=52$


```r
2*pt(-2.313,df=52)
```

```
[1] 0.02471195
```

For a 95% CI, we get the 97.5th percentile from the same t-distribution


```r
qt(.975,52)
```

```
[1] 2.006647
```


## Example 5:  API

The Academic Performance Index (API) is computed for all California schools. It is a number, ranging from a low of 200 to a high of 1000, that reflects a school's performance on a statewide standardized test (http://api.cde.ca.gov). We have a SRS of 200 schools and are interested in how a school's performance is related to the wealth of its students. The variable `growth` measures the growth in API from 1999 to 2000 (API 2000 - API 1999). 


```r
api <- read.csv("http://people.carleton.edu/~kstclair/data/api.csv")
```

#### (a) Categorizing wealth

Let's define a school as "low wealth" if over 50% of its students are eligible for subsidized `meals` and "high wealth" otherwise. We can use an `ifelse` command to create a variable `wealth` that measures this:


```r
api$wealth <- ifelse(api$meals > 50, "low","high")
table(api$wealth)
```

```

high  low 
 102   98 
```

```r
library(dplyr)
api %>% group_by(wealth) %>% summarize(mean(growth), sd(growth))
```

```
# A tibble: 2 × 3
  wealth `mean(growth)` `sd(growth)`
  <chr>           <dbl>        <dbl>
1 high             25.2         28.8
2 low              38.8         30.0
```

```r
boxplot(growth ~ wealth, data=api, xlab="API growth (2000 - 1999)" , horizontal=T)
```

<img src="Class_Activity_17_files/figure-epub3/unnamed-chunk-9-1.png" width="100%" />

- How many schools are "low" and "high" wealth.
- Are wealth and API growth related?
- What is the observed difference in mean API growth between high and low wealth schools. Use correct notation. 
- Can we use t-inference methods to compare mean growths?

*Answer:* There are $n_h = 102$ "high" wealth and $n_l = 98$ "low" wealth schools. The low wealth schools tend to have higher (and more variable) growth than high wealth schools. The difference in observed mean API growth between high and low growth schools is $\bar{x}_h - \bar{x}_l = 25.24510 - 38.82653  = -13.58$. We can use t-methods since both samples sizes (98 and 102) can be deemed large and there isn't severe skewness,  but there are two extreme outliers that will be addressed below.

#### (b) SE for the sample mean difference

What is the estimated SE for the sample mean difference?

*Answer:* The SE for the mean difference is 4.1544:

$$
SD_{\bar{x}_h - \bar{x}_l} = \sqrt{\dfrac{28.75380^2}{102} + \dfrac{29.95048^2}{98}} = 4.1544
$$

```r
sqrt(28.75380^2/102 +  29.95048^2/98)
```

```
[1] 4.154404
```

#### (c) t-test statistic
Using your SE from (b) to compute the t-test statistic that can be used to determine if mean API growth differs for low and high wealth schools. Write down your hypotheses then show how the t test statistic is calculated. Interpret this value in context. 

*Answer:* The hypotheses are $H_0: \mu_h - \mu_l = 0$ vs $H_A: \mu_h - \mu_l \neq 0$. The test stat is 

$$t = \dfrac{(25.24510 - 38.82653) - 0}{4.154404} = -3.2692$$

The observed mean difference  is 3.3 SEs below the hypothesized mean difference of 0.


```r
((25.24510 - 38.82653) - 0)/4.154404 
```

```
[1] -3.269164
```

#### (d) Two-sample t-test
Is there evidence that mean API growth differs for low and high wealth schools? Give the hypotheses for this test, then run the `t.test(y ~ x, data=)` command below to conduct a t-test to give a p-value and conclusion. 


```r
t.test(growth ~ wealth, data=api)
```

```

	Welch Two Sample t-test

data:  growth by wealth
t = -3.2692, df = 196.71, p-value = 0.001273
alternative hypothesis: true difference in means between group high and group low is not equal to 0
95 percent confidence interval:
 -21.774321  -5.388544
sample estimates:
mean in group high  mean in group low 
          25.24510           38.82653 
```

- What is the t test stat given in the output? Verify that it matches your answer to (c), within reasonable rounding error.

*Answer:* The test stat matches, $t = -3.2692$.

- What is the p-value for the test? Interpret this value.

*Answer:* The p-value is 0.001273. If there is no difference between mean growth in the two populations, then there is just a 0.13% chance of seeing a sample mean difference that is 3.27 standard errors or more away from 0.

- What is your test conclusion?

*Answer:* We have strong evidence to suggest that the average API growth in low and high wealth schools are not the same.

#### (e)  Consider outliers
The boxplot in (a) shows a number of outliers for the `high` wealth group, but two cases in particular were very high. Suppose we omitted these two (most) extreme cases when running the test in (d). Will the p-value for this test be smaller or larger than the p-value computed in part (d)? Explain.

*Answer:* Removing the two large outliers which will both reduce the mean in the high group and reduce the SD in the high group. Both actions will magnify the difference in mean growth between the high and low groups (increasing the difference and decreasing the SE), so the test stat will increase in magnitude and the p-value will decrease. 

#### (f) Check outlier influence

To omit these cases we have to find their row numbers, then `subset` them out of the data:

```r
which(api$growth > 120 )
```

```
[1]  74 119
```

```r
api %>% slice(74,119)  # another dplyr package command
```

```
           cds stype            name                 sname
1 5.471911e+13     E Lincoln Element    Lincoln Elementary
2 1.975342e+13     E Washington Elem Washington Elementary
  snum                   dname dnum       cname cnum flag
1 5873 Exeter Union Elementary  226      Tulare   53   NA
2 2543   Redondo Beach Unified  585 Los Angeles   18   NA
  pcttest api00 api99 target growth sch.wide comp.imp both
1      98   693   504     15    189      Yes      Yes  Yes
2     100   745   615      9    130      Yes      Yes  Yes
  awards meals ell yr.rnd mobility acs.k3 acs.46 acs.core
1    Yes    50  18   <NA>        9     18     NA       NA
2    Yes    41  20   <NA>       16     19     30       NA
  pct.resp not.hsg hsg some.col col.grad grad.sch avg.ed
1       93      28  23       27       14        8   2.51
2       81      11  26       32       16       16   2.99
  full emer enroll api.stu    pw  fpc wealth
1   91    9    196     177 30.97 6194   high
2  100    3    391     313 30.97 6194   high
```

```r
t.test(growth ~ wealth, data = api, subset = -c(74,119))
```

```

	Welch Two Sample t-test

data:  growth by wealth
t = -4.395, df = 174.97, p-value = 1.916e-05
alternative hypothesis: true difference in means between group high and group low is not equal to 0
95 percent confidence interval:
 -23.571116  -8.961945
sample estimates:
mean in group high  mean in group low 
          22.56000           38.82653 
```

- How does the t-test stat change when omitting these two changes? Why does it change in this direction?
- Check your answer here with your anwer in part (e)!

*Answer:* Without these outliers, the p-value decreases to 0.00001916 and we have even stronger evidence for a difference in mean API growth. Why does the p-value decrease? Omitting the two outliers will  decrease the sample SD for the high group, which in turn will (slightly) decrease the SE for the difference in means. Omitting the two outliers will also decrease the sample mean for the high group (from 25.24510 to 22.56000), which will make the observed difference in means larger in magnitude (from -13.58 to -16.27). The test stat gets even further from 0  (drops from -3.2692 to -4.395), meaning the observed difference with outliers omitted is further away from 0 (in terms of SEs) than it was when all data points were included. This means that the p-value will decrease  (from 0.0013 to 0.00002) since the data is deemed more ``extreme" under the null hypothesis.


#### (g)  95% confidence interval

Compare the two 95% CI given in the output (with and without outliers). Explain how and why the CIs change after omitting these two outliers.  

*Answer:* Without outliers: -23.57 to -8.96 and with outliers: -21.77 to  -5.39. An mentioned above, omitting the two points makes the difference in means further away from 0. This shifts the CI further from a difference of 0. Removing the outliers also decrease the SE of our sample difference, so the margin of error for the interval without outliers is, roughly, 7 while the margin of error with outliers is, roughly, 8. 

#### (h)  Interpret two-sample CI

Using the results without the two outliers, interpret the 95% CI given in this output. Do not use the word ``difference'' in your answer.

*Answer:* We are 95% confident that the mean API growth between 1999 and 2000 for all low wealth schools is anywhere from 8.96 points to 23.57 points higher than the mean API growth for all high wealth schools in California.



