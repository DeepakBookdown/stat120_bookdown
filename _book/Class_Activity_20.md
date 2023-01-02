# Class Activity 20

## Example 1:  A survey of university graduates was done to study how frequently they exercised. The survey was completed by 470 graduates. They were asked where they lived their senior year. Use the following data to determine whether there is an association between exercise on campus and students' living arrangements. 


\begin{tabular}{|c|c|c|c|c|} \hline
 & No regular exercise & Sporadic exercise & Regular exercise & Total \\  \hline
Dormitory & 32 & 30 & 28 & 90  \\ \hline 
On-Campus Apartment & 74 & 64 & 42 & 180  \\ \hline 
Off-campus Apartment & 110 & 25 & 15 & 150 \\ \hline 
At Home & 39 & 6 & 5 &  50 \\ \hline 
Total & 255 & 125 & 90 & 470 \\ \hline 
\end{tabular}

*Answer:* 

### Step 1:
$$\\[1in]$$

### Step 2:
$$\\[1in]$$

### Step 3:
$$\\[1in]$$

### Step 4:

$$\\[1in]$$

### Step 5:

$$\\[1in]$$



## Example 2: Does political comfort level depend on religion?

Next consider the survey questions about political comfort level and religion. We want know if the response to the comfort level question is associated with their religious practice. To test this question about **two cateogorical** variables with one variable containing at least **3 levels**, we must conduct a chi-square test for association. 

#### (a) Hypotheses
State the hypotheses for this test.

*Answer:* The null can be stated a couple of equivalent ways: There is no association between religion and comfort level;  the variables comfort level and religion are independent of one another; the distribution of comfort level is the same for all three religion types. 

The alternatives are just "not the null" statements: There is an association between religion and comfort level;  the variables comfort level and religion are dependent; the distribution of comfort level is the different for at least one religion type. 

#### (b) Data
Does the data suggest that there is an association between comfort level and religion? 


```r
library(forcats) 
survey <- read.csv("https://raw.githubusercontent.com/deepbas/statdatasets/main/Survey.csv")

# rename then reorder comfort level
summary(survey$Question.9)
```

```
   Length     Class      Mode 
      374 character character 
```

```r
levels(survey$Question.9) <- c("almost always", "rarely", "sometimes")
survey$Question.9 <- fct_relevel(survey$Question.9,
                      "almost always", "sometimes", "rarely") 
summary(survey$Question.9)  # always check work!
```

```
   almost always comfortable rarely, if ever, comfortable 
                         171                           51 
       sometimes comfortable                         NA's 
                         150                            2 
```


```r
counts <- table(survey$Question.8, survey$Question.9)
counts
```

```
                                               
                                                almost always comfortable
  not religious                                                       110
  religious and actively practicing my religion                        20
  religious but not actively practicing                                41
                                               
                                                rarely, if ever, comfortable
  not religious                                                           15
  religious and actively practicing my religion                           16
  religious but not actively practicing                                   20
                                               
                                                sometimes comfortable
  not religious                                                    81
  religious and actively practicing my religion                    25
  religious but not actively practicing                            44
```

```r
sum(counts)  # number of respondents
```

```
[1] 372
```

```r
prop.table(counts,1)  # dist of comfort level given religious level
```

```
                                               
                                                almost always comfortable
  not religious                                                0.53398058
  religious and actively practicing my religion                0.32786885
  religious but not actively practicing                        0.39047619
                                               
                                                rarely, if ever, comfortable
  not religious                                                   0.07281553
  religious and actively practicing my religion                   0.26229508
  religious but not actively practicing                           0.19047619
                                               
                                                sometimes comfortable
  not religious                                            0.39320388
  religious and actively practicing my religion            0.40983607
  religious but not actively practicing                    0.41904762
```

```r
library(ggplot2)
ggplot(survey, aes(x=Question.8, fill=Question.9)) +
  geom_bar(position="fill") +
  labs(fill = "Comfort level", x = "Religious level", y = "proportion", 
       title="Comfort level by religious level") +
    scale_x_discrete(labels = function(x) stringr::str_wrap(x, width = 16))
```

<img src="Class_Activity_20_files/figure-epub3/unnamed-chunk-2-1.png" width="100%" />


```r
library(tidyr)
survey_ex2 <- drop_na(survey, Question.8, Question.9) 
ggplot(survey_ex2, aes(x=Question.8, fill=Question.9)) +
  geom_bar(position="fill") +
  labs(fill = "Comfort level", x = "Religious level", y = "proportion", 
       title="Comfort level by religious level")+
    scale_x_discrete(labels = function(x) stringr::str_wrap(x, width = 16))
```

<img src="Class_Activity_20_files/figure-epub3/unnamed-chunk-3-1.png" width="100%" />

*Answer:* Yes, there is a much higher rate of "almost always comfortable" for the not religious respondents (53.4%) than those that are religious (not active: 32.8%; active: 39%).  

#### (c) Expected counts
Compute the expected number of "not religious" people who are "almost always comfortable".

*Answer:* There are 206 "not religious" respondents and the overall rate (ignoring religion) of "almost always comfortable" is about  46%. If the null is true (and religion doesn't relate to comfort level), the expected number is about
$$
206 \times \dfrac{171}{372} = 94.694
$$


```r
table(survey$Question.8)
```

```

                                not religious 
                                          206 
religious and actively practicing my religion 
                                           61 
        religious but not actively practicing 
                                          106 
```

```r
table(survey$Question.9)
```

```

   almost always comfortable rarely, if ever, comfortable 
                         171                           51 
       sometimes comfortable 
                         150 
```

```r
sum(counts)
```

```
[1] 372
```




#### (d) Chi-square contribution
What is the contribution to the chi-square test statistic from the "not religious"/"almost always comfortable" cell?

*Answer:* The contribution to the chi-square test stat from this category is 2.47.
$$
\dfrac{(110 - 94.6935484)^2}{94.6935484} = 2.474
$$


#### (e) Chi-square test
The `chisq.test(x,y)` can be used to give chi-square test results. For this version, `x` and `y` are categorical variables from a data set.

```r
ComfortReligion <- chisq.test(survey_ex2$Question.8, survey_ex2$Question.9)
ComfortReligion
```

```

	Pearson's Chi-squared test

data:  survey_ex2$Question.8 and survey_ex2$Question.9
X-squared = 21.362, df = 4, p-value = 0.0002684
```

- What is the chi-square test stat value?

*Answer:* The test stat value is 21.362

- How is the degrees of freedom of 4 calculated?

*Answer:* There are 3 categories for each variable, so the degrees of freedom will be $df = (3-1)(3-1) = 4$. 

- Interpret the p-value for this test.

*Answer:* If there is no association between comfort level and religiousness, then we would see a chi-square test stat of 21.362, or one even larger, only about 0.03% of the time. 

#### (f) Conclusion
What is your conclusion for this test?

*Answer:* We have strong evidence that there is an association between political comfort level and religiousness ($\chi^2 = 21.362$, df = 4, p-value = 3\times 10^{-4}).

#### (g) Expected counts
Are the expected counts large enough to use the chi-square distribution to compute the p-value?

```r
ComfortReligion$expected
```

```
                                               survey_ex2$Question.9
survey_ex2$Question.8                           almost always comfortable
  not religious                                                  94.69355
  religious and actively practicing my religion                  28.04032
  religious but not actively practicing                          48.26613
                                               survey_ex2$Question.9
survey_ex2$Question.8                           rarely, if ever, comfortable
  not religious                                                    28.241935
  religious and actively practicing my religion                     8.362903
  religious but not actively practicing                            14.395161
                                               survey_ex2$Question.9
survey_ex2$Question.8                           sometimes comfortable
  not religious                                              83.06452
  religious and actively practicing my religion              24.59677
  religious but not actively practicing                      42.33871
```

*Answer:* Yes, all expected counts are 5 or greater. 

#### (h) Simulated p-value
If you were concerned that the expected counts weren't large enough to trust using a chi-square distribution to compute a p-value, you can add a `simulate.p.value = TRUE` argument to use a randomization distribution to compute the p-value:

```r
chisq.test(survey_ex2$Question.8, survey_ex2$Question.9, simulate.p.value = TRUE)
```

```

	Pearson's Chi-squared test with simulated p-value
	(based on 2000 replicates)

data:  survey_ex2$Question.8 and survey_ex2$Question.9
X-squared = 21.362, df = NA, p-value = 0.0004998
```
The p-value is slightly different, but your conclusion should be the same.


#### (i) Where is the difference?
Use the grouped bar graph and conditional percents from part (b) to describe the association you (should have) found in part (f). To help quantify differences, compute a 95% confidence interval for the difference in the true proportions of "rarely comfortable" people in the not religious and actively religious groups. 

*Answer:* The largest test stat contributions comes from the not religious/rarely comfortable group and the active religious/rarely comfortable group. We can see that the not religious respondents have a low "rarely" comfortable level compared to religious groups (7.3% vs. 19% for active and 26.2% for not active) and they have a very high almost always comfortable level compared to religious groups (53.4% vs. 39% for active and 32.8% for not active).

If $p_{not.rel}$ and $p_{active}$ denote the true proportions of "rarely comfortable" for the not religious and active religious groups. We want a 95% CI for $p_{not.rel} - p_{active}$. The sample proportions are computed from the `counts` table (or the `prop.table` output). Of the 206 "not religous" respondents, 81 are rarely comfortable so 
$$\hat{p}_{not.rel} = \frac{100}{190} = 0.53$$
$$\hat{p}_{active} = \frac{20}{59} = 0.34$$


So a 95% CI for the difference in the true rates of rarely comfortable is
\begin{align*}
CI &= (0.53 - 0.34) \pm 1.96\cdot\sqrt{\frac{0.53(1-0.53)}{190} + \frac{0.34(1-0.34)}{59}}\\
&= (0.05, 0.33)
\end{align*}


- I am 95% confident that the percentage of all non-religious students who are almost always comfortable is between 5 and 33 percentage points higher than the actively religious students. 


## Example 3: Perry Preschool Project
In a 1962 social experiment, 123 3- and 4-year-old children from poverty-level families in Ypsilanti, Michigan, were randomly assigned either to a treatment group receiving 2 years of preschool instruction or to a control group receiving no preschool. The participants were followed into their adult years. The following table shows how many in each group were arrested for some crime by the time they were 19 years old. (*Time*, July 29, 1991).

\ | Arrested | Not Arrested | Total
- | -------- | ------------ | -----
Preschool | 19 | 42 | 61
Control | 32 | 30 | 62 
Total | 51 | 72 | 123 

Is a statistically significant difference between the rate of arrest (or no arrest) in the two treatment groups.

#### (a) Test choice
There are two categorical variables, each with two levels. We could either use a two sample test to compare proportions (groups: treatment, response: arrest outcome) OR we could use a chi-square test of independence. These tests will give identical results. For this example, we will use the chi-square test. State your hypotheses needed to test the question above.

*Answer:* The null hypothesis is that the treatment (preschool/control) is not related to the arrest outcome. 

#### (b) Chi-square test with summarized data
This example differs from example 2 because we have data in a summarized two-way table. (Example 2 had the raw categorical variables available.) To run the chi-square test, we first must create a matrix of counts using the `cbind` command that **binds** together **c**olumns of counts:

```r
counts <- cbind(c(19,32), c(42,30))
colnames(counts) <- c("arrested", "not arrested") # adds column names
rownames(counts) <- c("preschool", "control")  # adds row names
counts
```

```
          arrested not arrested
preschool       19           42
control         32           30
```
We then use this in the `chisq.test` command:

```r
preschool.test <- chisq.test(counts)
preschool.test
```

```

	Pearson's Chi-squared test with Yates' continuity
	correction

data:  counts
X-squared = 4.4963, df = 1, p-value = 0.03397
```

- Are the expected counts large enough to trust these results?

*Answer*: Yes, they are all above 25.


```r
51/123  # overall arrest rate
```

```
[1] 0.4146341
```

```r
72/123  # overall non arrest rate
```

```
[1] 0.5853659
```

```r
preschool.test$expected
```

```
          arrested not arrested
preschool 25.29268     35.70732
control   25.70732     36.29268
```

- What is your conclusion? 

*Answer:* There is some evidence of an association between the treatment (preschool/control) and the arrest outcome ($\chi^2 = 4.50$, df=1, p-value=0.034).

#### (c) How different?
How do the arrest rates differ for each treatment group? Compute a 95% confidence interval for the difference in arrest rates between those who had the preschool and control treatments.

```r
prop.table(counts,1)
```

```
           arrested not arrested
preschool 0.3114754    0.6885246
control   0.5161290    0.4838710
```

*Answer:* About 52% of the control group were arrested while only about 31% of the preschool group were arrested. 
$$
\hat{p}_{control} = \dfrac{32}{62} = 0.516129, \ \ \ \hat{p}_{preschool} = \dfrac{19}{61} = 0.3114754
$$



The 95% for the difference in true arrest rates $p_{control} - p_{preschool}$is 
\begin{align*}
0.516129 - 0.3114754 \pm & 1.96 \sqrt{\dfrac{0.516129(1-0.516129)}{62} + \dfrac{0.3114754(1-0.3114754)}{61}} \\
0.2046536 \pm & 1.96(0.0868549) \\
(0.034418, 0.3748892) \\
\end{align*}
We are 95% confident that the true rate of arrest for the preschool treatment is 3.4 to 37.5 percentage points lower than the arrest rate for the control group. This is evidence that the preschool treatment lowered the risk of arrest.


#### Comment
The `chisq.test` command uses a test stat "correction" when both of your categorical variables have only 2 levels. With this correction, your chi-square test results won't exactly match a two-sample test for the difference of two proportions. If you turn off the correct with `correct=FALSE` you will obtain identical results. 

```r
chisq.test(counts, correct=FALSE) # exact same as two-sample proportion test
```

```

	Pearson's Chi-squared test

data:  counts
X-squared = 5.3059, df = 1, p-value = 0.02125
```





